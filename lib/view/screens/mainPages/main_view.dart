import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/main_controller.dart';
import '../../base/custom_drawer.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());


    const double iconSize = 28.0;

    return Scaffold(
      drawer: CustomDrawer(),
      key: scaffoldKey,
      drawerScrimColor: Color(0xff1D1E20).withOpacity(0.40),


      body: Obx(
            () => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.screens,
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,


          selectedItemColor: Colors.purple.shade400,
          unselectedItemColor: Colors.grey.shade400,
          showSelectedLabels: true,
          showUnselectedLabels: false,

          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTabIndex,

          items: <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                height: iconSize,
                width: iconSize,
                color: Colors.grey.shade400,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                height: iconSize,
                width: iconSize,
                color: Colors.purple.shade400,
              ),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/fav.svg',
                height: iconSize,
                width: iconSize,
                color: Colors.grey.shade400,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/fav.svg',
                height: iconSize,
                width: iconSize,
                color: Colors.purple.shade400,
              ),
              label: 'Wishlist',
            ),
            // Cart Tab (Index 2)
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/cart.svg',
                height: iconSize,
                width: iconSize,
                color: Colors.grey.shade400,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/cart.svg',
                height: iconSize,
                width: iconSize,
                color: Colors.purple.shade400,
              ),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
  // _customDrawer() {
  //   return Drawer(
  //     child: ListView(
  //       padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
  //       children: [
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             CircleAvatar(
  //               radius: 20,
  //               backgroundColor: Color(0xffF5F6FA),
  //               child: SvgPicture.asset("assets/icons/menu.svg"),
  //             ),
  //             SizedBox(height: 30),
  //             Row(
  //               children: [
  //                 CircleAvatar(
  //                   radius: 10,
  //                   backgroundColor: Color(0xffF5F6FA),
  //                   child: Image.asset("assets/images/profile.png",color: Colors.purpleAccent,),
  //                 ),
  //                 SizedBox(width: 20,),
  //                 Expanded(child: Text("Zakaria")),
  //               ],
  //             ),
  //
  //             ListTile(
  //               leading: Icon(Icons.person),
  //               title: Text("Account INFO"),
  //             )
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}