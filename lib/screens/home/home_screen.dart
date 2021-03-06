import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/screens/home/Cart/MyCart.dart';
import 'package:ecommerce_app/screens/home/components/body.dart';
import 'package:ecommerce_app/screens/home/models/product.dart';
import 'package:ecommerce_app/screens/home/wish_list/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';
class HomeScreen extends StatefulWidget {
  @override
  
  static String routename="/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  

    void update(Product p,BuildContext context){
                           setState(() {

                                          
                                                if (!(productsCart.contains(p))){
                                                  

                                                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Product added to your cart')));
                                                productsCart.add(p);
                                                numOfProductInCart+=1;
                                              
                                              }else{

                                                Scaffold.of(context).showSnackBar(SnackBar(content:Text('Product is already added to your cart')));
                                                
                                              }
                                              });
    }
     void remove(Product p){
  setState(() {
                                                             p.isFavourite=false;
                                                             favProducts.remove(p);
                                                             productsCart.remove(p);
                                                             numOfProductInCart-=1;
                                                             
                                                         });

 }
   
   

    
  int _currentindex=0;
  Widget build(BuildContext context) {
   final List<Widget> _children = [
      Body(),
      WishList(function1:update,function2: remove),
      Mycart(function1: remove),
      Body(),
    ];
    return Scaffold(
      
      backgroundColor: Colors.white,
      
    
      body: _children[_currentindex],
         bottomNavigationBar: BottomNavigationBar(
           type: BottomNavigationBarType.shifting,
         onTap: (int index) {
          setState(() {
            _currentindex= index;
          });
        },
      currentIndex:_currentindex ,
      unselectedItemColor: kSecondaryColor.withOpacity(0.6),

        items:  <BottomNavigationBarItem>[
          
     BottomNavigationBarItem(
       
       icon: Icon(Icons.home,size: getProportionateScreenWidth(30),),
       
       label: "",
       
     ),
     BottomNavigationBarItem(
       activeIcon:Icon(Icons.favorite,size:getProportionateScreenWidth(30) ,) ,
       icon: Icon(Icons.favorite_border,size:getProportionateScreenWidth(30) ,),
       label: "",

       
     ),
     BottomNavigationBarItem(
       
         icon: Stack(
           overflow: Overflow.visible,
           children: [
             SvgPicture.asset("assets/icons/Cart Icon.svg",width: getProportionateScreenWidth(30),
             height:getProportionateScreenWidth(30) ,color: kSecondaryColor,),
               if(numOfProductInCart!=0)

           Positioned(
             top: -5,
             right: -2,

                                  child: Container(
               width: getProportionateScreenWidth(16),
               height: getProportionateScreenWidth(16),
               decoration: BoxDecoration(
                 color: kPrimaryColor,
                 shape:BoxShape.circle,
                 border: Border.all(width: 1.5,color: Colors.white),
               ),
               child: Center(
                 child: Text("$numOfProductInCart",style: TextStyle(
                   color: Colors.white,
                   fontSize: getProportionateScreenWidth(8),
                   height: 1,
                   fontWeight: FontWeight.w600),
                   ),
               ),
             ),
           )
           ],
         ),
         label: "",
        
       
    ),
     
      BottomNavigationBarItem(
       icon: Icon(Icons.person_outline,size: getProportionateScreenWidth(30),),
       label: "",
       
       
     ),

        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,

        //onTap: _onItemTapped,
      )
    );
  }
}

