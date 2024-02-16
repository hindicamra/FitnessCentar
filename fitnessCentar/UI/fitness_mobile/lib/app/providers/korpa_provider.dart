import 'dart:convert';

import 'package:fitness_mobile/.env';
import 'package:fitness_mobile/app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class KorpaProvider extends ChangeNotifier {
  ValueNotifier<List<CartModel>> listItems = ValueNotifier([]);

  Map<String, dynamic>? paymentIntent;

  addItemToCart(CartModel cartModel) {
    listItems.value.add(cartModel);
    listItems.notifyListeners();
  }

  removeItemFromCart(CartModel cartModel) {
    listItems.value.remove(cartModel);
    listItems.notifyListeners();
  }

  buyAllItems() {
    stripeMakePayment();
  }

  Future<void> stripeMakePayment() async {
    try {
      paymentIntent = await createPaymentIntent('EUR');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.dark,
                  merchantDisplayName: 'FitnesCentar'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();

      Fluttertoast.showToast(msg: 'Plaćanje uspešno završeno');
    } on Exception catch (e) {
      if (e is StripeException) {
        Fluttertoast.showToast(
            msg: 'Error from Stripe: ${e.error.localizedMessage}');
      } else {
        Fluttertoast.showToast(msg: 'Unforeseen error: ${e}');
      }
    }
  }

//create Payment
  createPaymentIntent(String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

//calculate Amount
  calculateAmount() {
    int amountToPay = 0;
    for (CartModel item in listItems.value) {
      amountToPay = amountToPay + item.price;
    }
    return (amountToPay * 100).toString();
  }
}
