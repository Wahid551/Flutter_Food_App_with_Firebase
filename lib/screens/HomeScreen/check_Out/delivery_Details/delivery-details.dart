import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/provider/check_out_provider.dart';
import 'package:food_app/screens/HomeScreen/check_Out/delivery_Details/payment_summary/payment_summary.dart';
import 'package:food_app/screens/HomeScreen/check_Out/delivery_Details/single_delivery_item.dart';
import 'package:provider/provider.dart';

import 'add_delivery-address/add_delivery_Address.dart';

class DeliveryDetails extends StatelessWidget {
  // List<Widget> address = [
  //   SingleDeliveryItem(
  //     address:
  //         "aera, balochistan/pakistan, Dara Bugti, street, 20, society 07, pincode 8000",
  //     title: "Assar Developer",
  //     number: "+923352062349",
  //     addressType: "Home",
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
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
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Text("Add new Address")
              : Text("Payment Summary"),
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
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
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Container(
                  child: Center(
                    child: Text("No Data"),
                  ),
                )
              : Column(
                  children:
                      deliveryAddressProvider.getDeliveryAddressList.map((e) {
                    return SingleDeliveryItem(
                      address:
                          "aera, ${e.area}, street,${e.street}, society ${e.society}, pincode ${e.pinCode}",
                      title: "${e.firstName} ${e.lastName}",
                      number: "${e.mobileNo}",
                      addressType: e.addressType == "AddressType.other"
                          ? "Other"
                          : e.addressType == "AddressType.Home"
                              ? "Home"
                              : "Work",
                    );
                  }).toList(),
                  // children: [
                  //   deliveryAddressProvider.getDeliveryAddressList.isEmpty
                  //       ? Container(
                  //     child:Center(child: Text("No Data"),),
                  //   )
                  //       : SingleDeliveryItem(
                  //           address:
                  //               "aera, balochistan/pakistan, Dara Bugti, street, 20, society 07, pincode 8000",
                  //           title: "Assar Developer",
                  //           number: "+923352062349",
                  //           addressType: "Home",
                  //         ),
                  // ],
                )
        ],
      ),
    );
  }
}
