import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';
import 'package:image_picker/image_picker.dart';

class LegacyFormPage extends StatefulWidget {
  const LegacyFormPage({super.key});

  @override
  State<LegacyFormPage> createState() => _LegacyFormPageState();
}

class _LegacyFormPageState extends State<LegacyFormPage> {
  final TextEditingController achievementCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final FocusNode achievementFocus = FocusNode();
  final FocusNode descFocus = FocusNode();

  final ImagePicker _picker = ImagePicker();
  List<XFile> selectedMedia = [];

  DateTime? selectedDate;
  bool scheduleLater = false;
  DateTime? scheduledDate;
  TimeOfDay? scheduledTime;

  /// THEME HELPERS
  Color get bgColor => Theme.of(context).scaffoldBackgroundColor;
  Color get cardColor => Theme.of(context).cardColor;
  Color get textColor => Theme.of(context).textTheme.bodyLarge!.color!;
  Color get hintColor => Theme.of(context).hintColor;
  Color get borderColor => Theme.of(context).dividerColor;

  static const Color kgoldColor = Color(0xFFD4AF37);

  bool isGold(FocusNode f, TextEditingController c) =>
      f.hasFocus || c.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    achievementFocus.addListener(() => setState(() {}));
    descFocus.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
        title: Text("Add Legacy", style: TextStyle(color: textColor)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// DATE
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Date",
                  style: TextStyle(
                    color: selectedMedia.isNotEmpty
                        ? kgoldColor
                        : textColor.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                _box(
                  isGold: selectedDate != null,
                  child: ListTile(
                    title: Text(
                      selectedDate == null
                          ? "Select Date"
                          : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                      style: TextStyle(color: textColor),
                    ),
                    trailing: const Icon(
                      Icons.calendar_today,
                      color: kgoldColor,
                    ),
                    onTap: () async {
                      final d = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
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
                                onPrimary: isDark ? kblackColor : kwhiteColor,
                                secondary: kgoldColor,
                                onSecondary: isDark ? kblackColor : kwhiteColor,
                                error: Colors.red,
                                onError: kwhiteColor,
                                background: isDark ? kblackColor : kwhiteColor,
                                onBackground: isDark
                                    ? kwhiteColor
                                    : kblackColor,
                                surface: isDark ? kblackColor : kwhiteColor,
                                onSurface: isDark ? kwhiteColor : kblackColor,
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
                      if (d != null) setState(() => selectedDate = d);
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// ACHIEVEMENT
            _labeledInput(
              label: "Achievement",
              controller: achievementCtrl,
              focusNode: achievementFocus,
              hint: "Enter achievement",
              isGold: isGold(achievementFocus, achievementCtrl),
            ),

            const SizedBox(height: 20),

            /// DESCRIPTION
            _labeledInput(
              label: "Description",
              controller: descCtrl,
              focusNode: descFocus,
              hint: "Write something meaningful...",
              maxLines: 3,
              isGold: isGold(descFocus, descCtrl),
            ),

            const SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upload Media",
                  style: TextStyle(
                    color: selectedMedia.isNotEmpty
                        ? kgoldColor
                        : textColor.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                _box(
                  isGold: selectedMedia.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: selectedMedia.isEmpty
                        ? ListTile(
                            leading: const Icon(
                              Icons.upload,
                              color: kgoldColor,
                            ),
                            title: Text(
                              "Upload Media",
                              style: TextStyle(color: textColor),
                            ),
                            onTap: _uploadMedia,
                          )
                        : SizedBox(
                            height: 110,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: selectedMedia.length + 1,
                              itemBuilder: (context, index) {
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
              ],
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Radio<bool>(
                  value: false,
                  groupValue: scheduleLater,
                  activeColor: kgoldColor,
                  onChanged: (v) => setState(() => scheduleLater = v!),
                ),
                Text("Publish Now", style: TextStyle(color: textColor)),
                Radio<bool>(
                  value: true,
                  groupValue: scheduleLater,
                  activeColor: kgoldColor,
                  onChanged: (v) => setState(() => scheduleLater = v!),
                ),
                Text("Schedule Later", style: TextStyle(color: textColor)),
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
                                  onPrimary: isDark ? kblackColor : kwhiteColor,
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
                                  onSurface: isDark ? kwhiteColor : kblackColor,
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
                        if (date != null) setState(() => scheduledDate = date);
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
                                  onPrimary: isDark ? kblackColor : kwhiteColor,
                                  secondary: kgoldColor,
                                  onSecondary: isDark
                                      ? kblackColor
                                      : kwhiteColor,
                                  error: Colors.red,
                                  onError: kwhiteColor,

                                  surface: isDark ? kblackColor : kwhiteColor,
                                  onSurface: isDark ? kwhiteColor : kblackColor,
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
                        if (time != null) setState(() => scheduledTime = time);
                      },
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: kgoldColor, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// LABELED INPUT
  Widget _labeledInput({
    required String label,
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hint,
    required bool isGold,
    int maxLines = 1,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isGold ? kgoldColor : textColor.withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          focusNode: focusNode,
          maxLines: maxLines,
          onChanged: (_) => setState(() {}),
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: hintColor),
            filled: true,
            fillColor: isDark ? kblackColor : kwhiteColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isGold ? kgoldColor : borderColor,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kgoldColor, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  /// BORDER BOX
  Widget _box({required Widget child, required bool isGold}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? kblackColor : kwhiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isGold ? kgoldColor : borderColor,
          width: isGold ? 2 : 1.5,
        ),
      ),
      child: child,
    );
  }

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

  /// MEDIA PICKER
  Future<void> _uploadMedia() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: bgColor,
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
                title: Text("Pick Image", style: TextStyle(color: textColor)),
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
                title: Text("Pick Video", style: TextStyle(color: textColor)),
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
