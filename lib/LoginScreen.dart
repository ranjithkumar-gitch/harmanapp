import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 12.0,
            top: 100,
            //bottom: 50,
          ),
          child: Form(
            child: Column(
              children: [
                Text(
                  'Sign in',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Welcome back',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                _buildEmailField("Email *"),
                SizedBox(height: 10),
                _buildPasswordField("Password *"),
                SizedBox(height: 10),
                _buildForgotField("Forgot password?"),
                SizedBox(height: 10),
                _divider("OR"),
                SizedBox(height: 20),
                _buildElevatedButtons(),
                SizedBox(height: 20),
                _buildTextSignup("Don`t have an account?", "Sign up"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
        ),
        const SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your email",
          ),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget _buildPasswordField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white70),
        ),
        const SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your password",
            suffixIcon: Icon(
              _passwordVisible ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          obscureText: true,
        ),
      ],
    );
  }

  _buildForgotField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forgot password?',
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.white70),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Sign in',
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

  _divider(String label) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 160, child: Divider(color: Colors.grey[400])),
            SizedBox(width: 5),
            Text(
              label,
              style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey[400]),
            ),
            SizedBox(width: 5),
            SizedBox(width: 160, child: Divider(color: Colors.grey[400])),
          ],
        ),
      ],
    );
  }

  _buildElevatedButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Colors.grey[850],
              ),
              onPressed: () {},
              child: Icon(Icons.apple, color: Colors.white, size: 25),
            ),
            SizedBox(width: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Colors.grey[850],
              ),
              onPressed: () {},
              child: Icon(Icons.one_x_mobiledata, color: Colors.blue, size: 25),
            ),
            SizedBox(width: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Colors.grey[850],
              ),
              onPressed: () {},
              child: Icon(Icons.drive_eta, color: Colors.blue, size: 25),
            ),
            SizedBox(width: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Colors.grey[850],
              ),
              onPressed: () {},
              child: Icon(Icons.message, color: Colors.blue, size: 25),
            ),
            SizedBox(width: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Colors.grey[850],
              ),
              onPressed: () {},
              child: Icon(Icons.telegram, color: Colors.blue, size: 25),
            ),
          ],
        ),
      ],
    );
  }

  _buildTextSignup(String label, String buttonLbl) {
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
                buttonLbl,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.pink[400],
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
