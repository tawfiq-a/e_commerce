
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../view/base/custom_drawer.dart';

import '../view/screens/Auth-pages/forget_pass.dart';
import '../view/screens/Auth-pages/login_screen.dart';
import '../view/screens/Auth-pages/new_pass.dart';
import '../view/screens/Auth-pages/sign_up.dart';
import '../view/screens/Auth-pages/varify_code.dart';
import '../view/screens/Cart_view/cart_view.dart';
import '../view/screens/address/address_view.dart';
import '../view/screens/mainPages/home_view.dart';
import '../view/screens/mainPages/main_view.dart';
import '../view/screens/mainPages/wish_list.dart';
import '../view/screens/order/order_confirm.dart';
import '../view/screens/order/order_view.dart';
import '../view/screens/payment/add_card_view.dart';
import '../view/screens/payment/payment_screen.dart';
import '../view/screens/product_view/product_view.dart';
import '../view/screens/profile/edit_profile.dart';
import '../view/screens/profile/user_info.dart';
import '../view/screens/review/add_review.dart';
import '../view/screens/review/reviews_view.dart';
import '../view/screens/settings/Privacy_policy.dart';
import '../view/screens/settings/about_us.dart';
import '../view/screens/settings/settings_view.dart';
import '../view/screens/settings/termsOfServices.dart';
import '../view/screens/splash/splash_screen.dart';

class Routes{
  static String splashScreen = "/";
  static String loginScreen = "/login_screen";
  static String signUp = "/sign_up";
  static String forgetPass = "/forget_pass";
  static String varifyCode = "/varify_code";
  static String newPass = "/new_pass";
  static String mainView = "/main_view";
  static String productView = "/product_view";
  static String homeView = "/home_view";
  static String customDrawer = "/custom_drawer";
  static String reviewsView = "/reviews_view";
  static String addReview = "/add_review";
  static String cartView = "/cart_view";
  static String addressView = "/address_view";
  static String wishListView = "/wish_list_view";
  static String paymentScreen = "/payment_screen";
  static String addCardView = "/add_card_view";
  static String orderConfirm = "/order_confirm";
  static String orderView = "/order_view";
  static String userInfo = "/user_info";
  static String editProfile = "/edit_profile";
  static String settingsView = "/settings_view";
  static String termsOfService = "/terms_of_service";
  static String privacyPolicy = "/privacy_policy";
  static String aboutUs = "/about_us";





}
// Map<String,WidgetBuilder> screens={
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
  GetPage(name: Routes.homeView, page: ()=>HomeView()),
  GetPage(name: Routes.customDrawer, page: ()=> CustomDrawer()),
  GetPage(name: Routes.reviewsView, page: ()=>ReviewsView()),
  GetPage(name: Routes.addReview, page: ()=>AddReview()),
  GetPage(name: Routes.cartView, page: ()=>CartView()),
  GetPage(name: Routes.addressView, page: ()=>AddressView()),
  GetPage(name: Routes.wishListView, page: ()=>WishlistView()),
  GetPage(name: Routes.paymentScreen, page: ()=>PaymentScreen()),
  GetPage(name: Routes.addCardView, page: ()=>AddCardView()),
  GetPage(name: Routes.orderConfirm, page: ()=>OrderConfirm()),
  GetPage(name: Routes.orderView, page: ()=>OrderView()),
  GetPage(name: Routes.userInfo, page: ()=>UserInfo()),
  GetPage(name: Routes.editProfile, page: ()=> EditProfile()),
  GetPage(name: Routes.settingsView, page: ()=>SettingsView()),
  GetPage(name: Routes.termsOfService, page: ()=>Termsofservices()),
  GetPage(name: Routes.privacyPolicy, page: ()=>PrivacyPolicy()),
  GetPage(name: Routes.aboutUs, page: ()=>AboutUs()),




];
