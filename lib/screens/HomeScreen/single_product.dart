import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  late final String productImage;
  late final String productName;
  late final void Function() onTap;
  SingleProduct(
      {required this.productName,
      required this.productImage,
      required this.onTap});

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              margin: EdgeInsets.all(5.0),
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                color: Color(0xffd9dad9),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image(
                      image: NetworkImage(widget.productImage),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          '50\$/50 Gram',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Container(
                                height: MediaQuery.of(context).size.height *
                                    0.10 /
                                    2,
                                width: MediaQuery.of(context).size.width * 0.20,
                                decoration: BoxDecoration(
                                  //color: Colors.black,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 2.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '50 Gram',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_downward,
                                        size: 15.0,
                                        color: Colors.orangeAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                              SizedBox(
                                width: 5.0,
                              ),
                              Expanded(
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.10 /
                                      2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  decoration: BoxDecoration(
                                    //color: Colors.red,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.remove,
                                        size: 20.0,
                                        color: Colors.orangeAccent,
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 20.0,
                                        color: Colors.orangeAccent,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
