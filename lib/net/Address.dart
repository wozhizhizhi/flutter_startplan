/// 接口的地址
class Address{
  static String BASE_URL = "https://www.shinyread.cn:11443/shinyTeacherServer";
  static String BASE_URL_NOPORT = "http://www.shinyread.cn:/shinyTeacherServer";

  /* 登陆接口 */
  static String URL_LOGIN = BASE_URL+"/app/act/login";

  /* 获取兴趣推荐图书*/
  static String URL_INTEREST_LIBRARY_LISTS = BASE_URL+"/app/bk/interestBook";

  /* 首页 */
  static String URL_HOMEPAGE = BASE_URL+"/app/un/homePage";


  static String URL_HEAD_UPLOAD =   BASE_URL+"/app/system/uploadPicture";

}
