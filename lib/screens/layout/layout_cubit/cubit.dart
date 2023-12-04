import 'package:bloc/bloc.dart';
import 'package:donate_clothes_project/screens/layout/layout_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main/HomeScreen/home_screen.dart';
import '../../main/about_us_view/about_us_screen.dart';
import '../../users/profile_screen.dart';

class LayoutCubit extends Cubit<LayoutStates>{
      LayoutCubit() : super(InitialState());

      static LayoutCubit get(context)=>BlocProvider.of(context);

      int currentIndex=0;
      List<Widget> screen=[
            HomeScreen(),
            AboutUsScreen(),
            ProfileScreen(),
      ];
      void changeIndex(int index){
      currentIndex=index;
      emit(ChangeBottomNavStates());
}


}