import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/add_socialmedia.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();

  final FocusNode usernameFocus = FocusNode();
  final FocusNode displayNameFocus = FocusNode();

  String? selectedMonth;
  String? selectedDay;
  String? selectedYear;
  bool termsAccepted = false;

  @override
  void initState() {
    super.initState();
    usernameFocus.addListener(() => setState(() {}));
    displayNameFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    usernameController.dispose();
    displayNameController.dispose();
    usernameFocus.dispose();
    displayNameFocus.dispose();
    super.dispose();
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kgoldColor,
                      size: 24,
                    ),
                  ),
                  // Container(
                  //   height: 35,
                  //   width: 35,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Color(0xFFF5D778)),
                  //     color: Colors.transparent,
                  //     image: DecorationImage(
                  //       image: AssetImage('assets/App_logo_2.jpeg'),
                  //       fit: BoxFit.cover,
                  //     ),
                  //     borderRadius: BorderRadius.circular(8.0),
                  //   ),
                  // ),
                ],
              ),

              const SizedBox(height: 10),

              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                      width: 140,
                      child: Image(image: AssetImage('assets/app_logo2.png')),
                    ),
                    Text(
                      'My Autobiography',
                      style: GoogleFonts.greatVibes(
                        textStyle: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: kgoldColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 4),
              const Center(
                child: Text(
                  "Enter your account details.",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 30),

              const Text("Username *", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 6),

              customInputField(
                controller: usernameController,
                focusNode: usernameFocus,
                hint: "Enter your username",
                isGold: usernameGold,
              ),

              const SizedBox(height: 20),

              const Text(
                "Display Name *",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 6),

              customInputField(
                controller: displayNameController,
                focusNode: displayNameFocus,
                hint: "Enter your display name",
                isGold: displayNameGold,
              ),

              const SizedBox(height: 20),

              const Text("Birthday *", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: dropdownBox(
                      label: "Month",
                      value: selectedMonth,
                      items: List.generate(12, (i) => "${i + 1}"),
                      onChanged: (v) => setState(() => selectedMonth = v),
                      isSelected: selectedMonth != null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: dropdownBox(
                      label: "Day",
                      value: selectedDay,
                      items: List.generate(31, (i) => "${i + 1}"),
                      onChanged: (v) => setState(() => selectedDay = v),
                      isSelected: selectedDay != null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: dropdownBox(
                      label: "Year",
                      value: selectedYear,
                      items: List.generate(100, (i) => "${2025 - i}"),
                      onChanged: (v) => setState(() => selectedYear = v),
                      isSelected: selectedYear != null,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),
              const Text(
                "Creators must be 18+. Date of birth can't be changed later.",
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),

              const SizedBox(height: 25),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: termsAccepted,
                    activeColor: kgoldColor,
                    checkColor: Colors.black,
                    onChanged: (v) => setState(() => termsAccepted = v!),
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                            "By clicking this box, I agree to the harman app Creator ",
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Terms of Service",
                            style: TextStyle(
                              color: kgoldColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SocialmediaConnect(),
                      ),
                    );
                  },
                  child: const Text(
                    "Confirm and Continue",
                    style: TextStyle(
                      color: kgoldColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget customInputField({
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

  Widget dropdownBox({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? kgoldColor : Colors.white,
          width: 2,
        ),
      ),
      child: DropdownButton<String>(
        value: value,
        hint: Text(label, style: const TextStyle(color: Colors.white38)),
        dropdownColor: Colors.black,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white54),
        underline: const SizedBox(),
        isExpanded: true,
        style: const TextStyle(color: Colors.white),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
