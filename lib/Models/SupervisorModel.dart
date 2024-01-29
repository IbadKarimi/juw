class SupervisorModel{


  int? complaintId;
  String? complaintBy;
  String? title;
  String? status;
  String? createdAt;
  String? resolveAt;
  int? categoryId;
  int? subCategoryId;
  String? description;

  SupervisorModel({this.description,this.complaintId,this.complaintBy,this.title,this.status, this.createdAt,this.resolveAt});

  SupervisorModel.fromJson(Map<String, dynamic> json) {
    complaintId = json['complaint_id'];
    complaintBy = json['complaintBy'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    resolveAt=json['resolved_at'];
    categoryId=json['category_id'];
    subCategoryId=json['sub_categoryId'];
    description=json['description'];
  }


  }


