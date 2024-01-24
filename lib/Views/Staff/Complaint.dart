

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juw/ApiServices/Api.dart';
import 'package:juw/widgets/CustomAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/UserModel.dart';
import '../../widgets/CustomDrawer.dart';
class Department {
  final String name;
  final int value;

  Department(this.name, this.value);
}
class Complaint extends StatefulWidget{
  @override
  State< Complaint  > createState() => _Complaint  ();
}

class _Complaint   extends State< Complaint >{
  @override
  //The instance to be injected
  bool _isLoading = false;
  int? categoryId;
  int ?subCategoryId;
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController roomController=TextEditingController();
  ApiServices apiService=ApiServices();
  String _selectedDepartment = "Select Category";
  final selectedDepartmentList = [

    "Select Category",
    "CCTV Camera",
    'Networking Service',
    'Plumbering',
    'Cleaning',
    'AC Service',
    "Electrician",




  ];


  String _selectedBlock = "Select Category";
  final selectedBlockList = [
        "Select Category",
        'CCTV systeminstall/repiar and troubleshooting',
        'Camera DVR/NVR maintenance',
        'System upgrades & expension',
        'CCTV Camera setup',
        'Commercial CCTV Solutions',
        'Remote monitoring Solutions',
        'Wireless CCTV installation',
        'Wifi connection',
        'Network Monitoring',
        'Internet Connectivity',
        'Leak detection & repair',
        'Drain Cleaning',
        'Unclogging service',
        'Faucet toilet repair and replacement',
        'water heater installation and repair and more',
        'Dusting',
        'Sweeping',
        'Chemical Aplication',
        'Floor Scrubbing',
        'Deep Cleaning',
        'Disinfecting Moping',
        'Split AC installation',
        'Chiller//Floor Standing AC installation',
        'Inverter AC Gas Refilling',
        'Re-Inverter AC Gas Refilling',
        'Inverter AC PCB Card Repairing Gas Refilling',
        'Non-Inverter AC PCB Card Repairing Gas Refilling',
        'Master Service & General Service',
        'Coil Repair & Replacement',
        'Circuit Breaker replacement',
        'Lighting installations',
        'Switch & Sockets repair',
        'Switch board repair',
        'Fan installation & repair',
        'Selectors installation',
        'LCD Dismounting',
        'LCD installation',
        'Intercom installation',
        'Tube Lights installation',
        'Holders installation',
        'Electrical geyser repair & Installation',



  ];

  List<UserModel> getComplaintData=[];
  int? userId;


  void initState(){
   onLoad();
    apiService.getComplain().then((value){
      setState(() {
        getComplaintData.addAll(value);
      });

      for(int i=0;i<getComplaintData.length;i++){
        print("name is ==========="+getComplaintData[i].status.toString());
      }
    });


    super.initState();
  }
  onLoad()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      userId=prefs.getInt("userId");

