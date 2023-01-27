import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/screens/authentication/screen_signup.dart';
import 'package:provider/provider.dart';
import '../../core/services/auth_service.dart';
import '../../core/globalvalues/font_size.dart';
import '../widgets/main_button.dart';
import '../../core/globalvalues/theme_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: ThemeColor.scaffoldBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Let's get you in!",
                  style: GoogleFonts.poppins(
                    color: ThemeColor.black,
                    fontSize: FontSize.xxLarge,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    "Login to your account.",
                    style: GoogleFonts.poppins(
                      color: ThemeColor.grey,
                      fontSize: FontSize.medium,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ///Email Input Field
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (_emailController.text.isEmpty) {
                            return "This field can't be empty";
                          } else if (_emailController.text.split('@').last !=
                                  'nerve.com' &&
                              _emailController.text.split('@').last !=
                                  'gmail.com') {
                            return "Enter a valid E-Mail ID";
                          }
                        },
                        style: GoogleFonts.poppins(
                          color: ThemeColor.black,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        cursorColor: ThemeColor.primary,
                        decoration: InputDecoration(
                          fillColor: ThemeColor.textFieldBgColor,
                          filled: true,
                          hintText: "E-Mail",
                          hintStyle: GoogleFonts.poppins(
                            color: ThemeColor.textFieldHintColor,
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.w400,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      ///Password Input Field
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (_passwordController.text.isEmpty) {
                            return "This field can't be empty";
                          } else if (_passwordController.text.length < 8) {
                            return "Password should be more than 8 letters";
                          }
                        },
                        obscureText: true,
                        style: GoogleFonts.poppins(
                          color: ThemeColor.black,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          if (_formKey.currentState!.validate()) {
                            authService.signInWithEmailAndPassword(
                                _emailController.text,
                                _passwordController.text,
                                context);
                          }
                        },
                        cursorColor: ThemeColor.primary,
                        decoration: InputDecoration(
                          fillColor: ThemeColor.textFieldBgColor,
                          filled: true,
                          hintText: "Password",
                          hintStyle: GoogleFonts.poppins(
                            color: ThemeColor.textFieldHintColor,
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.w400,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: GestureDetector(
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) => AlertDialog(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  contentPadding: const EdgeInsets.all(20.0),
                                  title: Text(
                                    "Forgot password?",
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                      "Contact admin or respective faculty"),
                                  actions: <Widget>[
                                    Center(
                                      child: TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: Text('Got it!',
                                            style: GoogleFonts.ubuntu(
                                                fontWeight: FontWeight.bold,
                                                color: ThemeColor.ytRed)),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              "Forgot password?",
                              style: GoogleFonts.poppins(
                                color: ThemeColor.grey,
                                fontSize: FontSize.medium,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      MainButton(
                        text: 'Login',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            authService.signInWithEmailAndPassword(
                                _emailController.text,
                                _passwordController.text,
                                context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: GoogleFonts.poppins(
                          color: ThemeColor.black,
                          fontSize: FontSize.medium,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                            color: ThemeColor.primary,
                            fontSize: FontSize.medium,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
