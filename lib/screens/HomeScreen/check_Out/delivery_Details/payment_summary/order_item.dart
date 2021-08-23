import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://solidstarts.com/wp-content/uploads/Green-Grape-scaled.jpg',
        width: 60.0,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Food Name',
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            '50 Gram',
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text('\$30'),
        ],
      ),
      subtitle: Text('5'),
    );
  }
}