      print("id is integer is =+++++++++++++++"+userId.toString());

    });


  }




  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,

                  color: Colors.grey.shade100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [


                      Container(
                          margin: EdgeInsets.only(left:15.w,top:60.h),
                          width: MediaQuery.of(context).size.width-30,

                          color: Colors.white,

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,


                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 30.h, left: 24.w, bottom: 10.h),
                                      child:  Text(
                                        "Complaints",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: (){
                                        showDialog(context: context, builder: (context){
                                          return


                                            SizedBox(
                                              width: 300.h,

                                              child: AlertDialog(
                                                backgroundColor: Colors.white,
                                                shape:  RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                ),
                                                content: SingleChildScrollView(
                                                  scrollDirection: Axis.vertical,

                                                  child: Container(
                                                    width: 350.w,
                                                    height: 500.h,

                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,

                                                      children: <Widget>[
                                                        Container(
                                                          width: 300.w,
                                                          height: 60.h,

                                                          child: Padding(
                                                            padding: EdgeInsets.only(left: 0, top: 20),
                                                            child: Text(
                                                              "Add/Save",
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(),
                                                        //---------------TextFields------------//
                                                        Center(
                                                            child: SizedBox(
                                                                width: 300.w,
                                                                height: 45.h,
                                                                child: TextFormField(
                                                                  style: TextStyle(color: Colors.black),

                                                                  controller: titleController,
                                                                  decoration: InputDecoration(label: Text("Title") ,

                                                                    border: OutlineInputBorder(),

                                                                  ),))),

                                                        //--Drop down

                                                        Container(
                                                            width: 300.w,

                                                            margin:  EdgeInsets.only(top: 10.h,left:0.w),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(color: Colors.black38, width: 1),
                                                                borderRadius: BorderRadius.circular(5.r),
                                                                boxShadow: <BoxShadow>[]),
                                                            child: DropdownButtonHideUnderline(
                                                                child: DropdownButtonFormField(
                                                                  value:_selectedDepartment,
                                                                  items: selectedDepartmentList.map((e) {
                                                                    return DropdownMenuItem<String>(
                                                                        child:
                                                                        Padding(
                                                                          padding:  EdgeInsets.only(left:10.0),
                                                                          child: Text(e,style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontSize: 12.sp,
                                                                          ),),
                                                                        ), value: e);
                                                                  }).toList(),
                                                                  onChanged: (newValue) {
                                                                    setState(() {
                                                                      _selectedDepartment = newValue as String;

                                                                      if(_selectedDepartment=="CCTV Camera"){
                                                                        categoryId=1;
                                                                      }
                                                                      if(_selectedDepartment=='Networking Service'){
                                                                      categoryId=2;
                                                                      }
                                                                      if(_selectedDepartment=='Plumbering'){
                                                                      categoryId=3;
                                                                      }
                                                                      if(_selectedDepartment=='Cleaning'){
                                                                      categoryId=4;
                                                                      }
                                                                      if(_selectedDepartment=='AC Service'){
                                                                      categoryId=5;
                                                                      }
                                                                      if(_selectedDepartment=="Electrician"){
                                                                        categoryId=6;
                                                                      }

                                                                    });
                                                                    print(categoryId);
                                                                  },
                                                                  isExpanded: true,
                                                                ))),

                                                        SizedBox(width: 10.w,),
                                                        Container(
                                                            width: 300.w,

                                                            margin:  EdgeInsets.only(top: 10.h,left:0.w),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(color: Colors.black38, width: 1),
                                                                borderRadius: BorderRadius.circular(5.r),
                                                                boxShadow: <BoxShadow>[]),
                                                            child: DropdownButtonHideUnderline(
                                                                child: DropdownButtonFormField(
                                                                  value: _selectedBlock,
                                                                  items: selectedBlockList.map((e) {
                                                                    return DropdownMenuItem<String>(
                                                                        child:
                                                                        Padding(
                                                                          padding:  EdgeInsets.only(left:10.w),
                                                                          child: Text(e,style: TextStyle(color: Colors.black,fontSize: 14.sp),),
                                                                        ), value: e);
                                                                  }).toList(),
                                                                  onChanged: (newValue) {
                                                                    setState(() {
                                                                      _selectedBlock = newValue as String;

                                                                      if(_selectedBlock== 'CCTV systeminstall/repiar and troubleshooting'){
                                                                        subCategoryId=1;
                                                                      }

                                                                      if(_selectedBlock=='Camera DVR/NVR maintenance'){
                                                                        subCategoryId=2;
                                                                      }
                                                                      if(_selectedBlock=='System upgrades & expension'){
                                                                        subCategoryId=3;
                                                                      }
                                                                      if(_selectedBlock=='Commercial CCTV Solutions'){
                                                                        subCategoryId=4;
                                                                      }
                                                                      if(_selectedBlock== 'Remote monitoring Solutions'){
                                                                        subCategoryId=5;
                                                                      }
                                                                      if(_selectedBlock=='Wireless CCTV installation'){
                                                                        subCategoryId=6;
                                                                      }
                                                                      if(_selectedBlock=='Wifi connection'){
                                                                        subCategoryId=7;
                                                                      }
                                                                      if(_selectedBlock==  'Network Monitoring'){
                                                                        subCategoryId=8;
                                                                      }
                                                                      if(_selectedBlock== 'Internet Connectivity'){
                                                                        subCategoryId=9;
                                                                      }
                                                                      if(_selectedBlock== 'Leak detection & repair'){
                                                                        subCategoryId=10;
                                                                      }
                                                                      if(_selectedBlock=='Drain Cleaning'){
                                                                        subCategoryId=11;
                                                                      }if(_selectedBlock== 'Unclogging service'){
                                                                        subCategoryId=12;
                                                                      }if(_selectedBlock=='Faucet toilet repair and replacement'){
                                                                        subCategoryId=13;
                                                                      }if(_selectedBlock== 'water heater installation and repair and more'){
                                                                        subCategoryId=14;
                                                                      }if(_selectedBlock==  'Dusting'){
                                                                        subCategoryId=15;
                                                                      }if(_selectedBlock==  'Sweeping'){
                                                                        subCategoryId=16;
                                                                      }if(_selectedBlock== 'Chemical Aplication'){
                                                                        subCategoryId=17;
                                                                      }
                                                                      if(_selectedBlock=='Floor Scrubbing'){
                                                                        subCategoryId=18;
                                                                      }

                                                                      if(_selectedBlock=='Deep Cleaning'){
                                                                      subCategoryId=19;
                                                                      }
                                                                      if(_selectedBlock=='Disinfecting Moping'){
                                                                      subCategoryId=20;
                                                                      }
                                                                      if(_selectedBlock== 'Split AC installation'){
                                                                      subCategoryId=21;
                                                                      }
                                                                      if(_selectedBlock== 'Chiller//Floor Standing AC installation'){
                                                                      subCategoryId=22;
                                                                      } if(_selectedBlock== 'Inverter AC Gas Refilling'){
                                                                      subCategoryId=23;
                                                                      } if(_selectedBlock=='Re-Inverter AC Gas Refilling'){
                                                                      subCategoryId=24;
                                                                      }
                                                                      if(_selectedBlock== 'Inverter AC PCB Card Repairing Gas Refilling'){
                                                                      subCategoryId=25;
                                                                      } if(_selectedBlock== 'Non-Inverter AC PCB Card Repairing Gas Refilling'){
                                                                      subCategoryId=26;
                                                                      }
                                                                      if(_selectedBlock=='Master Service & General Service'){
                                                                      subCategoryId=27;

                                                                      } if(_selectedBlock==  'Coil Repair & Replacement'){
                                                                      subCategoryId=28;
                                                                      }
                                                                      if(_selectedBlock== 'Circuit Breaker replacement'){
                                                                      subCategoryId=29;
                                                                      }
                                                                      if(_selectedBlock== 'Lighting installations'){
                                                                      subCategoryId=30;
                                                                      } if(_selectedBlock==   'Switch & Sockets repair'){
                                                                      subCategoryId=31;
                                                                      } if(_selectedBlock==   'Switch board repair'){
                                                                      subCategoryId=32;
                                                                      }
                                                                      if(_selectedBlock=='Fan installation & repair'){
                                                                      subCategoryId=33;
                                                                      }
                                                                      if(_selectedBlock== 'Selectors installation'){
                                                                      subCategoryId=34;
                                                                      }


                                                                      if(_selectedBlock==   'LCD Dismounting'){
                                                                      subCategoryId=35;
                                                                      }

                                                                      if(_selectedBlock==   'LCD installation'){
                                                                      subCategoryId=36;
                                                                      }

                                                                      if(_selectedBlock==   'Intercom installation'){
                                                                      subCategoryId=37;
                                                                      }

                                                                      if(_selectedBlock== 'Tube Lights installation'){
                                                                      subCategoryId=38;
                                                                      }

                                                                      if(_selectedBlock==   'Holders installation'){
                                                                      subCategoryId=39;
                                                                      }

                                                                      if(_selectedBlock== 'Electrical geyser repair & Installation'){
                                                                      subCategoryId=40;
                                                                      }


















                                                                    });

                                                                    print("Sub category Id"+subCategoryId.toString());                                                            },
                                                                  isExpanded: true,
                                                                ))),
                                                        SizedBox(height: 10.h,),
                                                        SizedBox(
                                                            width: 300.w,
                                                            height: 45.h,
                                                            child: TextFormField(
                                                              style: TextStyle(color: Colors.black),

                                                              controller: roomController,
                                                              decoration: InputDecoration(label: Text("Room No") ,

                                                                border: OutlineInputBorder(),

                                                              ),)),
                                                        SizedBox(height: 10.h,),
                                                        Container(
                                                          width: 300.w,
                                                          height: 80.h,
                                                          child: TextFormField(
                                                            controller: descriptionController,
                                                            maxLines: 4, // Adjust the number of lines as needed
                                                            decoration: InputDecoration(
                                                              hintText: 'Description',
                                                              border: OutlineInputBorder(),
                                                            ),
                                                          ),
                                                        ),

                                                        Padding(
                                                          padding:  EdgeInsets.only(left:120.w,top: 10.h),
                                                          child: Row(children: [

                                                            GestureDetector(
                                                              onTap:(){

                                                                Navigator.pop(context);

                                                              },


                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: 0, top: 10),
                                                                child: Text(
                                                                  "Close",
                                                                  style: TextStyle(
                                                                    color: Colors.pink.shade400,
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            SizedBox(width: 10.w,),

                                                            GestureDetector(
                                                                onTap:()async{

                                                                  var response=await apiService.AddComplain(userId!, categoryId!, subCategoryId!, titleController.text,roomController.text , descriptionController.text);
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                                                    return      Complaint();
                                                                  }));
                                                                  if(response=="200"){
                               ;                                                              }

                                                                },


                                                                child: Padding(
                                                                  padding: EdgeInsets.only(left: 0, top: 10),
                                                                  child: Text(
                                                                    "Save",
                                                                    style: TextStyle(
                                                                      color: Colors.lightGreen.shade400,
                                                                      fontSize: 18,
                                                                      fontWeight: FontWeight.w600,
                                                                    ),
                                                                  ),
                                                                )),


                                                          ],),
                                                        )


                                                        // Add your other widgets here
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );


                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 30.h, right: 10.w, bottom: 10.h),
                                        child:  Text(
                                          "ADD NEW ",
                                          style: TextStyle(
                                            color: Colors.deepPurpleAccent.shade200,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //--------1st Column
                                for(int i=0;i<getComplaintData.length;i++)
                                  if(getComplaintData[i].staffId==userId)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [



                                          Padding(
                                            padding: EdgeInsets.only(top: 30.h, left: 24.w, ),
                                            child:  Text(
                                              "ID",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                            child:  Text(
                                              "TITLE",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                            child:  Text(
                                              "TECHNICIAN",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),


                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                            child:  Text(
                                              "STATUS",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),


                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                            child:  Text(
                                              "CREATED AT",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                            child:  Text(
                                              "RESOLVE AT",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h, left: 24.w,bottom: 40.h ),
                                            child:  Text(
                                              "ACTION",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),





                                        ],),



                                      Container(
                                        margin: EdgeInsets.only(top:30.h,left: 50.w),
                                        width: 1,
                                        height: 220.h,// Adjust the width to control the line thickness
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 20.w,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [



                                          Padding(
                                            padding: EdgeInsets.only(top: 30.h, left: 5.w, ),
                                            child:  Text(
                                              getComplaintData[i].complaintId.toString(),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h, left: 5.w, ),
                                            child:  Text(
                                              getComplaintData[i].title.toString(),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h, left: 5.w, ),
                                            child:  Text(
                                              "Technician",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),


                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h, left: 5.w, ),
                                            child:  Text(
                                              getComplaintData[i].status.toString(),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),


                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h, left: 5.w, ),
                                            child:  Text(
                                              getComplaintData[i].createdAT.toString(),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h, left: 5.w, ),
                                            child:  Text(
                                              getComplaintData[i].resolvedAT.toString(),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),


                                          Row(children: [
                                            SizedBox(width: 10.w,),
                                            IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye,color: Colors.amber,)),
                                            IconButton(onPressed: ()async{
                                              String? response= await apiService.deleteComplaint(getComplaintData[i].complaintId!);
                                              if(response=="200"){
                                                Navigator.push(context, MaterialPageRoute(builder: (contect){
                                                  return Complaint();
                                                }));
                                              }
                                            }, icon: Icon(Icons.delete,color: Colors.red,))

                                          ],)





                                        ],),
                                    ],
                                  )















                              ])),



                    ],),





                ),

                //---------------------Bottom theme


              ],
            )
        )
    );


  }}