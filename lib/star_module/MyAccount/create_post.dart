// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:harmanapp/star_module/widgets/star_theme_notifier.dart';
// import 'package:image_picker/image_picker.dart';

// enum PostType { bits, stills, longVideos }

// class CreatePostPage extends StatefulWidget {
//   const CreatePostPage({super.key});

//   @override
//   State<CreatePostPage> createState() => _CreatePostPageState();
// }

// class _CreatePostPageState extends State<CreatePostPage> {
//   PostType _selectedType = PostType.bits;
//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController _descriptionController = TextEditingController();
//   bool mediaGold = false;
//   final FocusNode _mediaFocus = FocusNode();
//   bool descriptionGold = false;
//   final FocusNode _descriptionFocus = FocusNode();
//   bool scheduleLater = false;
//   DateTime? scheduledDate;
//   TimeOfDay? scheduledTime;

//   List<XFile> selectedMedia = [];
//   bool postTypeGold = false;
//   final FocusNode _postTypeFocus = FocusNode();

//   Future<void> _pickImages() async {
//     final images = await _picker.pickMultiImage();
//     if (images.isNotEmpty) {
//       setState(() {
//         selectedMedia.addAll(images);
//       });
//     }
//   }

//   Future<void> _pickVideos() async {
//     final videos = await _picker.pickMultipleMedia();
//     setState(() {
//       selectedMedia = videos
//           .where((e) => e.mimeType?.startsWith('video') ?? false)
//           .toList();
//     });
//   }

//   void _onCreatePost() {
//     debugPrint("Post Type: $_selectedType");
//     debugPrint("Media Count: ${selectedMedia.length}");
//     debugPrint("Description: ${_descriptionController.text}");
//   }

//   @override
//   void initState() {
//     super.initState();
//     _postTypeFocus.addListener(() {
//       setState(() => postTypeGold = _postTypeFocus.hasFocus);
//     });
//     _descriptionFocus.addListener(() {
//       setState(() => descriptionGold = _descriptionFocus.hasFocus);
//     });
//   }

//   @override
//   void dispose() {
//     _mediaFocus.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).brightness == Brightness.dark
//           ? kblackColor
//           : kwhiteColor,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Theme.of(context).brightness == Brightness.dark
//             ? kblackColor
//             : kwhiteColor,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Theme.of(context).brightness == Brightness.dark
//                 ? kwhiteColor
//                 : kblackColor,
//           ),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           "Create Post",
//           style: TextStyle(
//             color: Theme.of(context).brightness == Brightness.dark
//                 ? kwhiteColor
//                 : kblackColor,
//           ),
//         ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DropdownButtonFormField<PostType>(
//               value: _selectedType,
//               focusNode: _postTypeFocus,
//               dropdownColor: Theme.of(context).brightness == Brightness.dark
//                   ? kblackColor
//                   : kwhiteColor,
//               iconEnabledColor: kgoldColor,
//               style: const TextStyle(color: kwhiteColor),

//               decoration: InputDecoration(
//                 hintText: "Select Post Type",
//                 hintStyle: const TextStyle(color: kgreyColor),
//                 filled: true,
//                 fillColor: Theme.of(context).brightness == Brightness.dark
//                     ? kblackColor
//                     : kwhiteColor,

//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                     color: postTypeGold ? kgoldColor : kwhiteColor,
//                     width: 1.5,
//                   ),
//                 ),

//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: const BorderSide(color: kgoldColor, width: 2),
//                 ),
//               ),

//               items: [
//                 DropdownMenuItem(
//                   value: PostType.bits,
//                   child: Text(
//                     "Bits",
//                     style: TextStyle(
//                       color: Theme.of(context).brightness == Brightness.dark
//                           ? kwhiteColor
//                           : kblackColor,
//                     ),
//                   ),
//                 ),
//                 DropdownMenuItem(
//                   value: PostType.stills,
//                   child: Text("Stills", style: TextStyle(color: kwhiteColor)),
//                 ),
//                 DropdownMenuItem(
//                   value: PostType.longVideos,
//                   child: Text(
//                     "Long Videos",
//                     style: TextStyle(color: kwhiteColor),
//                   ),
//                 ),
//               ],

