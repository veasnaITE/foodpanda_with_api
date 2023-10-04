import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cuisines extends StatefulWidget {
  final items;
const Cuisines({
    super.key, required this.items,
  });

  @override
  State<Cuisines> createState() => _CuisinesState();
}

class _CuisinesState extends State<Cuisines> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[100]
          ),
          child: Image.network('https://bobakingusa.com/wp-content/uploads/2020/09/oolongmilktea-1.png'),
        ),
        Text("${widget.items?.title}",
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              height: 2
          ),)
      ],
    );
  }
}