
import 'package:flutter/material.dart';
import 'package:flutter_databas/constants/spacing.dart';
import 'package:flutter_databas/pages/list_page.dart';
import 'package:flutter_databas/pages/signup_page.dart';
import 'package:flutter_databas/services/database.dart';
import 'package:flutter_databas/widgets/text_field.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

    @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 22, 183, 198),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 24),
            ),
            height24,
            TextFieldWidget(
              controller: emailController,
              text: "enter email",
            ),
            height24,
            TextFieldWidget(
              controller: passwordController,
              text: "enter password",
              isPassword: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("if you don't have an account"),
                TextButton(
                  onPressed: () {
                       Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: const Text("signup", style: TextStyle(color: Color.fromARGB(255, 22, 183, 198)) ,),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Database().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (context.mounted) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListPage(),
                        ));
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 22, 183, 198),
              ),
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}