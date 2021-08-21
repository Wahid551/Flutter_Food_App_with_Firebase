import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:food_app/widgets/count.dart';
import 'package:food_app/widgets/productUnit.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatefulWidget {
  late final String productImage;
  late final String productName;
  late final void Function() onTap;
  late final int productPrice;
  late String productId;
  late final ProductModel productUnit;

  SingleProduct({
    required this.productName,
    required this.productImage,
    required this.onTap,
    required this.productPrice,
    required this.productId,
    required this.productUnit,
  });

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
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
                          '${widget.productPrice}\$/${unitData == null ? firstValue : unitData}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ProductUnit(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: widget
                                              .productUnit.productUnit
                                              .map(
                                            (data) {
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          unitData = data;
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        data,
                                                        style: TextStyle(
                                                            color: primaryColor,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ).toList(),
                                        );
                                      },
                                    );
                                  },
                                  title:
                                      unitData == null ? firstValue : unitData,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Count(
                                productId: widget.productId,
                                productName: widget.productName,
                                productImage: widget.productImage,
                                productPrice: widget.productPrice,
                                productUnit:
                                    unitData == null ? firstValue : unitData,
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
