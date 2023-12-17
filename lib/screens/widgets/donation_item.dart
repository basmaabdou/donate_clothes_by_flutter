import 'package:flutter/material.dart';

class DonationOpportunitetItem extends StatelessWidget {
final String img,text;

  const DonationOpportunitetItem({super.key, required this.img, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
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
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: Colors.black.withOpacity(.25)
            ),
          ),
          MaterialButton(
            onPressed: (){

            },
            height:30 ,
            minWidth: 50,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            color: Color(0xff129A7F),
            child: Text(
              'تبرع الان',
              style: TextStyle(
                  fontSize:16 ,
                  color: Color(0xffFFFFFF)
              ),
            ),),
        ],
      ),
    );
  }
}
