import 'package:fitnesscentar_admin/widget/master_screen.dart';
import 'package:flutter/material.dart';

class KorisniciScreen extends StatefulWidget {
  const KorisniciScreen({super.key});

  @override
  State<KorisniciScreen> createState() => _KorisniciScreenState();
}

class _KorisniciScreenState extends State<KorisniciScreen> {
  @override
  Widget build(BuildContext context) {
    return MasterScreenWidget();
  }
}