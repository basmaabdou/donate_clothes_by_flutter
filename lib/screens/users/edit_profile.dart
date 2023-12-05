import 'dart:io';

import 'package:donate_clothes_project/shared/componant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/componant/component.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var nameController=TextEditingController();

  var emailController=TextEditingController();

  var phoneController=TextEditingController();

  var passController=TextEditingController();

  var confirmController=TextEditingController();

  bool isPassword=false;

  File? profileImage;

  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile=await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar:AppBar(
        backgroundColor: Color(0xffF9F9F9),
        elevation: 0.0,
        title:  Text(
            'Edit Profile',
          style: TextStyle(
            color: defaultColor
          ),
        ),
        titleSpacing: 0,
        leading:  IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon:  Icon(
            Icons.arrow_back_ios_new_outlined,
              color: defaultColor
          ),
        ),
      ),
      body:  Padding(
        padding:  EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  profileImage !=null  ?
                  Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                      ),
                      child:Image.file(profileImage!,width: 160,height: 150,fit: BoxFit.cover,))
                      :
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile3.png'),
                          fit: BoxFit.fitWidth,
                        )

                    ),
                  ),
                  IconButton(
                      onPressed: (){
                        getImageFromGallery();
                      },
                      icon:  CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff127d9a),
                          child: Icon(Icons.camera_alt_outlined,size: 20,)
                      )
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              defaultTextForm(
                  controller: nameController,
                  type: TextInputType.name,
                  labelText: 'UserName',
                  validate: (value){
                    if(value.isEmpty){
                      return 'name must be not empty';
                    }
                    return null;
                  },
                  prefix: Icons.person
              ),
              SizedBox(
                height: 10,
              ),
              defaultTextForm(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  labelText: 'Email',
                  validate: (value){
                    if(value.isEmpty){
                      return 'email must be not empty';
                    }
                    return null;
                  },
                  prefix: Icons.email
              ),
              SizedBox(
                height: 10,
              ),
              defaultTextForm(
                  controller: phoneController,
                  type: TextInputType.phone,
                  labelText: 'Phone',
                  validate: (value){
                    if(value.isEmpty){
                      return 'phone must be not empty';
                    }
                    return null;
                  },
                  prefix: Icons.phone
              ),
              SizedBox(
                height: 10,
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
                  border: OutlineInputBorder(),
                  labelStyle: const TextStyle(
                      color: Colors.grey
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff127d9a), width: 2.0),
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
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: confirmController,
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
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  labelStyle: const TextStyle(
                      color: Colors.grey
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff127d9a), width: 2.0),
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
              SizedBox(
                height: 20,
              ),
              defaultButton(function: (){}, text: "Update")
            ],
          ),
        ),
      ),
    );
  }
}
