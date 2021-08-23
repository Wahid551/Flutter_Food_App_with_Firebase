import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/widgets/custom_text_field.dart';

class AddDeliverAddress extends StatefulWidget {
  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliverAddressState extends State<AddDeliverAddress> {
  var myType = AddressTypes.Home;
  // late TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "Add Address",
            style: TextStyle(
              color: textColor,
            ),
          ),
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CostomTextField(
              labText: "First name",
              //    controller: textEditingController,
              keyboardType: TextInputType.text,
            ),
            CostomTextField(
              labText: "Last name",
              //  controller: textEditingController,
              keyboardType: TextInputType.text,
            ),
            CostomTextField(
              labText: "Mobile No",
              //controller: textEditingController,
              keyboardType: TextInputType.phone,
            ),
            CostomTextField(
              labText: "Alternate Mobile No",
              //     controller: textEditingController,
              keyboardType: TextInputType.phone,
            ),
            CostomTextField(
              labText: "Society",
              //   controller: textEditingController,
              keyboardType: TextInputType.text,
            ),
            CostomTextField(
              labText: "Street",
              // controller: textEditingController,
              keyboardType: TextInputType.text,
            ),
            CostomTextField(
              labText: "Landmark",
              //    controller: textEditingController,
              keyboardType: TextInputType.text,
            ),
            CostomTextField(
              labText: "City",
              //  controller: textEditingController,
              keyboardType: TextInputType.text,
            ),
            CostomTextField(
              labText: "Area",
              //   controller: textEditingController,
              keyboardType: TextInputType.text,
            ),
            CostomTextField(
              labText: "Pin Code",
              //  controller: textEditingController,
              keyboardType: TextInputType.number,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Set Location"),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Other"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
