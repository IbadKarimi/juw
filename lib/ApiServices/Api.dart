import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:juw/Models/SupervisorModel.dart';
import 'package:juw/Models/UserModel.dart';
import 'package:juw/Views/SharedPrefrences/SharedPrefrences.dart';
import 'package:juw/Views/Staff/Profile.dart';
import 'package:juw/Views/Supervisor/SupervisorDashBoard.dart';
import 'package:juw/Views/Technician/TechnicianDashBoard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/CategoriesModel.dart';
import '../Views/Staff/Complaint.dart';
import '../Views/Staff/DashBoard.dart';
import '../Views/Staff/HeadToMain.dart';

String url="localhost";

class ApiServices {

  SharedPreferencesHelper prefs =SharedPreferencesHelper();

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





    }catch(e){
      print("Error:"+e.toString());
    }
    return "200";
  }



  Future<String> updateProfile(int? userId,String password,String department,String block,String officeNumber)async{
    try{
      String uri="http://"+url+"/api/updateProfile";


      final res = await http.post(
          Uri.parse(uri),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{



            "officeNumber":officeNumber,
            "department":department,
            "block":block,
            "password":password,
            "user_id":userId,


          }));



        final SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString("password",password );
        prefs.setString("block", block);
        prefs.setString("department", department);
        prefs.setString("officeNumber", officeNumber);


        if(res.statusCode==200){

        }







    }catch(e){
      print("APi Error:"+e.toString());
    }

    return "200";
  }

  Future<String> assignTechnician(int? userId,int complaintId)async{
    try{
      String uri="http://"+url+"/api/supervisor/assign_technician";


      final res = await http.post(
          Uri.parse(uri),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{



            "user_id":userId,
            "complaint_id":complaintId,



          }));





      if(res.statusCode==200){
        print("Assigned Tecnician Sucessfully");
        return "200";

      }







    }catch(e){
      print("APi Error:"+e.toString());
    }

    return "200";
  }

  Future<String> technicianRequestDateChange(DateTime requestedData,int complaintId)async{
    try{
      String uri="http://"+url+"/api/technician/complaints/request_date_change";

      String formattedTimestamp = requestedData.toUtc().toIso8601String();
      final res = await http.post(
          Uri.parse(uri),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{



            "date":formattedTimestamp,
            "complaint_id":complaintId,



          }));





      if(res.statusCode==200){
        print("Add Dead Line Sucessfully");
        return "200";

      }







    }catch(e){
      print("APi Error:"+e.toString());
    }

    return "200";
  }


  Future<String> AddComplain(int staff_id, int category_id, int sub_categoryId, String title,String roomNo,String description)async{
    try{
      String uri="http://"+url+"/api/complaint";


      final res = await http.post(
          Uri.parse(uri),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{

            "user_id": staff_id,
            "category_id":category_id,
            "sub_categoryId":sub_categoryId,
            "title":title,
            "roomNo":roomNo,
            "description":description,


          }));



      if(res.statusCode==200){

        Get.to(()=>Complaint());

      }







    }catch(e){
      print("APi Error:"+e.toString());
    }
    Get.to(()=>Complaint());
    return "200";
  }


  Future<String> sendMail(String name, String email,String text)async{
    try{
      String uri="http://"+url+"/api/supervisor/sendMessage";


      final res = await http.post(
          Uri.parse(uri),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{

            "name": name,
            "email":email,
            "messageText":text,



          }));



      if(res.statusCode==200){

        Get.to(()=>HeadToMail());

      }







    }catch(e){
      print("APi Error:"+e.toString());
    }
    Get.to(()=>HeadToMail());
    return "200";
  }






  Future<void> loginUser(String email, String password) async {

    String uri = "http://" + url +
        "/api/login"; // Replace with your actual API URL

    try {
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);

        if (responseBody['status'] == 'success') {
          // Login successful, handle the user data
          print('Login successful');
          print(responseBody['data']);

          // Access additional data based on user type
          if (responseBody['data']['user_type'] == 'technician') {


            final SharedPreferences prefs = await SharedPreferences.getInstance();

            prefs.setString("name", responseBody['data']['name'].toString());
            prefs.setString("email", responseBody['data']['email'].toString());
            prefs.setInt("userId", responseBody['data']['user_id']);





            Get.to(()=>TechnicianDashBoard());





            int categoryId = responseBody['data']['category_id'];
            print('Technician Category ID: $categoryId');

          } else if (responseBody['data']['user_type'] == 'supervisor') {
            final SharedPreferences prefs = await SharedPreferences.getInstance();

            prefs.setString("name", responseBody['data']['name'].toString());
            prefs.setString("email", responseBody['data']['email'].toString());






            Get.to(()=>SupervisorDashBoard());



          }
          else if (responseBody['data']['user_type'] == 'staff') {
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            debugPrint("==================="+responseBody['data']['user_id'].toString());
            prefs.setInt("userId", responseBody['data']['user_id']);
            prefs.setString("name", responseBody['data']['name'].toString());
            prefs.setString("email", responseBody['data']['email'].toString());
            prefs.setString("password", responseBody['data']['password'].toString());
            prefs.setString("block", responseBody['data']['block'].toString());
            prefs.setString("department", responseBody['data']['department'].toString());
            prefs.setString("officeNumber", responseBody['data']['officeNumber'].toString());


            Get.to(()=>StaffDashBoard());

            int categoryId = responseBody['data']['category_id'];
            print('Supervisor Category ID: $categoryId');

          }
        } else {
          // Handle login failure
          print('Login failed: ${responseBody['data']}');
        }
      } else {
        // Handle other HTTP status codes
        print('HTTP Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } catch (error) {
      // Handle network errors or other exceptions
      print('Error: $error');
    }
  }
  Future<List<CategoriesModel>> getCategory() async {
    //create function in list type becoze we get data and set in _product array

    String uri="http://"+url+"/api/categories";
    var response = await http.get(
        Uri.parse(uri));

    List<CategoriesModel> userData = []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      //Mistake Identify Here

      for (var jsonData in prJson) {
        userData.add(
            CategoriesModel.fromJson(jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working of About !");
    }
    return userData;
  }

  Future<List<CategoriesModel>> getSubCategory() async {
    //create function in list type becoze we get data and set in _product array

    String uri="http://"+url+"/api/subCategories";
    var response = await http.get(
        Uri.parse(uri));

    List<CategoriesModel> userData = []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      //Mistake Identify Here

      for (var jsonData in prJson) {
        userData.add(
            CategoriesModel.fromJson(jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working of About !");
    }
    return userData;
  }
  Future<List<UserModel>> getTechnician() async {
    //create function in list type becoze we get data and set in _product array

    String uri="http://"+url+"/api/supervisor/get_technicians";
    var response = await http.post(
        Uri.parse(uri));

    List<UserModel> userData = []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      //Mistake Identify Here

      for (var jsonData in prJson) {
        userData.add(
            UserModel.fromJson(jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working of About !");
    }
    return userData;
  }

  Future<List<UserModel>> getComplain() async {
    //create function in list type becoze we get data and set in _product array

    String uri="http://"+url+"/api/supervisor/get_complaints";
    var response = await http.post(
        Uri.parse(uri));

    List<UserModel> userData = []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      //Mistake Identify Here

      for (var jsonData in prJson) {
        userData.add(
            UserModel.fromJson(jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working of About !");
    }
    return userData;
  }


  Future<List<SupervisorModel>> getSupervisorComplaint() async {
    //create function in list type becoze we get data and set in _product array
    String uri="http://"+url+"/api/supervisor/get_complaints";

    var response = await http.post(
        Uri.parse(uri));
    List<SupervisorModel> userData = []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      //Mistake Identify Here

      for (var jsonData in prJson) {
        userData.add(
            SupervisorModel.fromJson(jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working of About !");
    }
    return userData;
  }

  Future<String?> deleteTechnician(int id, ) async {

    String uri = "http://" + url +
        "/api/supervisor/delete_technician"; // Replace with your actual API URL

    try {
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'user_id': id, }),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);

        if (responseBody['status'] == 'success') {

          print("Tecnician deleted Sucessfully");

          return "200";

        }
        else{
          return "100";
        }
      }
    } catch (error) {
      // Handle network errors or other exceptions
      print('Error: $error');
    }
    return "";
  }

  Future<String?> deleteComplaint(int complaintId, ) async {

    String uri = "http://" + url +
        "/api/deleteComplaint"; // Replace with your actual API URL

    try {
      final response = await http.post(
        Uri.parse(uri),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'complaint_id': complaintId, }),
      );

      if (response.statusCode == 200) {
        print("Complaint deleted");
        Map<String, dynamic> responseBody = json.decode(response.body);

        if (responseBody['status'] == 'success') {

          print("Tecnician deleted Sucessfully");

          return "200";

        }
        else{
          return "100";
        }
      }
    } catch (error) {
      // Handle network errors or other exceptions
      print('Error: $error');
    }
    return "200";
  }


  Future<List<UserModel>> getStaff() async {
    //create function in list type becoze we get data and set in _product array

    String uri="http://"+url+"/api/supervisor/get_staff";
    var response = await http.post(
        Uri.parse(uri));

    List<UserModel> userData = []; //the scope of the array is Inside the function
    if (response.statusCode == 200) {
      debugPrint("Api is Working !");
      var prJson = json.decode(response.body);
      //Mistake Identify Here

      for (var jsonData in prJson) {
        userData.add(
            UserModel.fromJson(jsonData)); //set json data in productlist
      }
    } else {
      debugPrint("Api is not Working of About !");
    }
    return userData;
  }





}