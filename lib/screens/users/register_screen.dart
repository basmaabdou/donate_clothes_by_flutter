import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donate_clothes_project/screens/users/user_cubit/cubit.dart';
import 'package:donate_clothes_project/screens/users/user_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/componant/component.dart';
import '../../../shared/componant/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../layout/home_layout.dart';
import 'login_screen.dart';


class RegisterScreen extends StatefulWidget {


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController=TextEditingController();

  var emailController=TextEditingController();

  var passController=TextEditingController();

  var confirmPassController=TextEditingController();

  var phoneController=TextEditingController();

  var formKey=GlobalKey<FormState>();

  bool isPassword=false;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)  => UserCubit(),
      child: BlocConsumer<UserCubit,UserStates>(
        listener: (context,state){
          if(state is RegisterSuccessState) {
            if(state.loginModel.success!){
                print(state.loginModel.message);
                navigateFinish(context, LoginScreen());
                // print(state.loginModel.token);
                // CacheHelper.saveData(key: 'token', value: state.loginModel.token).then((value) {
                //   token=state.loginModel.token;
                //   print('navigate');
                //   navigateFinish(context, LoginScreen());
                // });
            }else{
              print(state.loginModel.message);
              messageToast(
                  msg: state.loginModel.message!,
                  state: ToastStates.ERROR
              );
            }
          }
        },
        builder: (context,state){
          return Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: const Color(0xffF9F9F9),
                appBar: AppBar(
                  backgroundColor: const Color(0xffF9F9F9),
                  elevation: 0,
                   actions: [
                    TextButton(
                        onPressed: (){
                          navigateTo(context, HomeLayout());
                        },
                        child: const Text(
                          'skip  ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            color: Color(0xff127d9a)
                        )
                    ),
                    ),
                  ],
                ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Create Account',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 32,
                              color: Color(0xff264446)),
                        ),
                        const Text(
                          ' Let’s create account together',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff828A89)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validator:  (value){
                            if(value!.isEmpty){
                              return 'the name not allow to be empty';
                            }
                            return null;
                          },
                          decoration:const InputDecoration(
                              prefixIcon: Icon(Icons.person_2_outlined,color: Color(0xffA0A2B3),),
                              labelText: 'Name',
                              hintStyle: TextStyle(
                                  fontSize:16 ,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffA0A2B3)
                              ),
                              hintText: 'Enter your full name',
                              labelStyle: TextStyle(
                                  color: Color(0xff777A95),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16
                              )
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator:  (value){
                            if(value!.isEmpty){
                              return 'the email not allow to be empty';
                            }
                            return null;
                          },
                          decoration:const InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined,color: Color(0xffA0A2B3)),
                              labelText: 'Email',
                              hintStyle: TextStyle(
                                  fontSize:16 ,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffA0A2B3)
                              ),
                              hintText: 'manikstk@gmail.com',
                              labelStyle: TextStyle(
                                  color: Color(0xff777A95),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16
                              )
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator:  (value){
                            if(value!.isEmpty){
                              return 'the phone not allow to be empty';
                            }
                            return null;
                          },
                          decoration:const InputDecoration(
                              prefixIcon: Icon(Icons.phone_in_talk_outlined,color: Color(0xffA0A2B3),),
                              labelText: 'Phone number',
                              hintStyle: TextStyle(
                                  fontSize:16 ,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffA0A2B3)
                              ),
                              hintText: '+254   Enter your phone number',
                              labelStyle: TextStyle(
                                  color: Color(0xff777A95),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16
                              )
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: passController,
                          keyboardType: TextInputType.visiblePassword,
                          validator:  (value){
                            if(value!.isEmpty){
                              return 'the password not allow to be empty';
                            }
                            return null;
                          },
                          obscureText: !isPassword,
                          decoration:InputDecoration(
                            prefixIcon: const Icon(Icons.lock,color: Color(0xffA0A2B3),),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            hintStyle: const TextStyle(
                                fontSize:16 ,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffA0A2B3)
                            ),
                            labelStyle: const TextStyle(
                                color: Color(0xff777A95),
                                fontWeight: FontWeight.w800,
                                fontSize: 16
                            ),
                            suffixIcon: IconButton(
                              icon: Icon( isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,),
                              onPressed: () {
                                setState(() {
                                  isPassword= !isPassword;
                                });
                              },

                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: confirmPassController,
                          keyboardType: TextInputType.visiblePassword,
                          validator:  (value){
                            if(value!.isEmpty){
                              return 'the password not match';
                            }
                            return null;
                          },
                          obscureText: !isPassword,
                          decoration:InputDecoration(
                            prefixIcon: const Icon(Icons.lock,color: Color(0xffA0A2B3),),
                            labelText: 'ConfirmPassword',
                            hintText: 'confirm your password',
                            hintStyle: const TextStyle(
                                fontSize:16 ,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffA0A2B3)
                            ),
                            labelStyle: const TextStyle(
                                color: Color(0xff777A95),
                                fontWeight: FontWeight.w800,
                                fontSize: 16
                            ),
                            suffixIcon: IconButton(
                              icon: Icon( isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,),
                              onPressed: () {
                                setState(() {
                                  isPassword= !isPassword;
                                });
                              },

                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context)=>MaterialButton(
                            onPressed: () {
                              if(formKey.currentState!.validate()) {
                                UserCubit.get(context).userRegister(
                                  username: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passController.text,
                                  confirmPassword: confirmPassController.text,
                                );
                                if(nameController.text.length< 3){
                                  messageToast(msg: '\'username\'length must be at least 3 characters long', state: ToastStates.ERROR);
                                }
                                if (!emailController.text.endsWith(".com")) {
                                  messageToast(
                                    msg:  "\"email\" must be a valid email",
                                    state: ToastStates.ERROR,
                                  );
                                }
                                if(phoneController.text.length< 11){
                                  messageToast(msg:  "\"phone\" length must be at least 11 characters long", state: ToastStates.ERROR);
                                }
                                if(passController.text.length < 6){
                                  messageToast(msg:"\"password\" length must be at least 6 characters long", state: ToastStates.ERROR);
                                }
                                if(passController.text != confirmPassController.text){
                                  messageToast(msg: "Passwords do not match", state: ToastStates.ERROR);
                                }
                              }},
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            color: Color(0xff127d9a),
                            height: 56,
                            minWidth: 327,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          ),
                          fallback:(context)=> Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff756B6B)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>LoginScreen())
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  color: Color(0xff127d9a)
                                    ),
                              ),
                            )
                          ],
                        )

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
