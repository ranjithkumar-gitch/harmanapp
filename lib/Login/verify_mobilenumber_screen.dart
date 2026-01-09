// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:harmanapp/Login/otpcodescreen.dart';

// class Verifyphonenumber extends StatefulWidget {
//   const Verifyphonenumber({super.key});

//   @override
//   State<Verifyphonenumber> createState() => _VerifyphonenumberState();
// }

// class _VerifyphonenumberState extends State<Verifyphonenumber> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF0F0F0F),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF0F0F0F),
//         elevation: 0,
//         leadingWidth: 90, // 👈 IMPORTANT
//         leading: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: const Padding(
//                 padding: EdgeInsets.only(left: 8.0),
//                 child: Icon(
//                   Icons.arrow_back_ios,
//                   color: Color(0xFFF5D778),
//                   size: 24,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 6),
//             // Container(
//             //   height: 35,
//             //   width: 35,
//             //   decoration: BoxDecoration(
//             //     border: Border.all(color: Color(0xFFF5D778)),
//             //     borderRadius: BorderRadius.circular(8.0),
//             //     image: const DecorationImage(
//             //       image: AssetImage('assets/App_logo_2.jpeg'),
//             //       fit: BoxFit.cover,
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),

//             Center(
//               child: Text(
//                 "Verify Your Phone Number",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             const SizedBox(height: 30),

//             Text(
//               "Phone Number *",
//               style: TextStyle(color: Colors.white, fontSize: 16),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               keyboardType: TextInputType.number,
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//               style: TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Color(0xFF1A1A1A),
//                 hintText: "Enter Your Phone Number",
//                 hintStyle: TextStyle(color: Colors.white54),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide.none,
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Colors.white, width: 1),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Color(0xFFF5D778), width: 2),
//                 ),
//               ),
//             ),

//             const Spacer(),
//             Center(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 200,
//                     width: 200,
//                     child: Image(image: AssetImage('assets/App_logo_2.jpeg')),
//                   ),
//                   Text(
//                     'My Autobiography',
//                     style: GoogleFonts.greatVibes(
//                       textStyle: const TextStyle(
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFFF5D778),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const Spacer(),

//             SizedBox(
//               width: double.infinity,
//               height: 55,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => OtpCodeScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   foregroundColor: Color(0xFFF5D778),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(14),
//                     side: BorderSide(color: Color(0xFFF5D778), width: 2),
//                   ),
//                 ),
//                 child: Text(
//                   "Send Verification Code",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),

//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/otp_screen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class Verifyphonenumber extends StatefulWidget {
  const Verifyphonenumber({super.key});

  @override
  State<Verifyphonenumber> createState() => _VerifyphonenumberState();
}

class _VerifyphonenumberState extends State<Verifyphonenumber> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;

    return Scaffold(
      backgroundColor: kblackColor,
      appBar: AppBar(
        backgroundColor: kblackColor,
        elevation: 0,
        leadingWidth: 90,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(Icons.arrow_back_ios, color: kgoldColor, size: 24),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height * 0.85),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.03),

                Center(
                  child: Text(
                    "Verify Your Phone Number",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.065,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.05),

                const Text(
                  "Phone Number *",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),

                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFF1A1A1A),
                    hintText: "Enter Your Phone Number",
                    hintStyle: const TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: kgoldColor, width: 2),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.08),

                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/app_logo2.png',
                        height: size.width * 0.3,
                        width: size.width * 0.3,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: isSmallScreen ? 6 : 12),
                      Text(
                        'My Autobiography',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.greatVibes(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: kgoldColor,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.20),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtpCodeScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: kgoldColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: const BorderSide(color: kgoldColor, width: 2),
                      ),
                    ),
                    child: const Text(
                      "Send Verification Code",
                      style: TextStyle(
                        fontSize: 18,
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
      ),
    );
  }
}
