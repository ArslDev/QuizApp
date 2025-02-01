import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app1/pages/home.dart';
import 'package:quiz_app1/service/database.dart';
import 'package:random_string/random_string.dart';
import 'package:firebase_storage/firebase_storage.dart';

class addquiz extends StatefulWidget {
  const addquiz({super.key});

  @override
  State<addquiz> createState() => _addquizState();
}

class _addquizState extends State<addquiz> {

  final ImagePicker  _imagePicker = ImagePicker();
  File? selectedImage;

  Future getImage()async{
    var  image=await _imagePicker.pickImage(source: ImageSource.gallery);

    selectedImage= File(image!.path);
    setState(() {

    });
  }


  String? value;
  uploadItem()async{
    if(firstoption.text!=""&&secondoption!=""&&thirdoption!=""&&fouroption!=""){
      String addId= randomAlphaNumeric(10);

    Reference firebaseStorageRef= FirebaseStorage.instance.ref().child("Admin").child(addId);

    final UploadTask task= firebaseStorageRef.putFile(selectedImage!);
    var downloadUrl = await (await task).ref.getDownloadURL();
    Map<String, dynamic> addQuiz={
      "Image":downloadUrl,
      "option1": firstoption.text,
      "option2": secondoption.text,
      "option3": thirdoption.text,
      "option4": fouroption.text,
      "correct": Answeroption.text,

    };
    await databaseMethods().addQuizCategory(addQuiz, value!).then((value){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orange,
          content: Text("Quiz has been added Successfully",style: GoogleFonts.indieFlower(fontSize: 18.0,),)));
    });
    }
  }

  final List<String> QuizCategories =['Animal','Sports','Random','fruits','Objects','Place'];

  TextEditingController firstoption = new TextEditingController();
  TextEditingController secondoption = new TextEditingController();
  TextEditingController thirdoption = new TextEditingController();
  TextEditingController fouroption = new TextEditingController();
  TextEditingController Answeroption = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add Quiz', style: GoogleFonts.indieFlower( color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Upload The Quiz Picture', style: GoogleFonts.indieFlower(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0),
            selectedImage == null?  GestureDetector(
              onTap: (){
                getImage();
              },
              child: Center(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all( color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.camera_alt_rounded, color: Colors.black,),

                    ),
                  ),
              ),
            ) :Center(
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all( color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.file(selectedImage!, fit: BoxFit.cover,)),

                ),
              ),
            ) ,
              SizedBox(height: 20.0,),
              Text('Option 1', style: GoogleFonts.indieFlower(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w700),),
             SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: firstoption,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter option one',
                    hintStyle: GoogleFonts.indieFlower( color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w700)
                  ),
        
                ),
              ),
              SizedBox(height: 20.0,),
              Text('Option 2', style: GoogleFonts.indieFlower(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w700),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: secondoption,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter option two',
                      hintStyle: GoogleFonts.indieFlower( color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w700)
                  ),
        
                ),
              ),
              SizedBox(height: 20.0,),
              Text('Option 3', style: GoogleFonts.indieFlower(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w700),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: thirdoption,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter option three',
                      hintStyle: GoogleFonts.indieFlower( color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w700)
                  ),
        
                ),
              ),
              SizedBox(height: 20.0,),
              Text('Option 4', style: GoogleFonts.indieFlower(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w700),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: fouroption,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter option four',
                      hintStyle: GoogleFonts.indieFlower( color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w700)
                  ),
        
                ),
              ),
              SizedBox(height: 20.0,),
              Text('Correct Answer', style: GoogleFonts.indieFlower(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.w700),),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: Answeroption,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter the correct Answer !',
                      hintStyle: GoogleFonts.indieFlower( color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w700)
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: DropdownButtonHideUnderline(child: DropdownButton<String>(items: QuizCategories.map((item)=>DropdownMenuItem(child: Text(item, style: GoogleFonts.indieFlower(color: Colors.black,fontSize: 20.0),),value : item)).toList(), onChanged: ((value)=>setState(() {
                  this.value=value;
                })),
                  dropdownColor: Colors.white,
                  hint: Text('Select the Catogires'),
                  iconSize: 36,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                  value: value,
                ))
              ),
              SizedBox(height: 30.0,),
              GestureDetector(
                onTap: (){
                  uploadItem();
                },
                child: Center(child: Material(
                  elevation: 5.0,
                  borderRadius:  BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> home()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text('Add', style: GoogleFonts.indieFlower(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),))

                    ),
                  ),
                ),),
              )
            ],
          ),
        ),
      ),

    );
  }
}
