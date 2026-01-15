import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harmanapp/star_module/widgets/star_theme_notifier.dart';
import 'package:image_picker/image_picker.dart';

class LegacyFormPage extends StatefulWidget {
  const LegacyFormPage({super.key});

  @override
  State<LegacyFormPage> createState() => _LegacyFormPageState();
}

class _LegacyFormPageState extends State<LegacyFormPage> {
  final TextEditingController achievementCtrl = TextEditingController();
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();

  final FocusNode achievementFocus = FocusNode();
  final FocusNode titleFocus = FocusNode();
  final FocusNode descFocus = FocusNode();
  final ImagePicker _picker = ImagePicker();
  List<XFile> selectedMedia = [];
  DateTime? selectedDate;
  bool scheduleLater = false;

  DateTime? scheduledDate;
  TimeOfDay? scheduledTime;

  bool isGold(FocusNode f, TextEditingController c) =>
      f.hasFocus || c.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    achievementFocus.addListener(() => setState(() {}));
    titleFocus.addListener(() => setState(() {}));
    descFocus.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblackColor,
      appBar: AppBar(
        backgroundColor: kblackColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kwhiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Add Legacy", style: TextStyle(color: kwhiteColor)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// DATE
            _box(
              isGold: selectedDate != null,
              child: ListTile(
                title: Text(
                  selectedDate == null
                      ? "Select Date"
                      : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: const Icon(Icons.calendar_today, color: kgoldColor),
                onTap: () async {
                  final d = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                  );
                  if (d != null) setState(() => selectedDate = d);
                },
              ),
            ),

            const SizedBox(height: 16),

            /// ACHIEVEMENT
            _input(
              controller: achievementCtrl,
              focusNode: achievementFocus,
              hint: "Achievement",
              isGold: isGold(achievementFocus, achievementCtrl),
            ),

            const SizedBox(height: 16),

            /// TITLE
            _input(
              controller: titleCtrl,
              focusNode: titleFocus,
              hint: "Title",
              isGold: isGold(titleFocus, titleCtrl),
            ),

            const SizedBox(height: 16),

            /// DESCRIPTION
            _input(
              controller: descCtrl,
              focusNode: descFocus,
              hint: "Description",
              maxLines: 3,
              isGold: isGold(descFocus, descCtrl),
            ),

            const SizedBox(height: 16),

            // _box(
            //   isGold: selectedMedia.isNotEmpty,
            //   child: ListTile(
            //     leading: const Icon(Icons.upload, color: kgoldColor),
            //     title: const Text(
            //       "Upload Media",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //     subtitle: selectedMedia.isNotEmpty
            //         ? Text(
            //             "${selectedMedia.length} file(s) selected",
            //             style: const TextStyle(
            //               color: Colors.white60,
            //               fontSize: 12,
            //             ),
            //           )
            //         : null,
            //     onTap: _uploadMedia,
            //   ),
            // ),
            _box(
              isGold: selectedMedia.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: selectedMedia.isEmpty
                    ? ListTile(
                        leading: const Icon(Icons.upload, color: kgoldColor),
                        title: const Text(
                          "Upload Media",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: _uploadMedia,
                      )
                    : SizedBox(
                        height: 110, // 🔑 fixed height = no render error
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedMedia.length + 1,
                          itemBuilder: (context, index) {
                            /// ➕ ADD BUTTON
                            if (index == selectedMedia.length) {
                              return GestureDetector(
                                onTap: _uploadMedia,
                                child: Container(
                                  width: 90,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                              );
                            }

                            /// MEDIA PREVIEW
                            final file = selectedMedia[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(file.path),
                                  width: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Radio<bool>(
                  value: false,
                  groupValue: scheduleLater,
                  activeColor: kgoldColor,
                  onChanged: (v) => setState(() => scheduleLater = v!),
                ),
                const Text("Publish Now", style: TextStyle(color: kgreyColor)),
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
                      // style: OutlinedButton.styleFrom(
                      //   foregroundColor: kgoldColor,
                      //   side: const BorderSide(color: kgoldColor, width: 2),
                      // ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kblackColor,
                        foregroundColor: kgoldColor,
                        side: const BorderSide(color: kgoldColor, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                          initialDate: DateTime.now(),
                        );
                        if (date != null) setState(() => scheduledDate = date);
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
                      // style: OutlinedButton.styleFrom(
                      //   foregroundColor: kgoldColor,
                      //   side: const BorderSide(color: kgoldColor, width: 2),
                      // ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kblackColor,
                        foregroundColor: kgoldColor,
                        side: const BorderSide(color: kgoldColor, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) setState(() => scheduledTime = time);
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

            /// SUBMIT
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: kgoldColor, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: const Text(
                  "Publish",
                  style: TextStyle(
                    color: kgoldColor,
                    fontSize: 16,
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

  /// INPUT FIELD
  Widget _input({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hint,
    required bool isGold,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      maxLines: maxLines,
      onChanged: (_) => setState(() {}),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: const Color(0xFF1C1C1E),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isGold ? kgoldColor : Colors.grey,
            width: 1.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kgoldColor, width: 2),
        ),
      ),
    );
  }

  /// BORDER BOX
  Widget _box({required Widget child, required bool isGold}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isGold ? kgoldColor : Colors.grey,
          width: isGold ? 2 : 1.5,
        ),
      ),
      child: child,
    );
  }

  Future<void> _uploadMedia() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: kblackColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image, color: kgoldColor),
                title: const Text(
                  "Pick Image",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                    setState(() => selectedMedia.add(image));
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.videocam, color: kgoldColor),
                title: const Text(
                  "Pick Video",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? video = await _picker.pickVideo(
                    source: ImageSource.gallery,
                  );
                  if (video != null) {
                    setState(() => selectedMedia.add(video));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
