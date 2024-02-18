import 'package:fitness_admin/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginProvider loginProvider;

  @override
  void initState() {
    loginProvider = context.read<LoginProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fitness Center',
          style: TextStyle(fontSize: 50),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 250,
                height: 150,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username je obavezno!";
                    } else if (value.length < 3) {
                      return "Username ne moze imati manje od 3 karaktera";
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.name,
                  controller: loginProvider.username,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Lozinka ne moze biti prazno polje";
                    } else if (value.length < 4) {
                      return "Lozinka ne može imati manje od 4 karaktera";
                    }
                    return null;
                  },
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  controller: loginProvider.password,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    hintText: "Lozinka",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextButton(
                  onPressed: () => loginProvider.sendLoginApiCall(context),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: const Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
