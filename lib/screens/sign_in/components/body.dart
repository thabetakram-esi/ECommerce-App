import 'package:ecommerce_app/components/form_error.dart';
import 'package:ecommerce_app/screens/register/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../size_config.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  SizedBox(width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24.0)),
        child: Column(children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(55),),
            Text("Logo Space",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87,fontSize: 28),),
             Padding(
               padding: const EdgeInsets.only(top:18.0),
               child: Text("Sign in",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87,fontSize: 18),),
             ),
            SignInForm(),
        ]
        )
      )
      )
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  List<String> errors =[];
  String error="";
     String email="";
    bool isEvalid=false;
    String pswd;
      final eController = TextEditingController();
      final pController = TextEditingController();
    final Mformkey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Form(
      key: Mformkey,
      child: Column(
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(50),),
          buildEmailForm(context),
          SizedBox(height: 20,),
          
          buildPasswordForm(context),
                    FormErr(error: error,),

          SizedBox(height: 40,),
               SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(56),
                                      child:  Padding(
                                        padding: const EdgeInsets.only(left:2.0,right:2.0),
                                        child: FlatButton(onPressed: (
                                        ){
                                           if(Mformkey.currentState.validate()){
                                           Mformkey.currentState.save();
                                         }
                                        },
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      color:kPrimaryColor,
                       child: Text("SIGN IN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:16)),),
                                      ),
                                      
                    ),
                    SizedBox(height: getProportionateScreenHeight(20),),
                    Padding(
                      padding:  EdgeInsets.only(left:2.0,right: getProportionateScreenWidth(200)),
                      child: Text("Forgot Password ?",style: TextStyle(color: Colors.cyan[600]),),
                    ),
                    SizedBox(height: getProportionateScreenHeight(100),),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Image.asset("assets/images/googlelogo.png",width: 40,height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(left:20.0,right: 20),
                          child: Image.asset("assets/images/fblogo.png",width: 60,height: 60,),
                        ),
                        Image.asset("assets/images/twitterlogo.png",width: 40,height: 40,),
                      

                     ],),
                     SizedBox(height: getProportionateScreenHeight(36),),
                     RichText(
                       text:TextSpan(
                         text:"No Account? ",
                         style: TextStyle(color:Colors.black87),
                         children: <TextSpan>[
                            TextSpan(
                              text:"Register ",
                               style: TextStyle(color:  Colors.cyan[600]),
                               recognizer: TapGestureRecognizer()
                               ..onTap=(){
                                        Navigator.pushReplacementNamed(context, RegisterScreen.routename);                               }

                            )
                         ]
                       ) ,)
        ]
      )

      
      
    );
  }
    @override
  void dispose() {
        eController.dispose();
    pController.dispose();
    super.dispose();
  }
  bool _showPassword = false;
  Theme buildPasswordForm(BuildContext context) {
    return Theme(
          data: Theme.of(context).copyWith(primaryColor:kPrimaryColor ),
                    child: TextFormField(
                      controller: pController,
                      onSaved: (newvalue){
                        pswd=newvalue;
                      },
                      onChanged: (value){
                        if(pController.text.isNotEmpty){
                          setState(() {
                            error="";
                          });
                          
                          
                          
                        } if(pController.text.length>=6 && pController.text.length<20 ){
                          setState(() {
                            error="";
                          });
                          
                        } 
                      },
            obscureText: !this._showPassword,
              validator: (value){
                 if(pController.text.isEmpty && email?.isNotEmpty && isEvalid){
                          setState(() {
                            error=kPassNullError;
                          });
                        }else if(pController.text.length<6 && email.isNotEmpty && isEvalid){
                          setState(() {
                            error=kShortPassError;
                          });
                        }
            },

            decoration: InputDecoration(
              labelText: "Password",
              icon: Icon(Icons.lock,size: 28,),

              hintText: "Enter your password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
                 suffixIcon: IconButton(
          icon: Icon(
            this._showPassword ? Icons.remove_red_eye : Icons.visibility_off, 
            color: this._showPassword ? kPrimaryColor : Colors.grey,
          ),
          onPressed: () {
            setState(() => this._showPassword = !this._showPassword );
          },
        ),
            
         
            ),
          ),
        );
  }


  
  Theme buildEmailForm(BuildContext context) {
    return Theme(
          data: Theme.of(context).copyWith(primaryColor:kPrimaryColor ),
                    child: TextFormField(
                       controller: eController,
                      onSaved: (newvalue){
                        email=newvalue;
                      
                      },
                      onChanged: (value){
                          if(eController.text.isNotEmpty ){
                          setState(() {
                           error=""; 
                          });
                        }if(emailValidatorRegExp.hasMatch(eController.text) ){
                          setState(() {
                            isEvalid=true;
                            
                            error="";
                            
                          });
                        }
                      },
                      validator: (value){
                        if(eController.text.isEmpty ){
                          setState(() {
                            error=kEmailNullError;
                           
                          });
                        }else if(!emailValidatorRegExp.hasMatch(eController.text) ){
                          setState(() {
                            isEvalid=false;
                            error=kInvalidEmailError;
                         
                          });
                        }else if(pController.text.isEmpty){
                          setState(() {
                            error=kPassNullError;
                          });
                        }
                        
                       
                      },

            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              icon: Icon(Icons.email,size: 28,),
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            
         
            ),
          ),
        );
  }
}