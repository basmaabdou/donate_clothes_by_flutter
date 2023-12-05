import 'package:donate_clothes_project/screens/main/HomeScreen/home_screen.dart';
import 'package:donate_clothes_project/screens/widgets/collected_profile.dart';
import 'package:donate_clothes_project/shared/componant/component.dart';
import 'package:donate_clothes_project/shared/componant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/out_of_pickup.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Color(0xffF9F9F9),
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Color(0xff127d9a),
              fontSize: 25,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
                size: 25,
              )),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                            height: 210,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(20),
                                color: Colors.white),
                            child: Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Text(
                                    'Basma Mohamed',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700, fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'BasmaMohamed@gmail.com',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '4567815488999',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/profile1.png')),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '250 Points',
                              style: TextStyle(
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: (){
                        navigateTo(context, EditProfile());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[200]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child:Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200]
                              ),
                              child: Icon(Icons.edit,color: defaultColor,size: 25,)
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'DONATION DETAILS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 120,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      OutOfPickUp('assets/images/d1.png', '1 km away'),
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 5,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 130,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      Collected('assets/images/d2.png', 'on Fri,13 Nov'),
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