//               onChanged: (value) {
//                 setState(() {
//                   _selectedType = value!;
//                   selectedMedia.clear();
//                 });
//               },

//               onTap: () {
//                 setState(() => postTypeGold = true);
//               },
//             ),

//             const SizedBox(height: 16),

//             GestureDetector(
//               onTap: () {
//                 setState(() => mediaGold = true);
//                 _mediaFocus.requestFocus();

//                 if (_selectedType == PostType.stills) {
//                   _pickImages();
//                 } else {
//                   _pickVideos();
//                 }
//               },
//               child: Focus(
//                 focusNode: _mediaFocus,
//                 onFocusChange: (hasFocus) {
//                   setState(() => mediaGold = hasFocus);
//                 },
//                 child: Container(
//                   height: 140,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: mediaGold ? kgoldColor : kwhiteColor,
//                       width: mediaGold ? 2 : 1.5,
//                     ),
//                   ),
//                   child: selectedMedia.isEmpty
//                       ? Center(
//                           child: Text(
//                             _selectedType == PostType.stills
//                                 ? "Tap to add images"
//                                 : "Tap to add videos",
//                             style: const TextStyle(color: kgreyColor),
//                           ),
//                         )
//                       : ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: selectedMedia.length + 1,
//                           itemBuilder: (_, index) {
//                             if (index == selectedMedia.length) {
//                               return GestureDetector(
//                                 onTap: _pickImages,
//                                 child: Container(
//                                   width: 100,
//                                   margin: const EdgeInsets.all(8),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8),
//                                     border: Border.all(color: kgoldColor),
//                                   ),
//                                   child: const Icon(
//                                     Icons.add,
//                                     color: kgoldColor,
//                                     size: 30,
//                                   ),
//                                 ),
//                               );
//                             }

//                             final file = selectedMedia[index];
//                             return Padding(
//                               padding: const EdgeInsets.all(8),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Image.file(
//                                   File(file.path),
//                                   width: 100,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             TextField(
//               controller: _descriptionController,
//               focusNode: _descriptionFocus,
//               maxLines: 2,
//               style: const TextStyle(color: kwhiteColor),
//               onChanged: (_) => setState(() {}),
//               decoration: InputDecoration(
//                 hintText: "Description",
//                 hintStyle: const TextStyle(color: kgreyColor),
//                 filled: true,
//                 fillColor: kfillgreyColor,

//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(
//                     color: descriptionGold ? kgoldColor : kwhiteColor,
//                     width: 1.5,
//                   ),
//                 ),

//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: const BorderSide(color: kgoldColor, width: 2),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Text(
//               "Post Timing",
//               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                 color: Theme.of(context).brightness == Brightness.dark
//                     ? kwhiteColor
//                     : kblackColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             Row(
//               children: [
//                 Radio<bool>(
//                   value: false,
//                   groupValue: scheduleLater,
//                   activeColor: kgoldColor,
//                   onChanged: (val) {
//                     setState(() {
//                       scheduleLater = val!;
//                     });
//                   },
//                 ),
//                 const Text("Publish Now", style: TextStyle(color: kgreyColor)),

//                 Radio<bool>(
//                   value: true,
//                   groupValue: scheduleLater,
//                   activeColor: kgoldColor,
//                   onChanged: (val) {
//                     setState(() {
//                       scheduleLater = val!;
//                     });
//                   },
//                 ),
//                 const Text(
//                   "Schedule Later",
//                   style: TextStyle(color: kgreyColor),
//                 ),
//               ],
//             ),
//             if (scheduleLater) ...[
//               const SizedBox(height: 12),

