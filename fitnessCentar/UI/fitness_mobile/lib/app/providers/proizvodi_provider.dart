import 'package:fitness_mobile/app/models/cart_model.dart';
import 'package:fitness_mobile/app/models/shop_item_model.dart';
import 'package:fitness_mobile/app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProizvodiProvider extends ChangeNotifier {
  ValueNotifier<bool> refreshing = ValueNotifier(false);
  List<ShopItemModel> listOfItems = [];
  CartProvider? cartProvider;

  getAllListItems() async {
    refreshing.value = true;
    await Future.delayed(const Duration(seconds: 2));
    //TODO Make api call here for now use mock data
    listOfItems.add(
      ShopItemModel(
        1,
        100,
        'Test Item',
        'This is a test item description',
      ),
    );
    refreshing.value = false;
  }

  showDialogToBuy(BuildContext context, ShopItemModel shopItemModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Kupiti prozivod?'),
        content: const Text("Da li zelite da kupite ovaj proizvod?"),
        actions: [
          TextButton(
            onPressed: () {
              //TODO Add to cart, add this later
              //TODO Show user that he added in cart and he cant add same thing again
              refreshing.value = true;
              cartProvider?.addItemToCart(
                CartModel(
                  shopItemModel.id,
                  shopItemModel.price,
                  shopItemModel.name,
                ),
              );
              refreshing.value = false;
              Fluttertoast.showToast(
                msg: "Proizvod dodat u korpu",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                textColor: Colors.black,
                fontSize: 16.0,
              );
              Navigator.of(context).pop();
            },
            child: const Text('Da'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ne'),
          )
        ],
      ),
    );
  }

  setCartProvider(CartProvider setCartProvider) {
    cartProvider = setCartProvider;
  }
}
