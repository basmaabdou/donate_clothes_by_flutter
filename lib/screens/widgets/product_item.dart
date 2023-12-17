import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String img,text;

  const ProductItem({super.key, required this.img, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffFFFFFF)
      ),
      child: Column(
        children: [
          Container(
            width: 140.0,
            height: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(img)),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.redAccent,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
           text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: Colors.black.withOpacity(.25)
            ),
          ),
        ],
      ),
    );
  }
}
