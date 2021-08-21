import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import '../../../widgets/Single_item.dart';

class Search extends StatefulWidget {
  List<ProductModel> search;
  Search({required this.search});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = '';
  searchItem(query) {
    List<ProductModel> searchFood = widget.search.where(
      (element) {
        return element.productName.toLowerCase().contains(query);
      },
    ).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: _searchItem.map(
              (e) {
                return SingleItem(
                  isBool: false,
                  isWish: true,
                  productPrice: e.productPrice,
                  productName: e.productName,
                  productImage: e.productImage,
                  productId: e.productId,
                  productQuantity: 0,
                  productUnit: '',
                  onTap: () {},
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
