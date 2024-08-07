import 'package:fbase_app/home_screen.dart';
import 'package:fbase_app/utils/dialog_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register_screen.dart'; // Make sure to import the file containing RegisterScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                // TODO: Implement login logic
                // show the default progress indicator
                OneContext().showProgressIndicator();
                try {
                  final SharedPreferences shareddata =
                      await SharedPreferences.getInstance();
                  shareddata.setString(
                      "user-email", _emailController.text.trim());

                  final credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());
                  print(credential);
                  OneContext().hideProgressIndicator();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                } on FirebaseAuthException catch (e) {
                  // hide the default progress indicator
                  OneContext().hideProgressIndicator();
                  DialogUtils.showAlertDialog(
                      title: "Error",
                      content: "Something bad happened. try again");
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    OneContext.instance.showSnackBar(builder: (_) {
                      return SnackBar(
                          content:
                              Text("Wrong password provided for that user."));
                    });
                    print('Wrong password provided for that user.');
                  } else {
                    OneContext.instance.showSnackBar(builder: (_) {
                      return SnackBar(
                          content: Text("Error Occured: Invalid Credentials"));
                    });
                    print("Error occurred ${e.code}");
                  }
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
