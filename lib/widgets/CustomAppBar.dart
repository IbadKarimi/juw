






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade100,
      title: Text('JUW SERVICE'),
      actions: [
        /*  IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.amber,)),

        IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt_sharp,color: Colors.amber,)),

        IconButton(onPressed: (){}, icon: Icon(Icons.person,color: Colors.amber,)),*/






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
