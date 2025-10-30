
class ApiConstant{

  static String baseUrl="https://e-bazar-latest.onrender.com";

  static String login="/auth/login/";
  static String signup="/auth/signup/";
  static String forgetpassword="/auth/forgetpassword/";
  static String otp(String userName)=>"/auth/vefiry_for_forget/$userName/";
  static String reset_password="/auth/reset_password/";
  static String productDataEndPoint = "/shoping/products/?";


}