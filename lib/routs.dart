








import 'package:ecommerce_app/screens/ChooseBetween/registerorsign_in.dart';
import 'package:ecommerce_app/screens/Login_success/login_success.dart';
import 'package:ecommerce_app/screens/forgot_pswd/fogot_pswd_pswd.dart';
import 'package:ecommerce_app/screens/forgot_pswd/forgot_pswd.dart';
import 'package:ecommerce_app/screens/forgot_pswd/newpswd.dart';
import 'package:ecommerce_app/screens/home/Cart/MyCart.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/home/wish_list/wish_list.dart';
import 'package:ecommerce_app/screens/register/register.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in.dart';
import 'package:ecommerce_app/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String,WidgetBuilder> routes={
  SplashScreen.routename:(context)=>SplashScreen(),
  SignInScreen.routename:(context)=>SignInScreen(),
  RegisterOrSignInScreen.routename:(context)=>RegisterOrSignInScreen(),
  RegisterScreen.routename:(context)=>RegisterScreen(),
  ForgotPswd.routename:(context)=>ForgotPswd(),
  LoginSuccessScreen.routename:(context)=>LoginSuccessScreen(),
  ForgotPswdPswd.routename:(context)=>ForgotPswdPswd(),
  NewPswd.routename:(context)=>NewPswd(),
  HomeScreen.routename:(context)=>HomeScreen(),
  WishList.routename:(context)=>WishList(),
  Mycart.routename:(context)=>Mycart(),
};