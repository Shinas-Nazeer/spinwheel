

import 'package:flutter/material.dart';

class SpinWidjet extends StatelessWidget {
   const SpinWidjet ({super.key});

  @override
  Widget build(BuildContext context) {
 return Column(
   children: [
     SizedBox(
       height: 400,
       child: Stack(children: [
         Positioned(child: 
         Align(
           alignment: Alignment.center,
           child: Image.asset('images/drawer.png', width: 350,height: 350,),
         )),
       Positioned(child: Align(
         alignment: Alignment.center,
            child: Image.asset('images/rout.png',width: 50,height: 50,),

       ))

       ]),
     )
   ],
 );



  }}