import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homey/core/widgets/custom_login_button.dart';
import 'package:homey/core/widgets/custom_text_form_field.dart';
import 'package:homey/pages/register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "Login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isViasble = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
                    child: Text("Welcome to",
                        style: theme.textTheme.displayMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Homey!",
                      style: theme.textTheme.displayMedium!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          const Shadow(
                            offset: Offset(0, 1.5),
                            color: Color.fromARGB(255, 66, 61, 61),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    height: mediaQuery.height * 0.64,
                    decoration: BoxDecoration(
                      color: const Color(0xff002445).withOpacity(0.45),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "You must enter your email";
                              }
                              var regularExpression = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                              if (!regularExpression.hasMatch(value)) {
                                return "Invalid email";
                              }
                              return null;
                            },
                            hintText: "Email",
                          ),
                          const SizedBox(height: 13),
                          CustomTextFormField(
                            controller: passwordController,
                            hintText: "Password",
                            obscureText: isViasble,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "You must enter your password";
                              }
                              return null;
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                isViasble = !isViasble;
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  isViasble == true ? "View" : "Hide",
                                  style: const TextStyle(
                                      color: Color(0xff14213D),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 136, vertical: 10),
                            ),
                            onPressed: () {},
                            child: Text("Login",
                                style: theme.textTheme.bodySmall!.copyWith(
                                    color: Colors.white, fontSize: 18)),
                          ),
                          const SizedBox(height: 13),
                          Text(
                            "or",
                            style: TextStyle(
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(height: 13),
                          const CustomLoginButton(
                            icon: Icon(
                              FontAwesomeIcons.facebook,
                              color: Color(0xff316FF6),
                              size: 27,
                            ),
                            iconText: "Continue With Facebook",
                          ),
                          const SizedBox(height: 13),
                          const CustomLoginButton(
                            icon: Image(
                                image: AssetImage(
                                    "assets/images/google_icon.png")),
                            iconText: "Continue With Google",
                          ),
                          const SizedBox(height: 13),
                          const CustomLoginButton(
                            icon: Icon(
                              FontAwesomeIcons.apple,
                              size: 27,
                            ),
                            iconText: "Continue With Apple",
                          ),
                          Row(
                            children: [
                              Text(
                                "Don't have an account ?",
                                style: theme.textTheme.labelMedium!.copyWith(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RegisterScreen.routeName);
                                },
                                child: Text(
                                  "Sign up",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "Forget My Password",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
