/// 请求的基类
class BaseModel<T> {
  int statusCode;
  String statusMsg;
  T data;

  BaseModel({this.statusCode, this.statusMsg, this.data});
}
