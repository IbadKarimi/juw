



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurpleAccent.shade100,
      title: Text('JUW SERVICE'),
      actions: [
        Stack(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              margin: EdgeInsets.only(right: 15.w),

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/images/avatars/avatar-1.png"),
                  fit: BoxFit.cover
                ),

                borderRadius: BorderRadius.circular(100.r)

              ),

            ),
            Container(
              width: 10.w,
              height: 10.h,
              margin: EdgeInsets.only(top:25.h,left: 33.w),
              decoration: BoxDecoration(
                  color: Colors.green,


                  borderRadius: BorderRadius.circular(100.r)

              ),
            ),
          ],
        )






      ],// App bar title (optional)
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  void handleClick(int item) {
    switch (item) {
      case 0:  //Get.to(()=>EditProfileView());

      break;
      case 1:
        case 0: // Get.to(()=>ResetPasswordView());
    break;
    }
  }
}
