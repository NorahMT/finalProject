import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_databas/constants/spacing.dart';
import 'package:flutter_databas/pages/list_page.dart';
import 'package:flutter_databas/pages/login_page.dart';
import 'package:flutter_databas/services/database.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor:  Color.fromARGB(255, 22, 183, 198)
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 24),
            ),
            height18,
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "enter email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
            height18,
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "enter password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
            height46,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("click here", style: TextStyle(color: Color.fromARGB(255, 22, 183, 198)),))
              ],
            ),
            height18,
            ElevatedButton(
                onPressed: () async {
                  try {
                    await Database().signup(
                        email: emailController.text,
                        password: passwordController.text);
                    if (context.mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListPage(),
                          ));
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:Color.fromARGB(255, 22, 183, 198),),
                child: const Text(
                  "SignUp",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
