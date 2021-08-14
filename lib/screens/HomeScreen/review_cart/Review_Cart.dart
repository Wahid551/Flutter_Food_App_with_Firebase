import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/widgets/Single_item.dart';

class ReviewCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text('Total Amount'),
        subtitle: Text('\$17.00'),
        trailing: Container(
          width: 160.0,
          child: MaterialButton(
            onPressed: () {},
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text('Submit'),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Review Cart'),
      ),
      body: ListView(
        children: [
          // SingleItem(isBool: true),
          // SingleItem(isBool: true),
          // SingleItem(isBool: true),
        ],
      ),
    );
  }
}
