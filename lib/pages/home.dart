import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app1/pages/Categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app1/pages/question.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffedf3f6),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
          
             children: [
             Container(
                  height: 220,
                  padding: EdgeInsets.only(top: 50.0, left: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                    color: Color(0xff2a2b31)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius : BorderRadius.circular(60),
                          child: Image.asset('assets/arslan.png',height: 50, width: 50, fit: BoxFit.cover)),
                      SizedBox(width: 20.0,),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("Arslan Ibrahim", style: GoogleFonts.indieFlower(fontSize: 26.0, color: Colors.white,fontWeight: FontWeight.w400),),
                      )
                    ],
                  ),
                ),
             
             Container(
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 color: Colors.black,
               ),
               margin: EdgeInsets.only( top: 120.0, left: 20.0 , right: 20.0),
               child: Row(children: [
                 ClipRRect( borderRadius:BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                     child: Image.asset('assets/quiz.PNG')),
                 SizedBox(width: 30.0 ,),
                 Column(
                   children: [
                     Text("PLAY &\n WIN", style: GoogleFonts.indieFlower(fontSize: 35, color: Colors.white,fontWeight: FontWeight.bold),),
                     Text("Play Quiz by\n guessing the image", style: GoogleFonts.indieFlower(fontSize: 15.0, color: Color(0xffa4a4a4),fontWeight: FontWeight.w500),),
                   ],
                 )
               ],),
             ),  
          ]
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Top Quiz Categories", style: GoogleFonts.indieFlower(fontSize: 23.0, color: Colors.black,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20.0,),
              categories(img: 'assets/place.png', name: 'Place', img1: 'assets/dog.png', name2: 'Animals',selectCategory1: "Animals",selectCategory: "Place",),
              categories(img: 'assets/fruit.png', name: 'Fruits', img1: 'assets/object.png', name2: 'Objects',selectCategory1: "Objects",selectCategory:  "Fruits",),
              categories(img: 'assets/sports.png', name: 'Sports', img1: 'assets/random.png', name2: 'Random',selectCategory1:  "Random",selectCategory:  "Sports",),

            ],
          ),
        ),
      ),
    );
  }
}


