import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class databaseMethods{

  Future  addQuizCategory(Map<String , dynamic>  userQuizCategory, String category)async{
    return await FirebaseFirestore.instance.collection(category).add(userQuizCategory);

  }
  Future <Stream<QuerySnapshot>> getCategoryQuiz(String category)async{
    return await FirebaseFirestore.instance.collection(category).snapshots();
  }

}