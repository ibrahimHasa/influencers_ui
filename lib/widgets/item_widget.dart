import 'package:flutter/material.dart';
import 'package:social/models/user_model.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({Key? key, required this.title, required this.count})
      : super(key: key);
  // final UserModel user;
  final String title;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
