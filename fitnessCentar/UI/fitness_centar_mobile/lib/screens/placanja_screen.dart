// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:fitness_centar_mobile/.env';
import 'package:fitness_centar_mobile/models/placanja.dart';
import 'package:fitness_centar_mobile/models/tip_clanarina.dart';
import 'package:fitness_centar_mobile/providers/tip_clanarine_provider.dart';
import 'package:fitness_centar_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../providers/placanja_provider.dart';

class PlacanjaScreen extends StatefulWidget {
  const PlacanjaScreen({super.key});
  static const String routeName = "/placanja";

  @override
  State<PlacanjaScreen> createState() => _PlacanjaScreenState();
}

class _PlacanjaScreenState extends State<PlacanjaScreen> {
  TipClanarineProvider? _clanarinaProvider;
  TipClanarina? data;
  PlacanjaProvider? _placanjaProvider;
  Map<String, dynamic>? paymentIntentData;
  Placanja? placanja;

  @override
  void initState() {
    super.initState();
    _clanarinaProvider = context.read<TipClanarineProvider>();
    _placanjaProvider = context.read<PlacanjaProvider>();
    loadData();
  }

  Future loadData() async {
    var tmpData = await _clanarinaProvider!.getById(TipClanarineId.id!);
    setState(() {
      data = tmpData;
    });
  }

  Widget clanarina(int tipClanarine) {
    if (data != null) {
      if (tipClanarine == 7) {
        return const Text(
          "Sedmična",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        );
      } else if (tipClanarine == 30) {
        return const Text(
          "Mjesečna",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        );
      } else if (tipClanarine == 180) {
        return const Text(
          "Polugodišnja",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        );
      } else {
        return const Text(
          "Godišnja",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        );
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100]!,
      appBar: AppBar(
        title: const Text(
          "Placanja",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildListTipClanarine(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            makePayment(data!.cijena!);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 46, 92, 232)),
                          ),
                          child: const Text(
                            'Plati',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildListTipClanarine() {
    if (data == null) {
      return const Center(
        child: Text("Nema podataka za prikaz"),
      );
    }

    Widget card = Column(
      children: [
        Card(
          color: Colors.white,
          elevation: 4,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 120.0, vertical: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: clanarina(data!.trajanje!)),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Trajanje: ",
                        ),
                        Text(
                          data!.trajanje.toString(),
                        )
                      ]),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Cijena: ",
                        ),
                        Text(
                          data!.cijena!.toString(),
                        )
                      ])
                ]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
    return card;
  }

  Future<void> makePayment(double iznos) async {
    try {
      paymentIntentData =
          await createPaymentIntent((iznos * 100).round().toString(), 'bam');
      await stripe.Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: stripe.SetupPaymentSheetParameters(
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
        var tmp = await stripe.Stripe.instance.presentPaymentSheet();
        await insertUplata();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Uplata uspješna!"),
          backgroundColor: Color.fromARGB(255, 46, 92, 232),
        ));
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
