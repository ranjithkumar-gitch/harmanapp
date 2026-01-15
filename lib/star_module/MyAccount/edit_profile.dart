import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();

  final FocusNode usernameFocus = FocusNode();
  final FocusNode displayNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();
  final FocusNode bioFocus = FocusNode();
  final FocusNode dobFocus = FocusNode();

  final ImagePicker _picker = ImagePicker();
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    usernameFocus.addListener(() => setState(() {}));
    displayNameFocus.addListener(() => setState(() {}));
  }

  Future<void> _pickProfileImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bool usernameGold =
        usernameController.text.isNotEmpty || usernameFocus.hasFocus;

    final bool bioGold = bioController.text.isNotEmpty || bioFocus.hasFocus;
    final bool emailGold =
        emailController.text.isNotEmpty || emailFocus.hasFocus;
    final bool dobGold = dobController.text.isNotEmpty || dobFocus.hasFocus;
    final bool addressGold =
        addressController.text.isNotEmpty || addressFocus.hasFocus;

    return Scaffold(
      backgroundColor: isDark ? kblackColor : kwhiteColor,
      appBar: AppBar(
        backgroundColor: isDark ? kblackColor : kwhiteColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? kwhiteColor : kblackColor,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: isDark ? kwhiteColor : kblackColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kgoldColor, width: 2),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: _profileImage != null
                              ? FileImage(_profileImage!)
                              : const AssetImage(
                                  'assets/sources/profiles/lucas-sankey.jpg',
                                ),
                        ),
                      ),
                    ),

                    /// CAMERA ICON
                    Positioned(
                      bottom: -6,
                      right: -6,
                      child: GestureDetector(
                        onTap: _pickProfileImage,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: isDark ? kblackColor : kwhiteColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: kgoldColor, width: 1.5),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: kgoldColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// USERNAME
              Text(
                "Username *",
                style: TextStyle(color: isDark ? kwhiteColor : kblackColor),
              ),
              const SizedBox(height: 6),
              _inputField(
                controller: usernameController,
                focusNode: usernameFocus,
                hint: "Virat Kohli",
                isGold: usernameGold,
              ),

              const SizedBox(height: 20),

              /// DISPLAY NAME
              Text(
                "Bio",
                style: TextStyle(color: isDark ? kwhiteColor : kblackColor),
              ),
              const SizedBox(height: 6),
              _inputField(
                controller: bioController,
                focusNode: bioFocus,
                hint: "Cricketer",
                isGold: bioGold,
              ),
              const SizedBox(height: 20),

              /// DISPLAY NAME
              Text(
                "Email",
                style: TextStyle(color: isDark ? kwhiteColor : kblackColor),
              ),
              const SizedBox(height: 6),
              _inputField(
                controller: emailController,
                focusNode: emailFocus,
                hint: "virat@gmail.com",
                isGold: emailGold,
              ),
              const SizedBox(height: 20),

              /// DISPLAY NAME
              Text(
                "Date of Birth",
                style: TextStyle(color: isDark ? kwhiteColor : kblackColor),
              ),
              const SizedBox(height: 6),
              _inputField(
                controller: dobController,
                focusNode: dobFocus,
                hint: "18 Feb 1990",
                isGold: dobGold,
              ),
              const SizedBox(height: 20),

              Text(
                "Address",
                style: TextStyle(color: isDark ? kwhiteColor : kblackColor),
              ),
              const SizedBox(height: 6),
              _inputField(
                controller: addressController,
                focusNode: addressFocus,
                hint: "Mumbai",
                isGold: addressGold,
              ),

              const SizedBox(height: 20),

              /// SAVE BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? kblackColor : kwhiteColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: kgoldColor, width: 2),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Save profile logic
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(
                      color: kgoldColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 INPUT FIELD (SAME AS BASIC INFO)
  Widget _inputField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hint,
    required bool isGold,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: (_) => setState(() {}),
      style: TextStyle(color: isDark ? kwhiteColor : kblackColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? kblackColor : kwhiteColor,
        hintText: hint,
        hintStyle: TextStyle(color: isDark ? Colors.white38 : Colors.black38),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: isGold
                ? kgoldColor
                : (isDark ? Colors.white54 : Colors.black54),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kgoldColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
