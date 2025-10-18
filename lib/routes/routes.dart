import 'package:e_commerce/view/pages/Auth-pages/varify_code.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../view/pages/Auth-pages/forget_pass.dart';
import '../view/pages/Auth-pages/login_screen.dart';
import '../view/pages/Auth-pages/new_pass.dart';
import '../view/pages/Auth-pages/sign_up.dart';
import '../view/pages/splash/splash_screen.dart';

class Routes{
  static String splashScreen = "/";
  static String loginScreen = "/login_screen";
  static String signUp = "/sign_up";
  static String forgetPass = "/forget_pass";
  static String varifyCode = "/varify_code";
  static String newPass = "/new_pass";

}
// Map<String,WidgetBuilder> pages={
//   Routes.splashScreen:(_)=>SplashScreen(),
//   Routes.loginScreen:(_)=>LoginScreen(),
//   Routes.signUp:(_)=>SignUp(),
//
// };
List<GetPage> pages=[
  GetPage(name: Routes.splashScreen, page: ()=>SplashScreen()),
  GetPage(name: Routes.loginScreen, page: ()=>LoginScreen()),
  GetPage(name: Routes.signUp, page: ()=>SignUp()),
  GetPage(name: Routes.forgetPass, page: ()=>ForgetPass()),
  GetPage(name: Routes.varifyCode, page: ()=>VarifyCode()),
  GetPage(name: Routes.newPass, page: ()=>NewPass()),
];
