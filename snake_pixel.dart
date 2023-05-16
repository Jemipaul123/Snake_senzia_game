import 'package:flutter/material.dart';

class SnakePixel extends StatelessWidget{
  const SnakePixel({Key? key}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(7),

        ),
      ),
    );
  }

}
