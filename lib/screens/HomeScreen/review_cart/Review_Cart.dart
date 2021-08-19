import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/models/review_cart_model.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:food_app/widgets/Single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatefulWidget {
  @override
  _ReviewCartState createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider =
        Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
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
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text('No Data'),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 8.0,
                    ),
                    SingleItem(
                      isWish: true,
                      isBool: true,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productImage: data.cartImage,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                      onTap: () {},
                    ),
                  ],
                );
              },
            ),
    );
  }
}
