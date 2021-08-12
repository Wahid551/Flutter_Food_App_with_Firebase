import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

// ignore: must_be_immutable
class SingleItem extends StatelessWidget {
  bool isBool = false;
  SingleItem({required this.isBool});
  @override
  Widget build(BuildContext context) {
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
                    child: Image.network(
                        'https://pngimg.com/uploads/spinach/spinach_PNG10.png'),
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
                          'Product Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: textColor),
                        ),
                        Text(
                          '\$50',
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
                        : Column(
                            children: [
                              Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.black,
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
                              ),
                            ],
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
