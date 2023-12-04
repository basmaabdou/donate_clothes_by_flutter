
import 'dart:ui';

import '../network/local/cache_helper.dart';
import 'component.dart';

void signOut(context){
  CacheHelper.removeDate(key: 'token').then((value) {
    // navigateFinish(context, ShopLoginScreen());
  });
}

String? uId='';
String? token='';
Color defaultColor=Color(0xff127d9a);

// To print full Text
void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}








