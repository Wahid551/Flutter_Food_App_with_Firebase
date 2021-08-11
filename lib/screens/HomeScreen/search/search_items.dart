import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

class SearchItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      '\$50 Gram',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Container(
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
              ],
            ),
          )),
          Expanded(
            child: Container(
              height: 100.0,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 32.0),
              child: Container(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
