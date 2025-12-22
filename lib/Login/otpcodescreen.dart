import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Dashboard/mainscreen.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({super.key});

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  final TextEditingController _c1 = TextEditingController();

  final TextEditingController _c2 = TextEditingController();

  final TextEditingController _c3 = TextEditingController();

  final TextEditingController _c4 = TextEditingController();
  final _f1 = FocusNode();
  final _f2 = FocusNode();
  final _f3 = FocusNode();
  final _f4 = FocusNode();

  @override
  void dispose() {
    _c1.dispose();
    _c2.dispose();
    _c3.dispose();
    _c4.dispose();
    _f1.dispose();
    _f2.dispose();
    _f3.dispose();
    _f4.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              "Enter Verification Code",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We sent a 4-digit code to your phone.",
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                otpBox(
                  context: context,
                  controller: _c1,
                  currentFocus: _f1,
                  nextFocus: _f2,
                ),
                otpBox(
                  context: context,
                  controller: _c2,
                  currentFocus: _f2,
                  nextFocus: _f3,
                ),
                otpBox(
                  context: context,
                  controller: _c3,
                  currentFocus: _f3,
                  nextFocus: _f4,
                ),
                otpBox(context: context, controller: _c4, currentFocus: _f4),
              ],
            ),

            const Spacer(),
            Center(
              child: Text(
                'Harman App',
                style: GoogleFonts.greatVibes(
                  textStyle: const TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF5D778),
                  ),
                ),
              ),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  final otp = _c1.text + _c2.text + _c3.text + _c4.text;

                  if (otp.length == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: const Color(0xFFF5D778),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(color: Color(0xFFF5D778), width: 2),
                  ),
                ),
                child: const Text(
                  "Verify",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget _otpBox(
  //   TextEditingController controller,
  //   FocusNode currentFocus,
  //   FocusNode? nextFocus,
  // ) {
  //   return RawKeyboardListener(
  //     focusNode: FocusNode(),
  //     onKey: (event) {
  //       if (event is RawKeyDownEvent &&
  //           event.logicalKey == LogicalKeyboardKey.backspace &&
  //           controller.text.isEmpty) {
  //         FocusScope.of(context).previousFocus();
  //       }
  //     },
  //     child: Container(
  //       width: 60,
  //       height: 60,
  //       decoration: BoxDecoration(
  //         color: const Color(0xFF1A1A1A),
  //         borderRadius: BorderRadius.circular(14),
  //       ),
  //       child: TextField(
  //         controller: controller,
  //         focusNode: currentFocus,
  //         maxLength: 1,
  //         textAlign: TextAlign.center,
  //         style: const TextStyle(fontSize: 24, color: Colors.white),
  //         keyboardType: TextInputType.number,
  //         inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  //         onChanged: (value) {
  //           if (value.isNotEmpty && nextFocus != null) {
  //             FocusScope.of(context).requestFocus(nextFocus);
  //           }
  //         },
  //         decoration: InputDecoration(
  //           counterText: "",
  //           contentPadding: EdgeInsets.zero,
  //           border: InputBorder.none,
  //           enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(14),
  //             borderSide: const BorderSide(color: Colors.white, width: 1),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(14),
  //             borderSide: const BorderSide(color: Color(0xFFF5D778), width: 2),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget otpBox({
    required BuildContext context,
    required TextEditingController controller,
    required FocusNode currentFocus,
    FocusNode? nextFocus,
  }) {
    return SizedBox(
      width: 60,
      height: 60,
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, _) {
          final bool hasValue = value.text.isNotEmpty;

          return TextField(
            controller: controller,
            focusNode: currentFocus,
            maxLength: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, color: Colors.white),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],

            onChanged: (val) {
              if (val.isNotEmpty && nextFocus != null) {
                FocusScope.of(context).requestFocus(nextFocus);
              }
            },

            decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: const Color(0xFF1A1A1A),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: hasValue
                      ? const Color(0xFFF5D778) // ✅ GOLD after input
                      : Colors.white,
                  width: 1.5,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Color(0xFFF5D778),
                  width: 2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
