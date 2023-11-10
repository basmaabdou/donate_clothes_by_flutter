import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/componant/component.dart';
import '../users/login_screen.dart';


class BoardingModel{
  final String image;
  final String body;

  BoardingModel(
      {
        required this.image,
        required this.body
      });
}

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding=[
    BoardingModel(
        image: 'assets/images/b4.jpg',
        body: 'To donate and recycle your old clothes !'
    ),
    BoardingModel(
        image: 'assets/images/b1.jpg',
        body: 'Pack all your unwanted clothes'
    ),
    BoardingModel(
        image: 'assets/images/b2.jpg',
        body: 'Send your parcels to the charity'
    ),

    BoardingModel(
        image: 'assets/images/b3.jpg',
        body: 'Get access to discount coupon'
    ),


  ];


  void submit(){
    navigateFinish(context, LoginScreen());
  }

  var boardController=PageController();
  bool isLast=false;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        elevation: 0,
        actions: [
          TextButton(
              onPressed: (){
                navigateTo(context, LoginScreen());
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index){
                  if(index==boarding.length-1) {
                    setState(() {
                      isLast=true;

                    });
                  }else{
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                itemBuilder: (context,index)=>buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor:Color(0xff127d9a),
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                      expansionFactor: 4
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast){
                      submit();
                    }
                    boardController.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastEaseInToSlowEaseOut
                    );
                  },
                  child: Icon(Icons.arrow_back_ios_new),
                  backgroundColor: Color(0xff127d9a),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 250,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(170),
            image: DecorationImage(image:  AssetImage('${model.image}'),fit: BoxFit.cover,)
        ),
      ),
      SizedBox(
        height:50,
      ),
      Text(
        '${model.body}',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
        ),
      ),

    ],
  );
}