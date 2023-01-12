import 'package:app4/common/widget/custom_button.dart';
import 'package:app4/constants/global_variables.dart';
import 'package:app4/features/auth/screens/signup_screen.dart';
import 'package:app4/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Auth _auth = Auth.signup;
  bool _obscureText = true;
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 50),
              child: const Image(
                image: AssetImage('assets/images/Bull.png'),
                width: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text('Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 151, 22, 22)
                          .withOpacity(0.7),
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'Hey, Welcome back.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color:
                      const Color.fromARGB(255, 151, 22, 22).withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (_auth == Auth.signup)
              Expanded(
                flex: 1,
                child: Container(
                    margin:
                        const EdgeInsets.only(top: 20, right: 4.5, left: 4.5),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    child: Form(
                        key: _signInFormKey,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10, right: 2, left: 2),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'User Email',
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.black,
                                  ),
                                ),
                                controller: _emailController,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 2, right: 2, left: 2),
                              child: TextFormField(
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                    hintText: 'User Password',
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: _obscureText
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    )),
                                controller: _passwordController,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) => ForgotPasswordPage(),
                                    //   ),
                                    // ),
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        fontSize: 15,
                                        letterSpacing: 2.2,
                                        color: Color.fromARGB(134, 0, 38, 252),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                text: 'Login',
                                color: Colors.yellow[300],
                                onTap: () {
                                  if (_signInFormKey.currentState!.validate()) {
                                    signInUser();
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't Have An Account? ",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  TextButton(
                                    child: const Text('Sign Up',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 252, 29, 0))),
                                    onPressed: () => Navigator.pushNamed(
                                        context, SignUpScreen.routeName),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ))),
              ),
          ],
        ),
      ),
    );
  }
}
