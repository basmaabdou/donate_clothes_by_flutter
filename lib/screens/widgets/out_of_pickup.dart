import 'package:donate_clothes_project/shared/componant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget OutOfPickUp(String img,address)=>Container(
    height: 130,
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
                'Out Of Pickup',
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
                  Icon(Icons.location_on_outlined,color: Colors.grey,size: 18,),
                  Text(
                    address,
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
                    'Cancel',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),
                  ))
            ],
          ),
          SizedBox(
            width: 13,
          ),
          TextButton(
              onPressed: (){},
              child: Text(
                'Track',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: defaultColor
                ),
              )
          )
        ],
      ),
    )
);
