import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donate_clothes_project/screens/users/user_cubit/cubit.dart';
import 'package:donate_clothes_project/screens/users/user_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/donate_page.dart';
import '../../shared/componant/component.dart';
import '../../shared/componant/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../layout/home_layout.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passController = TextEditingController();

  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.success!) {
              print(state.loginModel.message);
              print(state.loginModel.token);
              token = state.loginModel.token;
              CacheHelper.saveData(key: 'token', value: state.loginModel.token)
                  .then((value) {
                token = state.loginModel.token;
                navigateFinish(context, HomeLayout(userToken: token ?? ''));
              });
            } else {
              print(state.loginModel.message);
              messageToast(
                  msg: state.loginModel.message!, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: const Color(0xffF9F9F9),
              appBar: AppBar(
                backgroundColor: const Color(0xffF9F9F9),
                elevation: 0,
                actions: [
                  TextButton(
                      onPressed: () {
                        if (token != null) {
                          navigateFinish(
                              context, HomeLayout(userToken: token!));
                        } else {
                          navigateFinish(context, HomeLayout(userToken: ''));
                        }
                      },
                      child: const Text(
                        'skip  ',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff127d9a)),
                      )),
                ],
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome Back',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 32,
                              color: Color(0xff264446)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Text(
                          ' Please Enter Your Details.',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff828A89)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email must be not empty';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined,
                                  color: Color(0xffA0A2B3)),
                              labelText: 'Email',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffA0A2B3)),
                              hintText: 'manikstk@gmail.com',
                              labelStyle: TextStyle(
                                  color: Color(0xff777A95),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: passController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'the password not allow to be empty';
                            }
                            return null;
                          },
                          obscureText: !isPassword,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xffA0A2B3),
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffA0A2B3)),
                            labelStyle: const TextStyle(
                                color: Color(0xff777A95),
                                fontWeight: FontWeight.w800,
                                fontSize: 16),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                UserCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passController.text);
                              }
                            },
                            color: Color(0xff127d9a),
                            height: 55,
                            minWidth: 306,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Text(
                              'Sign In',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Color(0xffFFFFFF)),
                            ),
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          // Adjust the height according to your needs
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don’t have an account ?',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff756B6B)),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: const Text(
                                  'SignUp',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff127d9a)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
