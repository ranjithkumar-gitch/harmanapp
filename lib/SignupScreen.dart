import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/basicinfo_screen.dart';
import 'package:harmanapp/verifyPhoneNumber.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

enum RadioType { fillColor, backgroundColor, side, innerRadius }

class _SignupscreenState extends State<Signupscreen> {
  bool isChecked = false;
  bool isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 100),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'HM',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 200),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.language, color: Colors.white),
                ),

                Text(
                  'Endlish (US)',
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildTextSignUpField("Sign up"),
            SizedBox(height: 10),
            _buildTextField("Choose how you want to be part the Harman "),
            SizedBox(height: 20),
            _buildFanTextfield(
              "I am a Fan",
              "Connect with you favorite creators",
            ),
            SizedBox(height: 20),
            _buildCreatorTextfield(
              "I am a Creator",
              "Share your content and build your community",
            ),
            SizedBox(height: 200),
            _continueButton("Continue"),
            SizedBox(height: 15),
            _signInButton("Already have an account?", "Sign in"),
          ],
        ),
      ),
    );
  }

  _buildTextSignUpField(String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  _buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white70),
        ),
        Text(
          'community.',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white70),
        ),
      ],
    );
  }

  _buildFanTextfield(String title, String subTitle) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white38, width: 1.2),
          ),
          child: ListTile(
            iconColor: Colors.purple,
            title: Text(
              title,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
            ),
            subtitle: Text(
              subTitle,
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 13),
            ),
            leading: Icon(Icons.account_circle_rounded, size: 30),
            trailing: Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                  isChecked2 = false;
                });
              },
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  _buildCreatorTextfield(String title, String subTitle) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white38, width: 1.2),
          ),
          child: ListTile(
            iconColor: Colors.purple,
            title: Text(
              title,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
            ),
            subtitle: Text(
              subTitle,
              style: GoogleFonts.poppins(color: Colors.white70, fontSize: 13),
            ),
            leading: Icon(Icons.emoji_emotions, size: 30),
            trailing: Checkbox(
              value: isChecked2,
              onChanged: (value) {
                setState(() {
                  isChecked2 = value!;
                  isChecked = false;
                });
              },
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  _continueButton(String label) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
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
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _signInButton(String label, String buttonText) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white70),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                buttonText,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
