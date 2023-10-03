import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridFood extends StatelessWidget {
  const GridFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 130,
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100]
            ),
            child: Image.network('https://bobakingusa.com/wp-content/uploads/2020/09/oolongmilktea-1.png'),
          ),
          const Text("Milk Tea",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 2
            ),)
        ],
      ),
    );
  }
}