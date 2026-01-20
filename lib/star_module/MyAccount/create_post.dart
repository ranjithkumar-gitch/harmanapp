import 'dart:io';
import 'package:flutter/material.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:image_picker/image_picker.dart';

enum PostType { bits, stills, longVideos }

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  PostType _selectedType = PostType.stills;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController _descriptionController = TextEditingController();

  final FocusNode _postTypeFocus = FocusNode();
  final FocusNode _mediaFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();

  bool scheduleLater = false;
  DateTime? scheduledDate;
  TimeOfDay? scheduledTime;

  List<XFile> selectedMedia = [];
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
      setState(() => selectedMedia.addAll(images));
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
    debugPrint("Post Type: $_selectedType");
    debugPrint("Media Count: ${selectedMedia.length}");
    debugPrint("Description: ${_descriptionController.text}");
    debugPrint("Schedule Later: $scheduleLater");
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
              _label("Post Type", _postTypeFocus.hasFocus, textColor),
              const SizedBox(height: 8),

              DropdownButtonFormField<PostType>(
                value: _selectedType,
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
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child: Image.file(
                                            File(file.path),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        Positioned(
                                          top: 4,
                                          right: 4,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedMedia.removeAt(index);
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
                                    background: isDark
                                        ? kblackColor
                                        : kwhiteColor,
                                    onBackground: isDark
                                        ? kwhiteColor
                                        : kblackColor,
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
                          if (date != null)
                            setState(() => scheduledDate = date);
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
                          if (time != null)
                            setState(() => scheduledTime = time);
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
                  onPressed: _onCreatePost,
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
}
