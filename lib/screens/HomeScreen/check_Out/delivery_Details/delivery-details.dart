import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/HomeScreen/check_Out/delivery_Details/payment_summary/payment_summary.dart';
import 'package:food_app/screens/HomeScreen/check_Out/delivery_Details/single_delivery_item.dart';

import 'add_delivery-address/add_delivery_Address.dart';

class DeliveryDetails extends StatelessWidget {
  List<Widget> address = [
    SingleDeliveryItem(
      address:
          "aera, balochistan/pakistan, Dara Bugti, street, 20, society 07, pincode 8000",
      title: "Assar Developer",
      number: "+923352062349",
      addressType: "Home",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliverAddress(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: address.isEmpty
              ? Text("Add new Address")
              : Text("Payment Summary"),
          onPressed: () {
            address.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeliverAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(),
                    ),
                  );
          },
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver To"),
            leading: Image.asset(
              "assets/location.png",
              height: 30,
            ),
          ),
          Divider(
            height: 1,
          ),
          Column(
            children: [
              address.isEmpty
                  ? Container()
                  : SingleDeliveryItem(
                      address:
                          "aera, balochistan/pakistan, Dara Bugti, street, 20, society 07, pincode 8000",
                      title: "Assar Developer",
                      number: "+923352062349",
                      addressType: "Home",
                    ),
            ],
          )
        ],
      ),
    );
  }
}
