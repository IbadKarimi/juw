class CategoriesModel{


int? categoryId;
int? subCategoryId;
  String? subCategoryName;
  String? categoryName;


  CategoriesModel({this.categoryId,this.subCategoryId,this.subCategoryName,this.categoryName,});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    subCategoryName = json['name'];
    categoryName = json['category_name'];
    categoryId = json['category_id'];
    subCategoryId = json['id'];

  }


}


