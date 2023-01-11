import 'package:app4/common/widget/custom_button.dart';
import 'package:app4/constants/global_variables.dart';
import 'package:app4/features/auth/screens/login_screen.dart';
import 'package:app4/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-route';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Auth _auth = Auth.signup;
  bool _obscureText = true;
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmpassController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
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
              child: Text('Sign Up',
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
                'Hey there 👋 Welcome.',
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
                        key: _signUpFormKey,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10, right: 2, left: 2),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'User Name',
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                ),
                                controller: _nameController,
                              ),
                            ),
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
                                  bottom: 10, right: 2, left: 2),
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
                              padding: const EdgeInsets.only(
                                  bottom: 10, right: 2, left: 2),
                              child: TextFormField(
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
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
                                  ),
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) return 'Empty';
                                  if (val != _passwordController.text)
                                    return 'Not Match';
                                  return null;
                                },
                                controller: _confirmpassController,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: CustomButton(
                                text: 'Sign Up',
                                color: Colors.yellow[300],
                                onTap: () {
                                  if (_signUpFormKey.currentState!.validate()) {
                                    signUpUser();
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
                                    "Already Have An Account? ",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  TextButton(
                                    child: const Text('Login',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 252, 29, 0))),
                                    onPressed: () => Navigator.pushNamed(
                                        context, LoginScreen.routeName),
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
