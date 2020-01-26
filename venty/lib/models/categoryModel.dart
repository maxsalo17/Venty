class Category{
  String uid;
  String categoryName;

  Category({this.uid,this.categoryName});

  Category.fromMap(Map<String, dynamic> map){
    this.uid = map["categoryId"];
    this.categoryName = map["categoryName"];
  }

  Map<String, dynamic> toMap(){
    return{
      "categoryId" : uid,
      "categoryName" : categoryName
    };
  }
}