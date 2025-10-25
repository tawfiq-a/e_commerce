import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  // Helper function for the menu items
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, size: 24, color: color ?? Colors.black87),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: color ?? Colors.black87,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:[
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 20.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CircleAvatar(
                  radius: 20,

                  backgroundColor: const Color(0xffF5F6FA),

                  child: SvgPicture.asset("assets/icons/menu_rotate.svg"),
                ),
                const SizedBox(height: 20),


                const Row(
                  children: [
                    CircleAvatar(
                      radius: 20,

                      backgroundImage: AssetImage('assets/images/profile.png'),
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Zakaria Rabby',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 0.5),


          _buildDrawerItem(
            icon: Icons.info_outline,
            text: 'Account Information',
            onTap: () {
              Get.toNamed('/user_info');

            },
          ),
          _buildDrawerItem(
            icon: Icons.shopping_bag_outlined, // Replaced with a bag icon for Order
            text: 'Order',
            onTap: () {
              Get.toNamed('/order_view');
            },
          ),
          _buildDrawerItem(
            icon: Icons.credit_card_outlined, // Replaced with an envelope icon
            text: 'My Cards',
            onTap: () {
              Get.toNamed('/payment_screen');
            },
          ),
          _buildDrawerItem(
            icon: Icons.settings_outlined,
            text: 'Settings',
            onTap: () {
              Get.toNamed('/settings_view');

            },
          ),

          const SizedBox(height: 300), // Space before logout

          // 3. Logout Button (Red Text)
          _buildDrawerItem(
            icon: Icons.logout,
            text: 'Logout                 ',
            color: Colors.red.shade400, // Set text and icon color to red
            onTap: () {
              Get.defaultDialog(
                  title: 'Log Out',
                  backgroundColor: Colors.white,
                  titleStyle: TextStyle(color: Colors.red),
                  middleText: 'Are you sure  want to Logout?',

                  actions: [
                    TextButton(onPressed: (){
                      Get.offAllNamed('/login_screen');
                        }, child: const Text("Yes",
                      style: TextStyle(color: Colors.red),)),
                    TextButton(onPressed: (){
                      Get.back();
                    }, child: const Text("No",
                      style: TextStyle(color: Colors.red),)),
                  ]
              );

              // Handle logout logic
            },
          ),
        ],
      ),
    );
  }
}