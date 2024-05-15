import 'dart:convert';

import 'package:fitness_centar_mobile/.env';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../models/placanja.dart';
import '../models/tip_clanarina.dart';
import '../providers/clanarina_provider.dart';
import '../providers/placanja_provider.dart';
import '../providers/tip_clanarine_provider.dart';
import '../utils/util.dart';
import 'home_screen.dart';

class ProfilAktivirajClanarinu extends StatefulWidget {
  final int tipClanarinaId;
  const ProfilAktivirajClanarinu({required this.tipClanarinaId, super.key});

  @override
  State<ProfilAktivirajClanarinu> createState() =>
      _ProfilAktivirajClanarinuState();
}

class _ProfilAktivirajClanarinuState extends State<ProfilAktivirajClanarinu> {
  TipClanarineProvider? _tipClanarineProvider;
  TipClanarina? data;
  PlacanjaProvider? _placanjaProvider;
  Map<String, dynamic>? paymentIntentData;
  Placanja? placanja;
  ClanarinaProvider? _clanarinaProvider;

  @override
  void initState() {
    super.initState();

    _tipClanarineProvider = context.read<TipClanarineProvider>();
    _placanjaProvider = context.read<PlacanjaProvider>();
    _clanarinaProvider = context.read<ClanarinaProvider>();

    loadData();
  }

  Future loadData() async {
    var tmpData = await _tipClanarineProvider!.getById(widget.tipClanarinaId);

    setState(() {
      data = tmpData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          makePayment(data!.cijena!);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 46, 92, 232)),
        ),
        child: const Text("Aktiviraj/produži",
            style: TextStyle(color: Colors.white)));
  }

  Future<void> makePayment(double iznos) async {
    try {
      paymentIntentData =
          await createPaymentIntent((iznos * 100).round().toString(), 'bam');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  style: ThemeMode.dark,
                  merchantDisplayName: 'fitnessCentar'))
          .then((value) {})
          .onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');

        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
                  content: Text("Poništena transakcija!"),
                ));
        throw Exception("Payment declined");
      });

      print("payment sheet created");
      print(paymentIntentData!['client_secret']);

      try {
        await Stripe.instance.presentPaymentSheet();
        await insertUplata();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Uspjesno placeno, Aktivirano/produzeno"),
          backgroundColor: Color.fromARGB(255, 46, 92, 232),
        ));
        BottomNavigationBar navigationBar =
            glbKey.currentWidget as BottomNavigationBar;
        navigationBar.onTap!(2);
      } catch (e) {
        print(e);
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer $stripeSecretKey',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  insertUplata() async {
    Map clanarina = {
      "iznos": data!.cijena!,
      "tipClanarineId": data!.tipClanarineId,
      "korisnikId": Authorization.korisnik!.korisnikId!,
      "datum":
          DateTime.now().add(Duration(days: data!.trajanje!)).toIso8601String()
    };

    await _placanjaProvider!.placanjeClanarine(clanarina);
  }
}
