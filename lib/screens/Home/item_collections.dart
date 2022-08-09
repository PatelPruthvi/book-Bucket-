import 'package:flutter/material.dart';

class item_collection extends StatelessWidget {
  const item_collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 220,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: const DecorationImage(
            image: NetworkImage(
                'https://static.get-headway.com/334_fcecfcc514824b0090df-15ca4acc3ee5ee.jpg'),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.grey.shade600,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurple[200],
        ),
      ),
    );
  }
}
