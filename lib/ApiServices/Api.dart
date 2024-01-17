import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
String url="192.168.1.6:8080";
class ApiServices {

//-------------------------------////


  Future<String> userSignUp(String userName,String email,String password,String user_type,String department,String block,
      String officeNumber)async{
    try{
      String uri="http://"+url+"/api/signup";


      final res = await http.post(
          Uri.parse(uri),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{

        "name":userName,
        "email":email,
        "password":password,
        "user_type":user_type,
        "officeNumber":officeNumber,
        "department":department,
        "block":block,




      }));
      if (res.statusCode == 200) {
        debugPrint("APi is Working");
        return '200';
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to USer Sign-Up. Api');
      }




    }catch(e){
      print("Error:"+e.toString());
    }
return "";
  }

}