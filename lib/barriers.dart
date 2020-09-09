import 'package:flutter/material.dart';

class barrier extends StatelessWidget {
  final size;
  barrier({this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width:10,color: Colors.green[700]
        ),
      ),
    );
  }
}
