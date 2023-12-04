import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Collected(String img,date)=>Container(
    height: 130,
    width:325,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
    ),
    child: Padding(
      padding: const EdgeInsetsDirectional.only(start: 10,end: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(img),width: 125,height: 150,),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Collected',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Icon(Icons.access_time,color: Colors.grey,size: 18,),
                  Text(
                    date,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: (){},
                  child: Text(
                    'Collect Points',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),
                  ))
            ],
          ),
        ],
      ),
    )
);
