import 'package:fitnesscentar_admin/providers/korisnik_provider.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late KorisnikProvider _korisnikProvider = KorisnikProvider();

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset("assets/image/logo.jpeg", width: 250, height: 150,),
      ]
      ),
    );
  }
}