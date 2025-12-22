// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:harmanapp/Login/socialmedia_connect.dart';

// class BasicInfoScreen extends StatefulWidget {
//   const BasicInfoScreen({super.key});

//   @override
//   State<BasicInfoScreen> createState() => _BasicInfoScreenState();
// }

// class _BasicInfoScreenState extends State<BasicInfoScreen> {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController displayNameController = TextEditingController();

//   String? selectedMonth;
//   String? selectedDay;
//   String? selectedYear;
//   bool termsAccepted = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "HM",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   // Row(
//                   //   children: const [
//                   //     Icon(Icons.language, color: Colors.white70),
//                   //     SizedBox(width: 6),
//                   //     Text(
//                   //       "English (US)",
//                   //       style: TextStyle(color: Colors.white70),
//                   //     ),
//                   //   ],
//                   // ),
//                 ],
//               ),

//               const SizedBox(height: 55),

//               Center(
//                 child: Text(
//                   'Harman App',
//                   style: GoogleFonts.greatVibes(
//                     textStyle: const TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFFF5D778),
//                     ),
//                   ),
//                 ),
//                 // Text(
//                 //   "Basic Info",
//                 //   style: TextStyle(
//                 //     color: Colors.white,
//                 //     fontSize: 28,
//                 //     fontWeight: FontWeight.bold,
//                 //   ),
//                 // ),
//               ),
//               const SizedBox(height: 4),
//               const Center(
//                 child: Text(
//                   "Enter your account details.",
//                   style: TextStyle(color: Colors.white70),
//                 ),
//               ),

//               const SizedBox(height: 30),

//               const Text("Username *", style: TextStyle(color: Colors.white)),
//               const SizedBox(height: 6),
//               customInputField(usernameController, "Enter your username"),

//               const SizedBox(height: 20),

//               const Text(
//                 "Display Name *",
//                 style: TextStyle(color: Colors.white),
//               ),
//               const SizedBox(height: 6),
//               customInputField(
//                 displayNameController,
//                 "Enter your display name",
//               ),

//               const SizedBox(height: 20),

//               const Text("Birthday *", style: TextStyle(color: Colors.white)),
//               const SizedBox(height: 10),

//               Row(
//                 children: [
//                   Expanded(
//                     child: dropdownBox(
//                       label: "Month",
//                       value: selectedMonth,
//                       items: List.generate(12, (i) => "${i + 1}"),
//                       onChanged: (v) => setState(() => selectedMonth = v),
//                       isSelected: selectedMonth != null,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: dropdownBox(
//                       label: "Day",
//                       value: selectedDay,
//                       items: List.generate(31, (i) => "${i + 1}"),
//                       onChanged: (v) => setState(() => selectedDay = v),
//                       isSelected: selectedDay != null,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: dropdownBox(
//                       label: "Year",
//                       value: selectedYear,
//                       items: List.generate(100, (i) => "${2025 - i}"),
//                       onChanged: (v) => setState(() => selectedYear = v),
//                       isSelected: selectedYear != null,
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 6),
//               const Text(
//                 "Creators must be 18+. Date of birth can't be changed later.",
//                 style: TextStyle(color: Colors.white60, fontSize: 12),
//               ),

//               const SizedBox(height: 25),

//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Checkbox(
//                     value: termsAccepted,
//                     // hoverColor: Color(0xFFF5D778),
//                     // focusColor: Color(0xFFF5D778),
//                     activeColor: Color(0xFFF5D778), //Colors.white,
//                     checkColor: Colors.black,
//                     onChanged: (v) => setState(() => termsAccepted = v!),
//                   ),
//                   const Expanded(
//                     child: Text.rich(
//                       TextSpan(
//                         text:
//                             "By clicking this box, I agree to the harman app Creator ",
//                         style: TextStyle(color: Colors.white),
//                         children: [
//                           TextSpan(
//                             text: "Terms of Service",
//                             style: TextStyle(
//                               color: Color(0xFFF5D778),
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 40),

//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       side: BorderSide(color: Color(0xFFF5D778), width: 2),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SocialmediaConnect(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "Confirm and Continue",
//                     style: TextStyle(
//                       color: Color(0xFFF5D778),
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget customInputField(TextEditingController controller, String hint) {
//     return TextField(
//       controller: controller,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: const Color(0xFF1C1C1E),
//         hintText: hint,
//         hintStyle: const TextStyle(color: Colors.white38),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colors.white, width: 2),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colors.white, width: 2),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Color(0xFFF5D778), width: 2),
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 14,
//         ),
//       ),
//     );
//   }

//   Widget dropdownBox({
//     required String label,
//     required String? value,
//     required List<String> items,
//     required Function(String?) onChanged,
//     required bool isSelected,
//   }) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1C1C1E),
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: isSelected ? Color(0xFFF5D778) : Colors.white,
//           width: isSelected ? 2 : 2,
//         ),
//       ),
//       child: DropdownButton<String>(
//         value: value,
//         hint: Text(label, style: const TextStyle(color: Colors.white38)),
//         dropdownColor: Colors.black,
//         icon: const Icon(Icons.arrow_drop_down, color: Colors.white54),
//         underline: const SizedBox(),
//         isExpanded: true,
//         style: const TextStyle(color: Colors.white),
//         items: items
//             .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//             .toList(),
//         onChanged: onChanged,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/socialmedia_connect.dart';

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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "HM",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 55),

              Center(
                child: Text(
                  'Harman App',
                  style: GoogleFonts.greatVibes(
                    textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF5D778),
                    ),
                  ),
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
                    activeColor: const Color(0xFFF5D778),
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
                              color: Color(0xFFF5D778),
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
                      side: const BorderSide(
                        color: Color(0xFFF5D778),
                        width: 2,
                      ),
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
                      color: Color(0xFFF5D778),
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
            color: isGold ? const Color(0xFFF5D778) : Colors.white,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFF5D778), width: 2),
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
          color: isSelected ? const Color(0xFFF5D778) : Colors.white,
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
