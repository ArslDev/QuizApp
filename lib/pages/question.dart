import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app1/service/database.dart';

class question extends StatefulWidget {
  String  category;
  question({required this.category});

  @override
  State<question> createState() => _questionState();
}

class _questionState extends State<question> {
  bool show= false;
  getontheload()async{
    Quizstream = await databaseMethods().getCategoryQuiz(widget.category);
    setState(() {
      
    });
  }
  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Stream? Quizstream;
  PageController controller= PageController();
  Widget allQuiz(){
    return   StreamBuilder(
        stream: Quizstream,
        builder: (context, AsyncSnapshot snapshot){
          return snapshot.hasData? PageView.builder(
              controller: controller,
              itemCount: snapshot.data.docs.lenght,
              itemBuilder: (context,index){
                DocumentSnapshot   ds = snapshot.data.doc[index];
                return Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("assets/ronaldo.jpg", height: 300, width: MediaQuery.of(context).size.width, fit: BoxFit.cover,)),

                          SizedBox(height: 20.0,),
                          GestureDetector(
                            onTap: (){
                                show = true;
                              setState(() {

                              });
                            },
                            child: show? Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:Border.all(color: Color(0xff818181), width: 1.5),
                              ),
                              child: Text(ds["option1"], style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),

                            ) : Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:Border.all(color: ds["correct"]==ds["option1"]?Colors.green: Colors.red, width: 1.5),
                              ),
                              child: Text(ds["option1"], style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),

                            ),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){
                              show = true;
                              setState(() {

                              });
                            },
                            child: show? Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:Border.all(color: Color(0xff818181), width: 1.5),
                              ),
                              child: Text(ds["option2"], style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),

                            ) : Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:Border.all(color: ds["correct"]==ds["option2"]?Colors.green: Colors.red, width: 1.5),
                              ),
                              child: Text(ds["option2"], style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),

                            ),
                          ),
                          SizedBox(height: 20.0,),
                          GestureDetector(
                            onTap: (){
                              show = true;
                              setState(() {

                              });
                            },
                            child: show? Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:Border.all(color: Color(0xff818181), width: 1.5),
                              ),
                              child: Text(ds["option3"], style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),

                            ) : Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:Border.all(color: ds["correct"]==ds["option3"]?Colors.green: Colors.red, width: 1.5),
                              ),
                              child: Text(ds["option3"], style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),

                            ),
                          ),
                          SizedBox(height: 20.0,),
                          GestureDetector(
                            onTap: (){
                              show = true;
                              setState(() {

                              });
                            },
                            child: show? Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:Border.all(color: Color(0xff818181), width: 1.5),
                              ),
                              child: Text(ds["option4"], style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),

                            ) : Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:Border.all(color: ds["correct"]==ds["option4"]?Colors.green: Colors.red, width: 1.5),
                              ),
                              child: Text(ds["option4"], style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),

                            ),
                          ),
                          SizedBox(height: 10.0,),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                show = false;
                              });
                              controller.nextPage(duration: Duration(microseconds: 200), curve: Curves.easeIn);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(60)
                                  ),
                                  padding: EdgeInsets.all(10),
                                    child: Icon(Icons.arrow_forward_ios,color: Color(0xff004840),)),
                              ],
                            ),
                          )


                        ],
                      ),
                    ),
                  ),
                );
              }):Container();

        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff004840),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top : 50 , left: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Color(0xfff35b32),
                            borderRadius: BorderRadius.circular(60)
                          ),
                          child:  Center(child: Icon(Icons.arrow_back_ios_sharp, color: Colors.white,))),
                      SizedBox(width: 100.0,),
                       Text('Sports', style : GoogleFonts.indieFlower(fontSize:24.0, color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
        SingleChildScrollView(
          child: Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/ronaldo.jpg", height: 300, width: MediaQuery.of(context).size.width, fit: BoxFit.cover,)),
          
                    SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap: (){
                        show = true;
                        setState(() {
          
                        });
                      },
                      child: show? Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:Border.all(color: Color(0xff818181), width: 1.5),
                        ),
                        child: Text("option1", style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),
          
                      ) : Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:Border.all(color: "correct"=="option1"?Colors.green: Colors.red, width: 1.5),
                        ),
                        child: Text("option1", style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),
          
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        show = true;
                        setState(() {
          
                        });
                      },
                      child: show? Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:Border.all(color: Color(0xff818181), width: 1.5),
                        ),
                        child: Text("option2", style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),
          
                      ) : Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:Border.all(color: "correct"=="option2"?Colors.green: Colors.red, width: 1.5),
                        ),
                        child: Text("option2", style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),
          
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap: (){
                        show = true;
                        setState(() {
          
                        });
                      },
                      child: show? Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:Border.all(color: Color(0xff818181), width: 1.5),
                        ),
                        child: Text("option3", style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),
          
                      ) : Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:Border.all(color: "correct"=="option3"?Colors.green: Colors.red, width: 1.5),
                        ),
                        child: Text("option3", style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),
          
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap: (){
                        show = true;
                        setState(() {
          
                        });
                      },
                      child: show? Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:Border.all(color: Color(0xff818181), width: 1.5),
                        ),
                        child: Text("option4", style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),
          
                      ) : Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:Border.all(color: "correct"=="option4"?Colors.green: Colors.red, width: 1.5),
                        ),
                        child: Text("option4", style: GoogleFonts.indieFlower(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w500)),
          
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          show = false;
                        });
                        controller.nextPage(duration: Duration(microseconds: 200), curve: Curves.easeIn);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(60)
                              ),
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.arrow_forward_ios,color: Color(0xff004840),)),
                        ],
                      ),
                    )
          
          
                  ],
                ),
              ),
            ),
          ),
        )
            ],
          ) ,
        ),
      ),
    );
  }
}
