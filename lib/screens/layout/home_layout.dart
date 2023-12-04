
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout_cubit/cubit.dart';
import 'layout_cubit/states.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (BuildContext context, LayoutStates state) {  },
        builder: (BuildContext context, LayoutStates state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              selectedLabelStyle: TextStyle(
                  color: Color(0xff777A95),
                  fontWeight: FontWeight.w300,
                  fontSize: 11.62
              ),
              unselectedLabelStyle: TextStyle(
                  color: Color(0xff828A89),
                  fontSize: 12,
                  fontWeight: FontWeight.w100
              ),
              selectedItemColor: Color(0xff05796B),
              // unselectedItemColor: Color(0xff828A89),
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled,size: 30),
                    label: 'Home'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.read_more,size: 30),
                    label: 'AboutUs'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person,size: 30),
                    label: 'Profile'
                ),

              ],
            ),

          );
        },
      ),
    );
  }
}
