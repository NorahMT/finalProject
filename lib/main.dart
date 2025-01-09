import 'package:flutter/material.dart';
import 'package:flutter_databas/pages/home_page.dart';
import 'package:flutter_databas/pages/list_page.dart';
import 'package:flutter_databas/pages/signup_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Supabase.initialize(
      url: "https://knhziqhnlxwfmzznurjn.supabase.co", 
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtuaHppcWhubHh3Zm16em51cmpuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzNTc2NzMsImV4cCI6MjA0OTkzMzY3M30.VjWcxvmhwfmyKX3kPUvYZyGX6rPJ493XsAMq4W27lEk",
    );
  } catch (e) {
    print('Error during Supabase initialization: $e');
  }

  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage())
    ;
  }
}
