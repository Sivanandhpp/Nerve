import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/core/globalvalues/globals.dart' as globals;
import 'package:provider/provider.dart';
import '../../core/services/auth_service.dart';
import '../../core/globalvalues/font_size.dart';
import '../../core/services/sharedpref_service.dart';
import '../widgets/main_button.dart';
import '../../core/globalvalues/theme_color.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _is2015 = true;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text(
                  "New here? Welcome!",
                  style: GoogleFonts.poppins(
                    color: ThemeColor.black,
                    fontSize: FontSize.xxLarge,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    "Please fill the form to continue.",
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
                      ///Name Input Field
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (_nameController.text.isEmpty) {
                            return "This field can't be empty";
                          }
                        },
                        style: GoogleFonts.poppins(
                          color: ThemeColor.black,
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        cursorColor: ThemeColor.primary,
                        decoration: InputDecoration(
                          fillColor: ThemeColor.textFieldBgColor,
                          filled: true,
                          hintText: "Full name",
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
                      // Phone Input Field
                      TextFormField(
                        controller: _phoneNoController,
                        validator: (value) {
                          if (_phoneNoController.text.isEmpty) {
                            return "This field can't be empty";
                          }
                        },
                        style: GoogleFonts.poppins(
                          color: ThemeColor.black,
                        ),
                        cursorColor: ThemeColor.primary,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          fillColor: ThemeColor.textFieldBgColor,
                          filled: true,
                          hintText: "Phone No",
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

                      ///E-mail Input Field
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (_emailController.text.isEmpty) {
                            return "This field can't be empty";
                          }
                        },
                        style: GoogleFonts.poppins(
                          color: ThemeColor.black,
                        ),
                        cursorColor: ThemeColor.primary,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
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

                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (_passwordController.text.isEmpty) {
                            return "This field can't be empty";
                          }
                        },
                        obscureText: true,
                        style: GoogleFonts.poppins(
                          color: ThemeColor.black,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        // onFieldSubmitted: (value) async {
                        //   if (_formKey.currentState!.validate()) {
                        //     if (_is2015) {
                        //       globals.revision = '2015';
                        //     } else {
                        //       globals.revision = '2021';
                        //     }
                        //     await authService.createUserWithEmailAndPassword(
                        //         _nameController.text,
                        //         _phoneNoController.text,
                        //         _emailController.text,
                        //         _passwordController.text,
                        //         globals.revision);
                        //     Navigator.pop(context);
                        //   }
                        // },
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

                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_is2015) {
                              _is2015 = false;
                            } else {
                              _is2015 = true;
                            }
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                value: _is2015,
                                onChanged: (value) {
                                  setState(() {
                                    if (_is2015) {
                                      _is2015 = false;
                                    } else {
                                      _is2015 = true;
                                    }
                                  });
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                activeColor: ThemeColor.primary,
                                checkColor: ThemeColor.white,
                              ),
                            ),
                            Text(
                              "Check if 2015 revision. (can be changed later)",
                              style: GoogleFonts.poppins(
                                fontSize: FontSize.medium,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      MainButton(
                        text: 'Sign Up',
                        onTap: () async {
                          if (_is2015) {
                            setRevisrion("2015");
                          } else {
                            setRevisrion("2021");
                          }
                          if (_formKey.currentState!.validate()) {
                            await authService.createUserWithEmailAndPassword(
                              _nameController.text,
                              _phoneNoController.text,
                              _emailController.text,
                              _passwordController.text,);
                            Navigator.pop(context);
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: GoogleFonts.poppins(
                                color: ThemeColor.black,
                                fontSize: FontSize.medium,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text(
                                "Sign In",
                                style: GoogleFonts.poppins(
                                  color: ThemeColor.primary,
                                  fontSize: FontSize.medium,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
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
