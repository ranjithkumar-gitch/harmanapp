import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:harmanapp/Login/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:harmanapp/Dashboard/main_screen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  double fontsize = 18;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _obscureText = true;
  String? _selectedRole;

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(() => setState(() {}));
    _passwordFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _showRoleSelectionDialog() {
    setState(() {
      _selectedRole = null;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            return Dialog(
              backgroundColor: kblackColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: kgoldColor, width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Which Role would you Prefer?",
                      style: TextStyle(
                        color: kwhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Stargazer Radio Button
                    GestureDetector(
                      onTap: () {
                        setDialogState(() {
                          _selectedRole = 'Stargazer';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _selectedRole == 'Stargazer'
                                ? kgoldColor
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kgoldColor, width: 2),
                              ),
                              child: _selectedRole == 'Stargazer'
                                  ? Center(
                                      child: Container(
                                        width: 12,
                                        height: 12,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kgoldColor,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Stargazer',
                              style: TextStyle(
                                color: kwhiteColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Star Radio Button
                    GestureDetector(
                      onTap: () {
                        setDialogState(() {
                          _selectedRole = 'Star';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _selectedRole == 'Star'
                                ? kgoldColor
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kgoldColor, width: 2),
                              ),
                              child: _selectedRole == 'Star'
                                  ? Center(
                                      child: Container(
                                        width: 12,
                                        height: 12,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kgoldColor,
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Star',
                              style: TextStyle(
                                color: kwhiteColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Cancel and Login Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: kblackColor,
                              side: const BorderSide(
                                color: kgoldColor,
                                width: 2,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: kgoldColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              if (_selectedRole != null) {
                                Navigator.of(context).pop();
                                if (_selectedRole == 'Stargazer') {
                                  Get.to(
                                    () => const MainScreen(),
                                    transition: Transition.zoom,
                                    duration: const Duration(seconds: 1),
                                  );
                                } else if (_selectedRole == 'Star') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        'Star role selected',
                                        style: TextStyle(color: kwhiteColor),
                                      ),
                                      backgroundColor: kgoldColor,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                }
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: kblackColor,
                              side: const BorderSide(
                                color: kgoldColor,
                                width: 2,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: kgoldColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool emailGold =
        _emailController.text.isNotEmpty || _emailFocus.hasFocus;

    final bool passwordGold =
        _passwordController.text.isNotEmpty || _passwordFocus.hasFocus;

    return Scaffold(
      backgroundColor: kblackColor,
      // backgroundColor: kwhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      const SizedBox(height: 6),
                      const Text(
                        "Welcome back",
                        style: TextStyle(color: kgreyColor, fontSize: 16),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Email *",
                  style: TextStyle(color: kwhiteColor, fontSize: 16),
                ),
                const SizedBox(height: 8),

                // EMAIL FIELD
                TextField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  onChanged: (_) => setState(() {}),
                  style: const TextStyle(color: kwhiteColor),
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    hintStyle: const TextStyle(color: kgreyColor),
                    filled: true,
                    fillColor: kfillgreyColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: emailGold ? kgoldColor : kwhiteColor,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: kgoldColor, width: 2),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Password *",
                  style: TextStyle(color: kwhiteColor, fontSize: 16),
                ),
                const SizedBox(height: 8),

                // PASSWORD FIELD
                TextField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  obscureText: _obscureText,
                  onChanged: (_) => setState(() {}),
                  style: const TextStyle(color: kwhiteColor),
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: const TextStyle(color: kgreyColor),
                    filled: true,
                    fillColor: kfillgreyColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: passwordGold ? kgoldColor : Colors.white,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: kgoldColor, width: 2),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: kgoldColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                const Text(
                  "Forgot password?",
                  style: TextStyle(color: kgreyColor),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      _showRoleSelectionDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kblackColor,
                      foregroundColor: kgoldColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: const BorderSide(color: kgoldColor, width: 2),
                      ),
                    ),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: kgoldColor,
                        fontSize: fontsize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: Container(height: 1, color: Colors.white24),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "OR",
                        style: TextStyle(color: Colors.white60),
                      ),
                    ),
                    Expanded(
                      child: Container(height: 1, color: kwhiteopacityColor),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialIcon(
                      child: Image.asset(
                        'assets/google1.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SocialIcon(
                        child: Icon(Icons.apple, color: Colors.white),
                      ),
                    ),

                    SocialIcon(
                      child: Image.asset(
                        'assets/facebook.png',
                        width: 26,
                        height: 26,
                      ),
                    ),
                    SocialIcon(
                      child: Icon(
                        FontAwesomeIcons.xTwitter,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    SocialIcon(
                      child: Icon(
                        FontAwesomeIcons.twitch,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: const TextStyle(
                            color: kgoldColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signupscreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final Widget child;
  final double size;

  const SocialIcon({super.key, required this.child, this.size = 26});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 24,
      height: size + 24,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
