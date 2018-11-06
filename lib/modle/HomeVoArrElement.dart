class HomeVoArrElement {
  int listType;
  List<ListVoArr> listVoArr;

  HomeVoArrElement({
    this.listType,
    this.listVoArr,
  });

  factory HomeVoArrElement.fromJson(Map<String, dynamic> json) => new HomeVoArrElement(
    listType: json["listType"],
    listVoArr: new List<ListVoArr>.from(json["listVoArr"].map((x) => ListVoArr.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listType": listType,
    "listVoArr": new List<dynamic>.from(listVoArr.map((x) => x.toJson())),
  };
}

class ListVoArr {
  dynamic coverUrl;
  dynamic htmlUrl;
  String subTitle;
  String title;
  int unCommentNo;
  int unFinishNo;

  ListVoArr({
    this.coverUrl,
    this.htmlUrl,
    this.subTitle,
    this.title,
    this.unCommentNo,
    this.unFinishNo,
  });

  factory ListVoArr.fromJson(Map<String, dynamic> json) => new ListVoArr(
    coverUrl: json["coverUrl"],
    htmlUrl: json["htmlUrl"],
    subTitle: json["subTitle"],
    title: json["title"],
    unCommentNo: json["unCommentNo"] == null ? null : json["unCommentNo"],
    unFinishNo: json["unFinishNo"] == null ? null : json["unFinishNo"],
  );

  Map<String, dynamic> toJson() => {
    "coverUrl": coverUrl,
    "htmlUrl": htmlUrl,
    "subTitle": subTitle,
    "title": title,
    "unCommentNo": unCommentNo == null ? null : unCommentNo,
    "unFinishNo": unFinishNo == null ? null : unFinishNo,
  };
}