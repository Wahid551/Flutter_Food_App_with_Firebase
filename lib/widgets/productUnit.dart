import 'package:flutter/material.dart';

class ProductUnit extends StatelessWidget {
  late void Function() onTap;
  late String title;
  ProductUnit({required this.onTap, required this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.10 / 2,
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
                '$title',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_downward,
                size: 15.0,
                color: Colors.orangeAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
