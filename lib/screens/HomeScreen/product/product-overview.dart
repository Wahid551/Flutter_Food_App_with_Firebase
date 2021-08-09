import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';

class ProductOverView extends StatefulWidget {
  @override
  _ProductOverViewState createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    required Function onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        // onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
            backgroundColor: textColor,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Add To WishList",
            iconData: Icons.favorite_outline,
            onTap: () {},
          ),
          bonntonNavigatorBar(
              backgroundColor: primaryColor,
              color: textColor,
              iconColor: Colors.white70,
              title: "Go To Cart",
              iconData: Icons.shop_outlined,
              onTap: () {}),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text('Product Overview'),
      ),
    );
  }
}