//               Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: kblackColor,
//                         foregroundColor: kgoldColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(14),
//                           side: const BorderSide(color: kgoldColor, width: 2),
//                         ),
//                       ),
//                       onPressed: () async {
//                         final date = await showDatePicker(
//                           context: context,
//                           firstDate: DateTime.now(),
//                           lastDate: DateTime(2100),
//                           initialDate: DateTime.now(),
//                         );
//                         if (date != null) {
//                           setState(() => scheduledDate = date);
//                         }
//                       },
//                       child: Text(
//                         scheduledDate == null
//                             ? "Select Date"
//                             : "${scheduledDate!.day}/${scheduledDate!.month}/${scheduledDate!.year}",
//                       ),
//                     ),
//                   ),

//                   const SizedBox(width: 12),

//                   Expanded(
//                     child: OutlinedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: kblackColor,
//                         foregroundColor: kgoldColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(14),
//                           side: const BorderSide(color: kgoldColor, width: 2),
//                         ),
//                       ),
//                       onPressed: () async {
//                         final time = await showTimePicker(
//                           context: context,
//                           initialTime: TimeOfDay.now(),
//                         );
//                         if (time != null) {
//                           setState(() => scheduledTime = time);
//                         }
//                       },
//                       child: Text(
//                         scheduledTime == null
//                             ? "Select Time"
//                             : scheduledTime!.format(context),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               height: 55,
//               child: ElevatedButton(
//                 onPressed: _onCreatePost,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: kblackColor,
//                   foregroundColor: kgoldColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(14),
//                     side: const BorderSide(color: kgoldColor, width: 2),
//                   ),
//                 ),
//                 child: Text(
//                   "Create Post",
//                   style: TextStyle(
//                     color: kgoldColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
  bool descriptionGold = false;
  bool postTypeGold = false;

  final FocusNode _mediaFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  final FocusNode _postTypeFocus = FocusNode();

  bool scheduleLater = false;
  DateTime? scheduledDate;
  TimeOfDay? scheduledTime;

  List<XFile> selectedMedia = [];

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
  void initState() {
    super.initState();
    _postTypeFocus.addListener(() {
      setState(() {}); // forces rebuild on focus change
    });
    _descriptionFocus.addListener(() {
      setState(() => descriptionGold = _descriptionFocus.hasFocus);
    });
  }

  @override
  void dispose() {
    _mediaFocus.dispose();
    _descriptionFocus.dispose();
    _postTypeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bgColor = isDark ? kblackColor : kwhiteColor;
    final textColor = isDark ? kwhiteColor : kblackColor;
    final borderColor = isDark ? kwhiteColor : kblackColor;
    final Color inactiveColor = kgreyColor;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: bgColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Create Post", style: TextStyle(color: textColor)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// POST TYPE
                // DropdownButtonFormField<PostType>(
                //   value: _selectedType,
                //   focusNode: _postTypeFocus,
                //   dropdownColor: bgColor,
                //   iconEnabledColor: kgoldColor,
                //   style: TextStyle(color: textColor),
                //   decoration: InputDecoration(
                //     hintText: "Select Post Type",
                //     hintStyle: const TextStyle(color: kgreyColor),
                //     filled: true,
                //     fillColor: bgColor,

                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(12),
                //       borderSide: BorderSide(color: inactiveColor, width: 1.5),
                //     ),

                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(12),
                //       borderSide: const BorderSide(color: kgoldColor, width: 2),
                //     ),
                //   ),
                //   items: [
                //     DropdownMenuItem(
                //       value: PostType.bits,
                //       child: Text("Bits", style: TextStyle(color: textColor)),
                //     ),
                //     DropdownMenuItem(
                //       value: PostType.stills,
                //       child: Text("Stills", style: TextStyle(color: textColor)),
                //     ),
                //     DropdownMenuItem(
                //       value: PostType.longVideos,
                //       child: Text(
                //         "Long Videos",
                //         style: TextStyle(color: textColor),
                //       ),
                //     ),
                //   ],
                //   onChanged: (value) {
                //     setState(() {
                //       _selectedType = value!;
                //       selectedMedia.clear();
                //     });
                //   },
                // ),
                DropdownButtonFormField<PostType>(
                  value: _selectedType,
                  focusNode: _postTypeFocus,
                  dropdownColor: bgColor,
                  iconEnabledColor: kgoldColor,
                  style: TextStyle(color: textColor),

                  decoration: InputDecoration(
                    hintText: "Select Post Type",
                    hintStyle: const TextStyle(color: kgreyColor),
                    filled: true,
                    fillColor: bgColor,

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color:
                            (_postTypeFocus.hasFocus || _selectedType != null)
                            ? kgoldColor
                            : inactiveColor,
                        width:
                            (_postTypeFocus.hasFocus || _selectedType != null)
                            ? 2
                            : 1.5,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: kgoldColor, width: 2),
                    ),
                  ),

                  items: const [
                    DropdownMenuItem(value: PostType.bits, child: Text("Bits")),
                    DropdownMenuItem(
                      value: PostType.stills,
                      child: Text("Stills"),
                    ),
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

                const SizedBox(height: 16),

                /// MEDIA PICKER
                GestureDetector(
                  onTap: () {
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:
                              (_mediaFocus.hasFocus || selectedMedia.isNotEmpty)
                              ? kgoldColor
                              : borderColor,
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
                              itemCount: selectedMedia.length + 1,
                              itemBuilder: (_, index) {
                                if (index == selectedMedia.length &&
                                    _selectedType == PostType.stills) {
                                  return GestureDetector(
                                    onTap: _pickImages,
                                    child: Container(
                                      width: 100,
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: kgoldColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: kgoldColor,
                                      ),
                                    ),
                                  );
                                }

                                final file = selectedMedia[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(file.path),
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// DESCRIPTION
                TextField(
                  controller: _descriptionController,
                  focusNode: _descriptionFocus,
                  maxLines: 2,
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: const TextStyle(color: kgreyColor),
                    filled: true,
                    fillColor: bgColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: descriptionGold ? kgoldColor : borderColor,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: kgoldColor, width: 2),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// POST TIMING
                Text(
                  "Post Timing",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  children: [
                    Radio<bool>(
                      value: false,
                      groupValue: scheduleLater,
                      activeColor: kgoldColor,
                      onChanged: (v) => setState(() => scheduleLater = v!),
                    ),
                    const Text(
                      "Publish Now",
                      style: TextStyle(color: kgreyColor),
                    ),
                    Radio<bool>(
                      value: true,
                      groupValue: scheduleLater,
                      activeColor: kgoldColor,
                      onChanged: (v) => setState(() => scheduleLater = v!),
                    ),
                    const Text(
                      "Schedule Later",
                      style: TextStyle(color: kgreyColor),
                    ),
                  ],
                ),

                if (scheduleLater)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: kgoldColor,
                            side: const BorderSide(color: kgoldColor, width: 2),
                          ),
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                              initialDate: DateTime.now(),
                            );
                            if (date != null)
                              setState(() => scheduledDate = date);
                          },
                          child: Text(
                            scheduledDate == null
                                ? "Select Date"
                                : "${scheduledDate!.day}/${scheduledDate!.month}/${scheduledDate!.year}",
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: kgoldColor,
                            side: const BorderSide(color: kgoldColor, width: 2),
                          ),
                          onPressed: () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null)
                              setState(() => scheduledTime = time);
                          },
                          child: Text(
                            scheduledTime == null
                                ? "Select Time"
                                : scheduledTime!.format(context),
                          ),
                        ),
                      ),
                    ],
                  ),

                SizedBox(height: 40),

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
                    child: const Text(
                      "Create Post",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
