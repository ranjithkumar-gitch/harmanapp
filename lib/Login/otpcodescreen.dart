import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Dashboard/mainscreen.dart';
import 'package:harmanapp/widgets/colors.dart';

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
                padding: EdgeInsets.only(left: 16.0),
                child: Icon(Icons.arrow_back_ios, color: kgoldColor, size: 24),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
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
            const SizedBox(height: 25),

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
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // final otp = _c1.text + _c2.text + _c3.text + _c4.text;

                  // if (otp.length == 4) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const MainScreen(),
                  //     ),
                  //   );1
                  // }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
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
                  color: hasValue ? kgoldColor : Colors.white,
                  width: 1.5,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: kgoldColor, width: 2),
              ),
            ),
          );
        },
      ),
    );
  }
}
