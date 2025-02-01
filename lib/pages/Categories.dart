import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app1/pages/question.dart';



class categories extends StatelessWidget {
  categories ({super.key ,required this.img, required this.name ,required this.img1, required this.name2 , required this.selectCategory, required this.selectCategory1});
   String img;
   String name;
   String img1;
   String name2;
   String selectCategory;
   String selectCategory1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30,left: 20, right: 20),
      child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> question(category: selectCategory)));
            },
            child: Material(
              elevation : 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  width: 150,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Image.asset(img, height: 80.0, width: 80.0, fit: BoxFit.cover,),
                      SizedBox(height: 20.0,),
                      Text(name, style: GoogleFonts.indieFlower(fontSize: 22, color: Colors.black,fontWeight: FontWeight.w500),),
                    ],
                  )),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> question(category: selectCategory1)));
            },
            child: Material(
              elevation : 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  width: 150,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Image.asset(img1, height: 80.0, width: 80.0, fit: BoxFit.cover,),
                      SizedBox(height: 20.0,),
                      Text(name2, style: GoogleFonts.indieFlower(fontSize: 22, color: Colors.black,fontWeight: FontWeight.w500),),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
