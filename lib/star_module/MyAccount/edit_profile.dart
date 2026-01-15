import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();

  final FocusNode usernameFocus = FocusNode();
  final FocusNode displayNameFocus = FocusNode();

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
    final bool usernameGold =
        usernameController.text.isNotEmpty || usernameFocus.hasFocus;

    final bool displayNameGold =
        displayNameController.text.isNotEmpty || displayNameFocus.hasFocus;

    return Scaffold(
      backgroundColor: kblackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔙 BACK
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios, color: kgoldColor),
              ),

              const SizedBox(height: 20),

              /// 👤 PROFILE IMAGE
              // Center(
              //   child: Stack(
              //     children: [
              //       Container(
              //         height: 130,
              //         width: 130,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           border: Border.all(color: kgoldColor, width: 2),
              //           image: DecorationImage(
              //             fit: BoxFit.cover,
              //             image: _profileImage != null
              //                 ? FileImage(_profileImage!)
              //                 : const AssetImage(
              //                         'assets/sources/profiles/lucas-sankey.jpg',
              //                       )
              //                       as ImageProvider,
              //           ),
              //         ),
              //       ),
              //       Positioned(
              //         bottom: -6,
              //         right: -6,
              //         child: GestureDetector(
              //           onTap: _pickProfileImage,
              //           child: Container(
              //             padding: const EdgeInsets.all(6),
              //             decoration: BoxDecoration(
              //               color: Colors.black,
              //               shape: BoxShape.circle,
              //               border: Border.all(color: kgoldColor),
              //             ),
              //             child: const Icon(
              //               Icons.camera_alt,
              //               color: kgoldColor,
              //               size: 18,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
                            color: Colors.black,
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

              Center(
                child: Text(
                  "Edit Profile",
                  style: GoogleFonts.greatVibes(
                    textStyle: const TextStyle(fontSize: 30, color: kgoldColor),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// USERNAME
              const Text("Username *", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 6),
              _inputField(
                controller: usernameController,
                focusNode: usernameFocus,
                hint: "Virat Kohli",
                isGold: usernameGold,
              ),

              const SizedBox(height: 20),

              /// DISPLAY NAME
              const Text("Bio", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 6),
              _inputField(
                controller: displayNameController,
                focusNode: displayNameFocus,
                hint: "Cricketer",
                isGold: displayNameGold,
              ),
              const SizedBox(height: 20),

              /// DISPLAY NAME
              const Text("Email", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 6),
              _inputField(
                controller: displayNameController,
                focusNode: displayNameFocus,
                hint: "virat@gmail.com",
                isGold: displayNameGold,
              ),
              const SizedBox(height: 20),

              /// DISPLAY NAME
              const Text("DOB", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 6),
              _inputField(
                controller: displayNameController,
                focusNode: displayNameFocus,
                hint: "18 Feb 1990",
                isGold: displayNameGold,
              ),
              const SizedBox(height: 20),

              const Text("Address", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 6),
              _inputField(
                controller: displayNameController,
                focusNode: displayNameFocus,
                hint: "Mumbai",
                isGold: displayNameGold,
              ),

              const SizedBox(height: 40),

              /// SAVE BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
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
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: (_) => setState(() {}),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF1C1C1E),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: isGold ? kgoldColor : Colors.white,
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
