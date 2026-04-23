import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harmanapp/api_services/register_request.dart';
import 'package:harmanapp/api_services/register_service.dart';
import 'package:harmanapp/api_services/shared_pref_helper.dart';
import 'package:harmanapp/Login/success_screen.dart';
import 'package:harmanapp/widgets/theme_notifier.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  CountryCode _selectedCountryCode = CountryCode.fromDialCode('+91');
  bool _isLoading = false;
  String? _errorMessage;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode displayNameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();

  String? selectedMonth;
  String? selectedDay;
  String? selectedYear;
  bool termsAccepted = false;

  @override
  void initState() {
    super.initState();
    firstNameFocus.addListener(() => setState(() {}));
    lastNameFocus.addListener(() => setState(() {}));
    displayNameFocus.addListener(() => setState(() {}));
    phoneFocus.addListener(() => setState(() {}));
    emailFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    displayNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    firstNameFocus.dispose();
    lastNameFocus.dispose();
    displayNameFocus.dispose();
    phoneFocus.dispose();
    emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool firstNameGold =
        firstNameController.text.isNotEmpty || firstNameFocus.hasFocus;
    final bool lastNameGold =
        lastNameController.text.isNotEmpty || lastNameFocus.hasFocus;
    final bool displayNameGold =
        displayNameController.text.isNotEmpty || displayNameFocus.hasFocus;
    final bool phoneGold =
        phoneController.text.isNotEmpty || phoneFocus.hasFocus;
    final bool emailGold =
        emailController.text.isNotEmpty || emailFocus.hasFocus;

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
              // First Name
              const Text("First Name *", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 6),
              customInputField(
                controller: firstNameController,
                focusNode: firstNameFocus,
                hint: "Enter your first name",
                isGold: firstNameGold,
              ),
              const SizedBox(height: 20),
              // Last Name
              const Text("Last Name *", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 6),
              customInputField(
                controller: lastNameController,
                focusNode: lastNameFocus,
                hint: "Enter your last name",
                isGold: lastNameGold,
              ),
              const SizedBox(height: 20),
              // Display Name
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
              // Birthday
              const Text("Birthday *", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: dropdownBox(
                      label: "Day",
                      value: selectedDay,
                      items: List.generate(
                        31,
                        (i) => (i + 1).toString().padLeft(2, '0'),
                      ),
                      onChanged: (val) => setState(() => selectedDay = val),
                      isSelected: selectedDay != null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: dropdownBox(
                      label: "Month",
                      value: selectedMonth,
                      items: List.generate(
                        12,
                        (i) => (i + 1).toString().padLeft(2, '0'),
                      ),
                      onChanged: (val) => setState(() => selectedMonth = val),
                      isSelected: selectedMonth != null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: dropdownBox(
                      label: "Year",
                      value: selectedYear,
                      items: List.generate(
                        100,
                        (i) => (DateTime.now().year - i).toString(),
                      ),
                      onChanged: (val) => setState(() => selectedYear = val),
                      isSelected: selectedYear != null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Phone
              const Text("Phone *", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 6),
              Row(
                children: [
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: phoneGold ? kgoldColor : Colors.white,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: CountryCodePicker(
                        onChanged: (code) {
                          setState(() {
                            _selectedCountryCode = code;
                          });
                        },
                        initialSelection: _selectedCountryCode.code,
                        favorite: ['+91', 'IN'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                        textStyle: const TextStyle(color: Colors.white, fontSize: 16),
                        dialogTextStyle: const TextStyle(color: Colors.black),
                        searchStyle: const TextStyle(color: Colors.black),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: customInputField(
                      controller: phoneController,
                      focusNode: phoneFocus,
                      hint: "Enter your phone number",
                      isGold: phoneGold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Email
              const Text("Email *", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 6),
              customInputField(
                controller: emailController,
                focusNode: emailFocus,
                hint: "Enter your email",
                isGold: emailGold,
              ),
              const SizedBox(height: 20),
              // Terms
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
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
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
                  onPressed: _isLoading ? null : _onRegister,
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              kgoldColor,
                            ),
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
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

  Future<void> _onRegister() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    // Validate fields (simple)
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        displayNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        selectedDay == null ||
        selectedMonth == null ||
        selectedYear == null) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Please fill all fields.';
      });
      return;
    }
    final dob =
        "${selectedYear!}-${selectedMonth!.padLeft(2, '0')}-${selectedDay!.padLeft(2, '0')}";
    final req = RegisterRequest(
      role: 'stargazer',
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      phone: (_selectedCountryCode.dialCode ?? '') + phoneController.text.trim(),
      dob: dob,
      displayName: displayNameController.text.trim(),
    );
    try {
      final service = RegisterService();
      final resp = await service.registerauth(req);
      print(
        'Register API response: success=${resp.success}, statusCode=${resp.statusCode}, message=${resp.message}, data=${resp.data}',
      );
      if (resp.statusCode == 201 && resp.data != null) {
        await SharedPrefHelper.saveName(
          resp.data!.firstName,
          resp.data!.lastName,
        );
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SuccessScreen()),
        );
      } else {
        setState(() {
          _errorMessage = resp.message ?? 'Registration failed.';
        });
      }
    } catch (e) {
      print('Registration error: ' + e.toString());
      setState(() {
        _errorMessage = 'Error: ' + e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  // ...existing code...

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
