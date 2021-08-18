import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SingleItem extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;
  bool isBool = false;
  String productImage;
  String productName;
  int productPrice;
  int productQuantity;
  String productId;
  SingleItem({
    required this.isBool,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
  });

  showAlertDialog(BuildContext context, String cartId) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you sure to delete this product ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100.0,
                  child: Center(
                    child: Image.network(productImage),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                height: 100.0,
                child: Column(
                  mainAxisAlignment: isBool == false
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: textColor),
                        ),
                        Text(
                          '\$$productPrice',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    isBool == false
                        ? Container(
                            height: 35,
                            margin: EdgeInsets.only(right: 15.0),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '50 Gram',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20.0,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text('50 Gram'),
                  ],
                ),
              )),
              Expanded(
                child: Container(
                    height: 100.0,
                    padding: isBool == false
                        ? EdgeInsets.symmetric(horizontal: 15.0, vertical: 32.0)
                        : EdgeInsets.only(left: 15.0, right: 15.0),
                    child: isBool == false
                        ? Container(
                            height: 25.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: primaryColor,
                                    size: 20.0,
                                  ),
                                  Text(
                                    'ADD',
                                    style: TextStyle(
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showAlertDialog(context, productId);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  height: 25.0,
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.remove,
                                          color: primaryColor,
                                          size: 20.0,
                                        ),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            color: primaryColor,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add,
                                          color: primaryColor,
                                          size: 20.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
              ),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black,
              ),
      ],
    );
  }
}
