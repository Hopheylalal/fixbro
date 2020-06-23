import 'package:flutter/material.dart';

class AccessItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String price;

  const AccessItem({this.imgUrl, this.name, this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200,
            child: Image.network(
              '$imgUrl',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text('$name', style: TextStyle(color: Colors.white),),
        SizedBox(height: 5,),
        Text('$price p', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold ), ),
      ],
    );
  }
}
