import 'package:flutter/material.dart';
import 'package:harmanapp/mainscreen.dart';

class Verifyphonenumber extends StatefulWidget {
  const Verifyphonenumber({super.key});

  @override
  State<Verifyphonenumber> createState() => _VerifyphonenumberState();
}

class _VerifyphonenumberState extends State<Verifyphonenumber> {
  final TextEditingController phoneNumberController = TextEditingController();
  bool termsAccepted = false;
  @override
  Widget build(BuildContext context) {
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
                children: [
                  const Text(
                    'HM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.language, color: Colors.white70),
                      SizedBox(width: 6),
                      Text(
                        "English (US)",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.check_circle_outline, color: Colors.white),
                    Expanded(child: Container(height: 2, color: Colors.white)),
                    Icon(Icons.check_circle_outline, color: Colors.white),
                    Expanded(child: Container(height: 2, color: Colors.white)),
                    Icon(Icons.phone, color: Colors.white),
                    Text("Phone number", style: TextStyle(color: Colors.white)),
                    Expanded(
                      child: Container(height: 1, color: Colors.white24),
                    ),
                    Icon(Icons.qr_code_2, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "Verify your phone number",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Your phone number lets us notify you of fan messages and new earnings promptly.",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Phone Number *",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 6),

              customInputField(
                phoneNumberController,
                "Enter your phone number",
              ),

              const SizedBox(height: 6),
              const Text(
                "OPt-in to receive SMS notifications from Harman app.",
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),

              const SizedBox(height: 25),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: termsAccepted,
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    onChanged: (v) => setState(() => termsAccepted = v!),
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                            "By clicking this box, I agree to the harman app notificatio ",
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Terms of Service",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child: const Text(
                    "Send Verification Code",
                    style: TextStyle(
                      color: Colors.black,
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

  customInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF1C1C1E),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
