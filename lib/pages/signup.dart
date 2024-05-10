import 'package:architech/components/form.dart';
import 'package:architech/components/logos.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:architech/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:architech/pages/home.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final AuthService _auth = AuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, height * 0.1, 20, 0),
            child: Column(
              children: [
                appLogo("assets/logo_full.png", 300),
                const SizedBox(height: 30),
                Text(
                  "Sign up an account",
                  style: TextStyle(
                    fontSize: mainTitle,
                  ),
                ),
                const SizedBox(height: 30),
                textFormField("UTM Email", "Enter your registered email", false,
                    emailController, validateEmail),
                const SizedBox(height: 20),
                textFormField("Password", "Enter your password", true,
                    passwordController, validatePassword),
                const SizedBox(height: 20),
                textFormField("Confirm Password", "Enter your password again",
                    true, passwordController, validateConfirmPassword),
                const SizedBox(height: 30),
                mainBtn(context, "Sign up", true, _signUp),
                InkWell(
                  child: textLink(context, "Have an account? ", "Log in here",
                      Colors.black),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login())),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.registerWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is successfully created");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      print("some error");
    }
  }

  validateEmail(String? email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email!.isEmpty) {
      return 'Please enter your email address.';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Please enter your password.';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    return null;
  }

  validateConfirmPassword(String? password) {
    if (password!.isEmpty) {
      return 'Please enter your password.';
    } else if (password != passwordController.text) {
      return 'Password must match';
    }
    return null;
  }
}

// ***after the implementation***

// import 'package:architech/components/form.dart';
// import 'package:architech/components/logos.dart';
// import 'package:architech/config/theme.dart';
// import 'package:architech/pages/login.dart';
// import 'package:flutter/material.dart';
// import 'package:architech/services/auth.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final _formKey = GlobalKey<FormState>(); // For form validation
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;

//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(20, height * 0.1, 20, 0),
//             child: Form(
//               key: _formKey, // Associate form with validation key
//               child: Column(
//                 children: [
//                   appLogo("assets/logo_full.png", 300),
//                   const SizedBox(height: 30),
//                   Text(
//                     "Sign up an account",
//                     style: TextStyle(
//                       fontSize: mainTitle,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   textField("UTM Email", "Enter your registered email", false,
//                       _emailController),
//                   const SizedBox(height: 20),
//                   textField("Password", "Enter your password", true,
//                       _passwordController),
//                   const SizedBox(height: 20),
//                   textField("Confirm Password", "Enter your password again",
//                       true, _confirmPasswordController, validator: (value) {
//                     if (value != _passwordController.text) {
//                       return 'Passwords must match';
//                     }
//                     return null;
//                   }),
//                   const SizedBox(height: 30),
//                   mainBtn(context, "Sign up", true, () async {
//                     if (_formKey.currentState!.validate()) {
//                       // Form is valid, proceed with signup
//                       String email = _emailController.text.trim();
//                       String password = _passwordController.text.trim();
//                       String result =
//                           await AuthService.registerWithEmailAndPassword(
//                               email, password);
//                       if (result == null) {
//                         // Handle signup failure (e.g., show error message)
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Signup failed. Please try again.'),
//                           ),
//                         );
//                       } else {
//                         // Navigate to a success page or login page
//                         Navigator.pushAndRemoveUntil(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Login()),
//                           (Route route) => false,
//                         );
//                       }
//                     }
//                   }),
//                   InkWell(
//                     child: textLink(context, "Have an account? ", "Log in here",
//                         Colors.black),
//                     onTap: () => Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => const Login())),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
