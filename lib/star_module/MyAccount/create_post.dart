import 'dart:io';
import 'package:flutter/material.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:image_picker/image_picker.dart';

enum PostType { bits, stills, longVideos }

class _StillImageTag {
  const _StillImageTag({required this.name, required this.position});

  final String name;
  final Offset position; // Normalized 0..1 offset inside image preview.
}

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  PostType _selectedType = PostType.stills;

  final Map<PostType, int> _monthlyUsage = {
    PostType.stills: 0,
    PostType.bits: 0,
    PostType.longVideos: 0,
  };

  final ImagePicker _picker = ImagePicker();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _aiPersonaController = TextEditingController();

  final FocusNode _postTypeFocus = FocusNode();
  final FocusNode _mediaFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  final FocusNode _aiPersonaFocus = FocusNode();

  bool scheduleLater = false;
  DateTime? scheduledDate;
  TimeOfDay? scheduledTime;

  List<XFile> selectedMedia = [];
  int _selectedStillIndex = 0;

  final Map<String, List<_StillImageTag>> _stillTagsByMediaPath = {};
  final List<String> _tagPeople = const [
    'Ranjith',
    'Aarav',
    'Diya',
    'Karthik',
    'Meera',
    'Priya',
    'Sanjay',
    'Ananya',
    'Vikram',
    'Neha',
  ];

  int _monthlyLimit(PostType type) {
    switch (type) {
      case PostType.stills:
        return 4;
      case PostType.bits:
        return 2;
      case PostType.longVideos:
        return 1;
    }
  }

  int _monthlyCount(PostType type) => _monthlyUsage[type] ?? 0;

  bool _isMonthlyLimitReached(PostType type) {
    return _monthlyCount(type) >= _monthlyLimit(type);
  }

  String _monthlyUsageLabel(PostType type) {
    return '${_monthlyCount(type)}/${_monthlyLimit(type)} monthly';
  }

  String _postTypeLabel(PostType type) {
    switch (type) {
      case PostType.stills:
        return "Stills";
      case PostType.bits:
        return "Bits";
      case PostType.longVideos:
        return "Long Videos";
    }
  }

  Future<void> _pickImages() async {
    final images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      setState(() {
        selectedMedia.addAll(images);
        if (selectedMedia.isNotEmpty &&
            _selectedStillIndex >= selectedMedia.length) {
          _selectedStillIndex = selectedMedia.length - 1;
        }
      });
    }
  }

  Future<void> _pickVideos() async {
    final videos = await _picker.pickMultipleMedia();
    setState(() {
      selectedMedia = videos
          .where((e) => e.mimeType?.startsWith('video') ?? false)
          .toList();
    });
  }

  void _onCreatePost() {
    if (_isMonthlyLimitReached(_selectedType)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Monthly limit reached for ${_postTypeLabel(_selectedType)}',
          ),
        ),
      );
      return;
    }

    debugPrint("Post Type: $_selectedType");
    debugPrint("Media Count: ${selectedMedia.length}");
    if (_selectedType == PostType.stills) {
      _stillTagsByMediaPath.forEach((path, tags) {
        final names = tags.map((tag) => tag.name).join(', ');
        debugPrint('Tagged on $path: $names');
      });
    }
    debugPrint("Description: ${_descriptionController.text}");
    debugPrint("AI Persona Description: ${_aiPersonaController.text}");
    debugPrint("Schedule Later: $scheduleLater");

    setState(() {
      _monthlyUsage[_selectedType] = _monthlyCount(_selectedType) + 1;
    });
  }

  XFile? get _activeStill {
    if (_selectedType != PostType.stills || selectedMedia.isEmpty) {
      return null;
    }

    if (_selectedStillIndex < 0 ||
        _selectedStillIndex >= selectedMedia.length) {
      _selectedStillIndex = 0;
    }
    return selectedMedia[_selectedStillIndex];
  }

  List<_StillImageTag> _tagsForPath(String mediaPath) {
    return _stillTagsByMediaPath[mediaPath] ?? const [];
  }

  Future<String?> _showTagPeoplePicker() async {
    final searchController = TextEditingController();
    final searchFocus = FocusNode();

    final selectedName = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? kblackColor
          : kwhiteColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setLocalState) {
            final query = searchController.text.trim().toLowerCase();
            final filtered = _tagPeople
                .where((name) => name.toLowerCase().contains(query))
                .toList();

            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 12,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tag people',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: kgoldColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: searchController,
                      focusNode: searchFocus,
                      onChanged: (_) => setLocalState(() {}),
                      decoration: InputDecoration(
                        hintText: 'Search person',
                        prefixIcon: const Icon(Icons.search, color: kgoldColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: kgoldColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: kgoldColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 300),
                      child: filtered.isEmpty
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Text('No matching people found'),
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              itemCount: filtered.length,
                              separatorBuilder: (_, __) =>
                                  const Divider(height: 1),
                              itemBuilder: (context, index) {
                                final name = filtered[index];
                                return ListTile(
                                  leading: const CircleAvatar(
                                    backgroundColor: kgoldColor,
                                    child: Icon(
                                      Icons.person,
                                      color: kblackColor,
                                    ),
                                  ),
                                  title: Text(name),
                                  onTap: () => Navigator.pop(context, name),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    searchController.dispose();
    searchFocus.dispose();
    return selectedName;
  }

  Future<void> _onStillPreviewTap(
    TapDownDetails details,
    BoxConstraints constraints,
  ) async {
    final file = _activeStill;
    if (file == null) return;

    final selectedName = await _showTagPeoplePicker();
    if (selectedName == null || !mounted) return;

    final normalized = Offset(
      (details.localPosition.dx / constraints.maxWidth).clamp(0.0, 1.0),
      (details.localPosition.dy / constraints.maxHeight).clamp(0.0, 1.0),
    );

    setState(() {
      final current = List<_StillImageTag>.from(_tagsForPath(file.path));
      current.add(_StillImageTag(name: selectedName, position: normalized));
      _stillTagsByMediaPath[file.path] = current;
    });
  }

  void _openTagListForActiveStill() {
    final file = _activeStill;
    if (file == null) return;

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? kblackColor
          : kwhiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        final tags = _tagsForPath(file.path);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tagged people (${tags.length})',
                  style: const TextStyle(
                    color: kgoldColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                if (tags.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('No tags yet. Tap on image to tag people.'),
                  )
                else
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 280),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: tags.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final tag = tags[index];
                        return ListTile(
                          leading: const Icon(
                            Icons.person_pin,
                            color: kgoldColor,
                          ),
                          title: Text(tag.name),
                          subtitle: Text(
                            'x ${(tag.position.dx * 100).round()}%  y ${(tag.position.dy * 100).round()}%',
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                final current = List<_StillImageTag>.from(
                                  _tagsForPath(file.path),
                                );
                                current.removeAt(index);
                                if (current.isEmpty) {
                                  _stillTagsByMediaPath.remove(file.path);
                                } else {
                                  _stillTagsByMediaPath[file.path] = current;
                                }
                              });
                              Navigator.pop(context);
                              _openTagListForActiveStill();
                            },
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark ? kblackColor : kwhiteColor;
    final textColor = isDark ? kwhiteColor : kblackColor;
    final borderColor = isDark ? kwhiteColor : kblackColor;

    return Scaffold(
      backgroundColor: isDark ? kblackColor : kwhiteColor,
      appBar: AppBar(
        backgroundColor: isDark ? kblackColor : kwhiteColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: kgoldColor, size: 18),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Publish",
          style: TextStyle(
            color: kgoldColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// POST TYPE LABEL
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _label("Post Type", _postTypeFocus.hasFocus, textColor),
                  Text(
                    _monthlyUsageLabel(_selectedType),
                    style: const TextStyle(
                      color: kgoldColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              DropdownButtonFormField<PostType>(
                initialValue: _selectedType,
                focusNode: _postTypeFocus,
                dropdownColor: bgColor,
                iconEnabledColor: kgoldColor,
                style: TextStyle(color: textColor),
                decoration: _inputDecoration(
                  bgColor,
                  kgoldColor,
                  _postTypeFocus.hasFocus,
                ),
                items: const [
                  DropdownMenuItem(
                    value: PostType.stills,
                    child: Text("Stills"),
                  ),
                  DropdownMenuItem(value: PostType.bits, child: Text("Bits")),
                  DropdownMenuItem(
                    value: PostType.longVideos,
                    child: Text("Long Videos"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedType = value!;
                    selectedMedia.clear();
                    _stillTagsByMediaPath.clear();
                    _selectedStillIndex = 0;
                  });
                },
              ),

              const SizedBox(height: 20),

              _label("Media", _postTypeFocus.hasFocus, textColor),

              const SizedBox(height: 8),

              GestureDetector(
                onTap: () {
                  _mediaFocus.requestFocus();
                  _selectedType == PostType.stills
                      ? _pickImages()
                      : _pickVideos();
                },
                child: Focus(
                  focusNode: _mediaFocus,
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:
                            (_mediaFocus.hasFocus || selectedMedia.isNotEmpty)
                            ? kgoldColor
                            : borderColor,
                        width:
                            (_mediaFocus.hasFocus || selectedMedia.isNotEmpty)
                            ? 2
                            : 1.5,
                      ),
                    ),
                    child: selectedMedia.isEmpty
                        ? Center(
                            child: Text(
                              _selectedType == PostType.stills
                                  ? "Tap to add images"
                                  : "Tap to add videos",
                              style: const TextStyle(color: kgreyColor),
                            ),
                          )
                        : SizedBox(
                            height: 110,
                            width: double.infinity,
                            child: ReorderableListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              buildDefaultDragHandles: false,
                              itemCount: selectedMedia.length + 1,
                              onReorder: (oldIndex, newIndex) {
                                // prevent dragging the "add" button
                                if (oldIndex == selectedMedia.length ||
                                    newIndex == selectedMedia.length) {
                                  return;
                                }

                                if (newIndex > oldIndex) newIndex--;

                                setState(() {
                                  final item = selectedMedia.removeAt(oldIndex);
                                  selectedMedia.insert(newIndex, item);

                                  if (_selectedStillIndex == oldIndex) {
                                    _selectedStillIndex = newIndex;
                                  } else if (oldIndex < _selectedStillIndex &&
                                      newIndex >= _selectedStillIndex) {
                                    _selectedStillIndex--;
                                  } else if (oldIndex > _selectedStillIndex &&
                                      newIndex <= _selectedStillIndex) {
                                    _selectedStillIndex++;
                                  }
                                });
                              },
                              itemBuilder: (context, index) {
                                /// ➕ Add media button (last item)
                                if (index == selectedMedia.length &&
                                    _selectedType == PostType.stills) {
                                  return Container(
                                    key: const ValueKey("add"),
                                    width: 100,
                                    margin: const EdgeInsets.all(8),
                                    child: GestureDetector(
                                      onTap: _pickImages,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: kgoldColor,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: kgoldColor,
                                          size: 32,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                final file = selectedMedia[index];

                                return ReorderableDragStartListener(
                                  key: ValueKey(file.path),
                                  index: index,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (_selectedType ==
                                                PostType.stills) {
                                              setState(() {
                                                _selectedStillIndex = index;
                                              });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color:
                                                    _selectedType ==
                                                            PostType.stills &&
                                                        _selectedStillIndex ==
                                                            index
                                                    ? kgoldColor
                                                    : Colors.transparent,
                                                width: 2,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.file(
                                                File(file.path),
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),

                                        if (_selectedType == PostType.stills &&
                                            _tagsForPath(file.path).isNotEmpty)
                                          Positioned(
                                            left: 4,
                                            top: 4,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                    vertical: 2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(
                                                  0.7,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.local_offer,
                                                    size: 12,
                                                    color: kgoldColor,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    '${_tagsForPath(file.path).length}',
                                                    style: const TextStyle(
                                                      color: kwhiteColor,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                        Positioned(
                                          top: 4,
                                          right: 4,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                final removedPath =
                                                    selectedMedia[index].path;
                                                selectedMedia.removeAt(index);
                                                _stillTagsByMediaPath.remove(
                                                  removedPath,
                                                );
                                                if (selectedMedia.isEmpty) {
                                                  _selectedStillIndex = 0;
                                                } else if (_selectedStillIndex >=
                                                    selectedMedia.length) {
                                                  _selectedStillIndex =
                                                      selectedMedia.length - 1;
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: isDark
                                                    ? Colors.grey.shade900
                                                    : Colors.grey.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border:
                                                    const Border.fromBorderSide(
                                                      BorderSide(
                                                        color: kgoldColor,
                                                        width: 1.5,
                                                      ),
                                                    ),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.delete_outline_outlined,
                                                  color: kgoldColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ),
              ),

              if (_selectedType == PostType.stills && _activeStill != null) ...[
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _label('Tag People', false, textColor),
                    TextButton.icon(
                      onPressed: _openTagListForActiveStill,
                      icon: const Icon(
                        Icons.local_offer_outlined,
                        color: kgoldColor,
                      ),
                      label: Text(
                        'Tags (${_tagsForPath(_activeStill!.path).length})',
                        style: const TextStyle(color: kgoldColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap on person in image to tag',
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final activeFile = _activeStill;
                      if (activeFile == null) {
                        return const SizedBox.shrink();
                      }
                      final tags = _tagsForPath(activeFile.path);

                      return GestureDetector(
                        onTapDown: (details) =>
                            _onStillPreviewTap(details, constraints),
                        child: Stack(
                          children: [
                            Container(
                              height: 260,
                              width: double.infinity,
                              color: Colors.black,
                              child: Image.file(
                                File(activeFile.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            for (final tag in tags)
                              Positioned(
                                left: (constraints.maxWidth * tag.position.dx)
                                    .clamp(8.0, constraints.maxWidth - 110),
                                top: (260 * tag.position.dy).clamp(8.0, 230.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.75),
                                    borderRadius: BorderRadius.circular(999),
                                    border: Border.all(
                                      color: kgoldColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        size: 12,
                                        color: kgoldColor,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        tag.name,
                                        style: const TextStyle(
                                          color: kwhiteColor,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],

              const SizedBox(height: 20),

              _label("Description", _postTypeFocus.hasFocus, textColor),
              const SizedBox(height: 8),

              TextField(
                controller: _descriptionController,
                focusNode: _descriptionFocus,
                maxLines: 2,
                style: TextStyle(color: textColor),
                decoration: _inputDecoration(
                  bgColor,
                  borderColor,
                  _descriptionFocus.hasFocus,
                  hint: "Write something...",
                ),
              ),

              const SizedBox(height: 16),

              _label(
                "AI Persona Description",
                _aiPersonaFocus.hasFocus,
                textColor,
              ),
              const SizedBox(height: 6),
              Text(
                "This description is internal only and will not be displayed to Stargazers.",
                style: const TextStyle(color: kgreyColor, fontSize: 12),
              ),
              const SizedBox(height: 8),

              TextField(
                controller: _aiPersonaController,
                focusNode: _aiPersonaFocus,
                maxLines: 3,
                style: TextStyle(color: textColor),
                decoration: _inputDecoration(
                  bgColor,
                  borderColor,
                  _aiPersonaFocus.hasFocus,
                  hint: "Write context for AI persona...",
                ),
              ),

              const SizedBox(height: 24),

              /// POST TIMING
              Text("Post Timing", style: TextStyle(color: textColor)),

              Row(
                children: [
                  Radio<bool>(
                    value: false,
                    groupValue: scheduleLater,
                    activeColor: kgoldColor,
                    onChanged: (v) => setState(() => scheduleLater = v!),
                  ),
                  Text(
                    "Publish Now",
                    style: TextStyle(
                      color: scheduleLater == false
                          ? kgoldColor
                          : (isDark ? kwhiteColor : kblackColor),
                    ),
                  ),
                  Radio<bool>(
                    value: true,
                    groupValue: scheduleLater,
                    activeColor: kgoldColor,
                    onChanged: (v) => setState(() => scheduleLater = v!),
                  ),
                  Text(
                    "Schedule Later",
                    style: TextStyle(
                      color: scheduleLater == true
                          ? kgoldColor // 👈 selected
                          : (isDark ? kwhiteColor : kblackColor),
                    ),
                  ),
                ],
              ),

              if (scheduleLater)
                Row(
                  children: [
                    Expanded(
                      child: _scheduleButton(
                        scheduledDate == null
                            ? "Select Date"
                            : '${scheduledDate!.month.toString().padLeft(2, '0')}-${scheduledDate!.day.toString().padLeft(2, '0')}-${scheduledDate!.year}',
                        () async {
                          final isDark =
                              Theme.of(context).brightness == Brightness.dark;
                          final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                            initialDate: DateTime.now(),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme(
                                    brightness: isDark
                                        ? Brightness.dark
                                        : Brightness.light,
                                    primary: kgoldColor,
                                    onPrimary: isDark
                                        ? kblackColor
                                        : kwhiteColor,
                                    secondary: kgoldColor,
                                    onSecondary: isDark
                                        ? kblackColor
                                        : kwhiteColor,
                                    error: Colors.red,
                                    onError: kwhiteColor,
                                    surface: isDark ? kblackColor : kwhiteColor,
                                    onSurface: isDark
                                        ? kwhiteColor
                                        : kblackColor,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: kgoldColor,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (date != null) {
                            setState(() => scheduledDate = date);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _scheduleButton(
                        scheduledTime == null
                            ? "Select Time"
                            : '${scheduledTime!.hourOfPeriod.toString().padLeft(2, '0')}:${scheduledTime!.minute.toString().padLeft(2, '0')} ${scheduledTime!.period == DayPeriod.am ? 'AM' : 'PM'}',
                        () async {
                          final isDark =
                              Theme.of(context).brightness == Brightness.dark;
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme(
                                    brightness: isDark
                                        ? Brightness.dark
                                        : Brightness.light,
                                    primary: kgoldColor,
                                    onPrimary: isDark
                                        ? kblackColor
                                        : kwhiteColor,
                                    secondary: kgoldColor,
                                    onSecondary: isDark
                                        ? kblackColor
                                        : kwhiteColor,
                                    error: Colors.red,
                                    onError: kwhiteColor,

                                    surface: isDark ? kblackColor : kwhiteColor,
                                    onSurface: isDark
                                        ? kwhiteColor
                                        : kblackColor,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: kgoldColor,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (time != null) {
                            setState(() => scheduledTime = time);
                          }
                        },
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 40),

              /// CREATE BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _isMonthlyLimitReached(_selectedType)
                      ? null
                      : _onCreatePost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bgColor,
                    foregroundColor: kgoldColor,
                    side: const BorderSide(color: kgoldColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: Text(
                    "Publish ${_postTypeLabel(_selectedType)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// LABEL
  Widget _label(String text, bool isActive, Color textColor) {
    return Text(
      text,
      style: TextStyle(
        // color: isActive ? kgoldColor : textColor.withOpacity(0.7),
        color: textColor,
        fontSize: 14,
      ),
    );
  }

  /// INPUT DECORATION
  InputDecoration _inputDecoration(
    Color bgColor,
    Color borderColor,
    bool isFocused, {
    String? hint,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: kgreyColor),
      filled: true,
      fillColor: bgColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isFocused ? kgoldColor : borderColor,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kgoldColor, width: 2),
      ),
    );
  }

  // /// ADD MEDIA BUTTON
  // Widget _addMediaButton(VoidCallback onTap) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       width: 100,
  //       margin: const EdgeInsets.all(8),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8),
  //         border: Border.all(color: kgoldColor, width: 1.5),
  //       ),
  //       child: const Icon(Icons.add, color: kgoldColor),
  //     ),
  //   );
  // }

  /// SCHEDULE BUTTON
  Widget _scheduleButton(String text, VoidCallback onTap) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: kgoldColor, width: 2),
        foregroundColor: kgoldColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Text(text),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _aiPersonaController.dispose();
    _postTypeFocus.dispose();
    _mediaFocus.dispose();
    _descriptionFocus.dispose();
    _aiPersonaFocus.dispose();
    super.dispose();
  }
}
