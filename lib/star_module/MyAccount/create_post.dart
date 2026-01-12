import 'dart:io';
import 'package:flutter/material.dart';
import 'package:harmanapp/star_module/widgets/star_theme_notifier.dart';
import 'package:image_picker/image_picker.dart';

enum PostType { bits, stills, longVideos }

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  PostType _selectedType = PostType.bits;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _descriptionController = TextEditingController();
  bool mediaGold = false;
  final FocusNode _mediaFocus = FocusNode();
  bool descriptionGold = false;
  final FocusNode _descriptionFocus = FocusNode();

  List<XFile> selectedMedia = [];
  bool postTypeGold = false;
  final FocusNode _postTypeFocus = FocusNode();

  Future<void> _pickImages() async {
    final images = await _picker.pickMultiImage();
    if (images.isNotEmpty) {
      setState(() => selectedMedia = images);
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
  }

  @override
  void initState() {
    super.initState();
    _postTypeFocus.addListener(() {
      setState(() => postTypeGold = _postTypeFocus.hasFocus);
    });
    _descriptionFocus.addListener(() {
      setState(() => descriptionGold = _descriptionFocus.hasFocus);
    });
  }

  @override
  void dispose() {
    _mediaFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kblackColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kwhiteColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Create Post", style: TextStyle(color: kwhiteColor)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<PostType>(
              value: _selectedType,
              focusNode: _postTypeFocus,
              dropdownColor: kfillgreyColor,
              iconEnabledColor: kgoldColor,
              style: const TextStyle(color: kwhiteColor),

              decoration: InputDecoration(
                hintText: "Select Post Type",
                hintStyle: const TextStyle(color: kgreyColor),
                filled: true,
                fillColor: kfillgreyColor,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: postTypeGold ? kgoldColor : kwhiteColor,
                    width: 1.5,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kgoldColor, width: 2),
                ),
              ),

              items: const [
                DropdownMenuItem(
                  value: PostType.bits,
                  child: Text("Bits", style: TextStyle(color: kwhiteColor)),
                ),
                DropdownMenuItem(
                  value: PostType.stills,
                  child: Text("Stills", style: TextStyle(color: kwhiteColor)),
                ),
                DropdownMenuItem(
                  value: PostType.longVideos,
                  child: Text(
                    "Long Videos",
                    style: TextStyle(color: kwhiteColor),
                  ),
                ),
              ],

              onChanged: (value) {
                setState(() {
                  _selectedType = value!;
                  selectedMedia.clear();
                });
              },

              onTap: () {
                setState(() => postTypeGold = true);
              },
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: () {
                setState(() => mediaGold = true);
                _mediaFocus.requestFocus();

                if (_selectedType == PostType.stills) {
                  _pickImages();
                } else {
                  _pickVideos();
                }
              },
              child: Focus(
                focusNode: _mediaFocus,
                onFocusChange: (hasFocus) {
                  setState(() => mediaGold = hasFocus);
                },
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: mediaGold ? kgoldColor : kwhiteColor,
                      width: mediaGold ? 2 : 1.5,
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
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedMedia.length,
                          itemBuilder: (_, index) {
                            final file = selectedMedia[index];
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: _selectedType == PostType.stills
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        File(file.path),
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.black26,
                                      ),
                                      child: const Icon(
                                        Icons.videocam,
                                        color: kgoldColor,
                                        size: 40,
                                      ),
                                    ),
                            );
                          },
                        ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _descriptionController,
              focusNode: _descriptionFocus,
              maxLines: 2,
              style: const TextStyle(color: kwhiteColor),
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: const TextStyle(color: kgreyColor),
                filled: true,
                fillColor: kfillgreyColor,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: descriptionGold ? kgoldColor : kwhiteColor,
                    width: 1.5,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kgoldColor, width: 2),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _onCreatePost,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kblackColor,
                  foregroundColor: kgoldColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(color: kgoldColor, width: 2),
                  ),
                ),
                child: Text(
                  "Create Post",
                  style: TextStyle(
                    color: kgoldColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
