import 'package:flutter/material.dart';
import 'package:flutter_databas/pages/login_page.dart';
import 'package:flutter_databas/pages/signup_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://static.independent.co.uk/2024/01/05/15/newFile-6.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Travel Blog',
              style: TextStyle(
                color: Color.fromARGB(255, 5, 53, 52),
                fontSize: 40,
                fontWeight: FontWeight.bold,

              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
               Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage())); // Route to login page
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor:  const Color.fromARGB(255, 22, 183, 198),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignupPage())); // Route to sign-up page
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor:  const Color.fromARGB(255, 22, 183, 198),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Explore new destinations and share your adventures with the world! Login to start blogging, or sign up to create an account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
