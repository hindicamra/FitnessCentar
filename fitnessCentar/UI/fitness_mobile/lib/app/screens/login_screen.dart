import 'package:fitness_mobile/app/providers/login_provider.dart';
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
    super.initState();
    loginProvider = context.read<LoginProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login to Fitness Center',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Image(
              image: AssetImage("assets/images/logo.png"),
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Form(
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Korisničko ime je obavezno!";
                        } else if (value.length < 3) {
                          return "Korisničko ime ne može imati manje od 3 slova";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      controller: loginProvider.username,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: "Korisničko ime",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Lozinka ne moze biti prazno polje";
                        } else if (value.length < 4) {
                          return "Lozinka ne može imati manje od 4 slova";
                        }
                        return null;
                      },
                      obscureText: true,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      controller: loginProvider.password,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        hintText: "Lozinka",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => loginProvider.sendLoginApiCall(context),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: const Center(
                          child: Text(
                        'Prijavi se',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}
