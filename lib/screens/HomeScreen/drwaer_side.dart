import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/provider/review_cart_provider.dart';
import 'package:food_app/provider/user_provider.dart';
import 'package:food_app/screens/HomeScreen/review_cart/Review_Cart.dart';
import 'package:food_app/screens/HomeScreen/wish_List/wishList.dart';
import 'package:provider/provider.dart';

import 'Home_Screen.dart';
import 'my_profile/my_profile.dart';

class DrawerSide extends StatefulWidget {
  late UserProvider userProvider;
  DrawerSide({required this.userProvider});
  @override
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  late ReviewCartProvider reviewCartProvider;

  Widget listTile(
      {required String title,
      required IconData iconData,
      required void Function() onTap}) {
    return Container(
      height: 50,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          size: 28,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow,
                        backgroundImage: NetworkImage(
                          userData.userImage ??
                              "https://s3.envato.com/files/328957910/vegi_thumb.png",
                        ),
                        radius: 40,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userData.userName),
                        Text(
                          userData.userEmail,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(
              iconData: Icons.home_outlined,
              title: "Home",
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            listTile(
              iconData: Icons.shop_outlined,
              title: "Review Cart",
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReviewCart()));
              },
            ),
            listTile(
              iconData: Icons.person_outlined,
              title: "My Profile",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MyProfile(userProvider: widget.userProvider)));
              },
            ),
            listTile(
                iconData: Icons.notifications_outlined,
                title: "Notification",
                onTap: () {}),
            listTile(
                iconData: Icons.star_outline,
                title: "Rating & Review",
                onTap: () {}),
            listTile(
              iconData: Icons.favorite_outline,
              title: "Wishlist",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WishLsit(),
                  ),
                );
              },
            ),
            listTile(
                iconData: Icons.copy_outlined,
                title: "Raise a Complaint",
                onTap: () {}),
            listTile(
                iconData: Icons.format_quote_outlined,
                title: "FAQs",
                onTap: () {}),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+923078308370"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:"),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "wahidmalik551@gmail.com",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
