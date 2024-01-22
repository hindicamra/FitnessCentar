import 'package:fitness_admin/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class UposleniciScreen extends StatefulWidget {
  const UposleniciScreen({super.key});

  @override
  State<UposleniciScreen> createState() => _UposleniciStateScreen();
}

class _UposleniciStateScreen extends State<UposleniciScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyCustomAppBar(
        title: "Uposlenici",
      ),
      body: Placeholder(),
    );
  }
}
