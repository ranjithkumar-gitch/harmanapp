import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/Login/LoginScreen.dart';
import 'package:harmanapp/Login/basicinfo_screen.dart';
import 'package:harmanapp/widgets/colors.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  String selectedRole = "Stargazer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, color: kgoldColor),
                      ),

                      const SizedBox(width: 6),
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
                ],
              ),

              const SizedBox(height: 10),

              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 140,
                      width: 140,
                      child: Image(image: AssetImage('assets/App_logo_2.jpeg')),
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

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  'How would you like to be part of the "legacy"',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                ),
              ),

              const SizedBox(height: 40),

              _optionCard(
                title: "I am a Stargazer",
                subtitle: "Light the journey of your star",
                icon: Icons.person,
                isSelected: selectedRole == "Stargazer",
                onTap: () => setState(() => selectedRole = "Stargazer"),
              ),

              const SizedBox(height: 15),

              _optionCard(
                title: "I am a Star",
                subtitle: "Live a life & leave a legacy",
                icon: Icons.star,
                isSelected: selectedRole == "Star",
                onTap: () => setState(() => selectedRole = "Star"),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: kgoldColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: kgoldColor, width: 2),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BasicInfoScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(color: Colors.white60),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: TextStyle(
                          color: kgoldColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginscreen(),
                              ),
                            );
                          },
                      ),
                    ],
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

  Widget _optionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? kgoldColor : Color(0xFFFFFFFF),
            width: isSelected ? 2 : 1,
          ),
          color: Colors.white.withOpacity(isSelected ? 0.07 : 0.03),
        ),
        child: Row(
          children: [
            // Container(
            //   height: 40,
            //   width: 40,
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //     color: isSelected
            //         ? const Color(0xFFF5D778)
            //         : Colors.white.withOpacity(0.2),
            //     borderRadius: BorderRadius.circular(
            //       4,
            //     ), // remove for sharp square
            //   ),

            //   child: Icon(icon, color: Colors.white),
            // ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected ? kgoldColor : Colors.white,
                  width: 1.5,
                ),
              ),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.transparent,
                child: Icon(
                  icon,
                  size: 22,
                  color: isSelected ? kgoldColor : Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? kgoldColor : Color(0xFFFFFFFF),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? kgoldColor : Colors.white54,
            ),
          ],
        ),
      ),
    );
  }
}
