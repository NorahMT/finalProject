import 'dart:convert';
import 'package:flutter_databas/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_databas/models/destination.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final superbase = Supabase.instance.client;
 
  signup({required String email, required String password}) async {
    await superbase.auth.signUp(password: password, email: email);
  }

  login({required String email, required String password}) async {
    await superbase.auth.signInWithPassword(password: password, email: email);
  }

  Future<List<Destination>> getData() async {
    var response = await supabase.from("Proj").select();

    List<Destination> destList = [];
    for (var element in response) {
      destList.add(Destination.fromJson(element));
    }
    await Future.delayed(const Duration(seconds: 5));
    return destList;
  }
   insertNewDest({required name, required country,required description,required image,}) async {
    await supabase.from("Proj").insert({
      "name": name,
      "country": country,
      "description": description,
      "image": image,
    });
  }}