import 'package:bloc/bloc.dart';
import 'package:donate_clothes_project/screens/users/user_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/users_model.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_point.dart';


class UserCubit extends Cubit<UserStates>{
  UserCubit() : super(InitialLogin());

  static UserCubit get(context)=> BlocProvider.of(context);

  UserModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = UserModel.fromJson(value.data);

      if (loginModel != null) {
        print(loginModel!.success);
        print(loginModel!.message);
        print(loginModel!.token);

        if (loginModel!.data != null) {
          print(loginModel!.data!.email);
        } else {
          print('Data is null');
        }

        emit(LoginSuccessState(loginModel!));
      } else {
        print('Login model is null');
      }
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print(error.toString());
    });
  }


  void userRegister({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }){
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data: {
          'username':username,
          'email':email,
          'phone':phone,
          'password':password,
          'confirmPassword':confirmPassword
        }
    ).then((value) {
      loginModel=UserModel.fromJson(value.data);

      if (loginModel != null) {
        print(loginModel!.success);
        print(loginModel!.message);
        print(loginModel!.token);

        if (loginModel!.data != null) {
          print(loginModel!.data!.email);
        } else {
          print('Data is null');
        }

        emit(RegisterSuccessState(loginModel!));
      } else {
        print('Login model is null');
      }
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      print(error.toString());
    });
  }


  IconData suffix= Icons.visibility;
  bool isPassword=true;
  void changePasswordIcons(){
    isPassword=! isPassword;
    suffix= isPassword ? Icons.visibility : Icons.visibility_off_outlined;
    emit(LoginPasswordChangeState());
  }


}
