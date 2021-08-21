import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:provider/provider.dart';

import 'count.dart';

// ignore: must_be_immutable
class SingleItem extends StatefulWidget {
  bool isBool;
  bool isWish;
  String productImage;
  String productName;
  int productPrice;
  int productQuantity;
  String productId;
  void Function() onTap;
  SingleItem({
    required this.isBool,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
    required this.onTap,
    required this.isWish,
  });

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;
  late int count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    print("ProductQuantity--------- $count");
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
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
                    child: Image.network(widget.productImage),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                height: 100.0,
                child: Column(
                  mainAxisAlignment: widget.isBool == false
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: textColor),
                        ),
                        Text(
                          '\$${widget.productPrice}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    widget.isBool == false
                        ? GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: Text('50 Gram'),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        title: Text('500 Gram'),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        title: Text('1 Kg'),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
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
                            ),
                          )
                        : Text('50 Gram'),
                  ],
                ),
              )),
              Expanded(
                child: Container(
                    height: 100.0,
                    padding: widget.isBool == false
                        ? EdgeInsets.symmetric(horizontal: 15.0, vertical: 32.0)
                        : EdgeInsets.only(left: 15.0, right: 15.0),
                    child: widget.isBool == false
                        ? Count(
                            productId: widget.productId,
                            productName: widget.productName,
                            productImage: widget.productImage,
                            productPrice: widget.productPrice,
                          )
                        // ? Container(
                        //     height: 25.0,
                        //     width: 50.0,
                        //     decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.grey),
                        //       borderRadius: BorderRadius.circular(30.0),
                        //     ),
                        //     child: Center(
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Icon(
                        //             Icons.add,
                        //             color: primaryColor,
                        //             size: 20.0,
                        //           ),
                        //           Text(
                        //             'ADD',
                        //             style: TextStyle(
                        //               color: primaryColor,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   )
                        : Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: widget.onTap,
                                  child: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                widget.isWish == false
                                    ? Container(
                                        height: 25.0,
                                        width: 70.0,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (count == 1) {
                                                    Fluttertoast.showToast(
                                                      msg:
                                                          "You reach minimum limit",
                                                    );
                                                  } else {
                                                    setState(() {
                                                      count--;
                                                    });
                                                    reviewCartProvider
                                                        .updateReviewCartData(
                                                      cartImage:
                                                          widget.productImage,
                                                      cartId: widget.productId,
                                                      cartName:
                                                          widget.productName,
                                                      cartPrice:
                                                          widget.productPrice,
                                                      cartQuantity: count,
                                                    );
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color: primaryColor,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Text(
                                                '$count',
                                                style: TextStyle(
                                                  color: primaryColor,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (count < 10) {
                                                    setState(() {
                                                      count++;
                                                    });
                                                    reviewCartProvider
                                                        .updateReviewCartData(
                                                      cartImage:
                                                          widget.productImage,
                                                      cartId: widget.productId,
                                                      cartName:
                                                          widget.productName,
                                                      cartPrice:
                                                          widget.productPrice,
                                                      cartQuantity: count,
                                                    );
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: primaryColor,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          )),
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black,
              ),
      ],
    );
  }
}
