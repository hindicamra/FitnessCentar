import 'package:fitness_admin/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class KorisniciScreen extends StatefulWidget {
  const KorisniciScreen({Key? key}) : super(key: key);

  @override
  State<KorisniciScreen> createState() => _KorisniciScreenState();
}

class _KorisniciScreenState extends State<KorisniciScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyCustomAppBar(
        title: "Administrator",
      ),
      body: Placeholder(),
    );
  }
}
