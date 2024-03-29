


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:juw/ApiServices/Api.dart';
import 'package:juw/widgets/CustomAppBar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../Models/UserModel.dart';
import '../../widgets/Constatant.dart';
import '../../widgets/CustomDrawer.dart';



class StaffDashBoard extends StatefulWidget{

  @override
  State<StaffDashBoard > createState() => _StaffDashBoard ();
}

class _StaffDashBoard  extends State<StaffDashBoard >{
  @override
  //The instance to be injected
  bool _isLoading = false;

  final _formKey=GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  List<UserModel> getComplaintData=[];
  List<Color> bar=[
    Colors.deepPurpleAccent,
    Colors.green,
  ];
  ApiServices apiService=ApiServices();
  void initState(){


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

  List<_SalesData> data = [
    _SalesData('Jan', 95),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),

  ];

  Widget build(BuildContext context) {
    return Scaffold(

        drawer: CustomDrawer(),
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:   Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey.shade100,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      margin: EdgeInsets.only(left:5.w),
                      width: MediaQuery.of(context).size.width-10,

                      color: Colors.white,

                      child:

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, right: 220.w, bottom: 10.h),
                            child:  Center(
                              child: Text(
                                "Complaints",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),

                          //-------------------

                          Row( // main -----row
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width:10.w),
                              //----first box
                              Column(children: [
                                Container(
                                  width: 60.w,
                                  height: 60.h,
                                  margin: EdgeInsets.only(left:5.w,top:5.h),

                                  decoration: BoxDecoration(
                                      color:purpleColor,
                                      borderRadius: BorderRadius.circular(20.r)
                                  ),
                                  child: Icon(Icons.trending_up_sharp,color: Colors.white,),
                                ),
                                Column(

                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [


                                    Padding(
                                      padding: EdgeInsets.only(top: 5.h, left: 0.w, bottom:5.h),
                                      child:  Center(
                                        child: Text(
                                          "Total",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(top: 0.h, left: 0.w, bottom: 0.h),
                                      child:  Text(
                                        "10",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),


                                  ],)

                              ],),
                              SizedBox(width:10.w),

                              //----2nd box eng here
                              Column(children: [
                                Container(
                                  width: 60.w,
                                  height: 60.h,
                                  margin: EdgeInsets.only(left:15.w,top:5.h),

                                  decoration: BoxDecoration(
                                      color:Colors.green,
                                      borderRadius: BorderRadius.circular(20.r)
                                  ),
                                  child: Icon(Icons.person_3_outlined,color: Colors.white,),
                                ),
                                Column(

                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [


                                    Padding(
                                      padding: EdgeInsets.only(top: 5.h, left: 15.w, bottom:5.h),
                                      child:  Center(
                                        child: Text(
                                          "Completed",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(top: 0.h, left: 5.w, bottom: 0.h),
                                      child:  Center(
                                        child: Text(
                                          "10",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 28.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),


                                  ],)

                              ],),
                              SizedBox(width:10.w),

                              //----3nd box eng here
                              Column(children: [
                                Container(
                                  width: 60.w,
                                  height: 60.h,
                                  margin: EdgeInsets.only(left:15.w,top:5.h),

                                  decoration: BoxDecoration(
                                      color:Colors.orange,
                                      borderRadius: BorderRadius.circular(20.r)
                                  ),
                                  child: Icon(Icons.screenshot_monitor,color: Colors.white,),
                                ),
                                Column(

                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    Padding(
                                      padding: EdgeInsets.only(top: 5.h, left: 15.w, bottom:5.h),
                                      child:  Center(
                                        child: Text(
                                          "Pending",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(top: 0.h, left: 15.w, bottom: 0.h),
                                      child:  Text(
                                        "10",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),


                                  ],)



                              ],),


                              //4th box

                              Column(children: [
                                Container(
                                  width: 60.w,
                                  height: 60.h,
                                  margin: EdgeInsets.only(left:15.w,top:5.h),

                                  decoration: BoxDecoration(
                                      color:Colors.lightBlueAccent,
                                      borderRadius: BorderRadius.circular(20.r)
                                  ),
                                  child: Icon(Icons.monetization_on_outlined,color: Colors.white,),
                                ),
                                Column(

                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [


                                    Padding(
                                      padding: EdgeInsets.only(top: 5.h, left: 15.w, bottom:0.h),
                                      child:  Center(
                                        child: Text(
                                          "In progress",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(top: 5.h, left: 15.w, bottom: 0.h),
                                      child:  Center(
                                        child: Text(
                                          "10",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 28.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),


                                  ],)



                              ],),

                              //-----------------boxes end here


                            ],
                          ),

                          //-------------4th

                          SizedBox(height: 10.h,)


                        ],),
                    ),


                    SizedBox(height: 50.h,),

//chart
                    Container(
                      color: Colors.white,
                      child: SfCartesianChart(
                          isTransposed: true,
                          primaryXAxis: CategoryAxis(),
                          // Chart title

                          // Enable legend
                          legend: Legend(isVisible: true),
                          // Enable tooltip
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <CartesianSeries<_SalesData, String>>[
                            BarSeries<_SalesData, String>(
                                dataSource: data,
                                xValueMapper: (_SalesData sales, _) => sales.year,
                                yValueMapper: (_SalesData sales, _) => sales.sales,
                                name: 'Overview',
                                // Enable data label
                                dataLabelSettings: DataLabelSettings(isVisible: true),


                            // Set different colors for each bar

                            )]),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        //Initialize the spark charts widget
                        child: SfSparkLineChart.custom(
                          //Enable the trackball
                          trackball: SparkChartTrackball(
                              activationMode: SparkChartActivationMode.tap),
                          //Enable marker
                          marker: SparkChartMarker(
                              displayMode: SparkChartMarkerDisplayMode.all),
                          //Enable data label

                        ),
                      ),
                    )


                  ],
                )


            )
        ) );
  }}





class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
