import 'package:e_commerce/view/pages/Auth-pages/varify_code.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../controller/main_controller.dart';
import '../view/base/custom_drawer.dart';
import '../view/pages/Auth-pages/forget_pass.dart';
import '../view/pages/Auth-pages/login_screen.dart';
import '../view/pages/Auth-pages/new_pass.dart';
import '../view/pages/Auth-pages/sign_up.dart';
import '../view/pages/mainPages/home_view.dart';
import '../view/pages/mainPages/main_view.dart';
import '../view/pages/product_view/product_view.dart';
import '../view/pages/review/add_review.dart';
import '../view/pages/review/reviews_view.dart';
import '../view/pages/splash/splash_screen.dart';

class Routes{
  static String splashScreen = "/";
  static String loginScreen = "/login_screen";
  static String signUp = "/sign_up";
  static String forgetPass = "/forget_pass";
  static String varifyCode = "/varify_code";
  static String newPass = "/new_pass";
  static String mainView = "/main_view";
  static String productView = "/product_view";
  static String cartView = "/cart_view";
  static String wishlistView = "/wishlist_view";
  static String homeView = "/home_view";
  static String customDrawer = "/custom_drawer";
  static String reviewsView = "/reviews_view";
  static String addReview = "/add_review";


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
  GetPage(name: Routes.mainView, page: ()=>MainView()),
  GetPage(name: Routes.productView, page: ()=>ProductDetailView()),
  GetPage(name: Routes.cartView, page: ()=>CartView()),
  GetPage(name: Routes.wishlistView, page: ()=>WishlistView()),
  GetPage(name: Routes.homeView, page: ()=>HomeView()),
  GetPage(name: Routes.customDrawer, page: ()=> CustomDrawer()),
  GetPage(name: Routes.reviewsView, page: ()=>ReviewsView()),
  GetPage(name: Routes.addReview, page: ()=>AddReview()),

];
