class UserModel {
  int? id;
  int ? technicianId;
  int? staffId;
  int? categoryId;
  int? subCategoryId;
  String? email;
  String? password;
  String? name;
  String? description;
  String ? department;
  String ? block;
  String ? officeNumber;
  String ?status;
  int ? complaintId;
  String ?title;
  String? createdAT;
  String? resolvedAT;


  UserModel({this.technicianId,this.categoryId,this.subCategoryId,this.staffId,this.title,this.complaintId,this.status,this.id,this.name,this.password,this.description, this.email,this.block,this.department,this.officeNumber});

  UserModel.fromJson(Map<String, dynamic> json) {

    technicianId = json['technician_id'];
    id = json['user_id'];
    email = json['email'];
    password = json['password'];
    description = json['description'];
    name = json['name'];
    block = json['block'];
    department = json['department'];
    officeNumber = json['officeNumber'];
    status = json['status'];
    complaintId = json['complaint_id'];
    title = json['title'];
    createdAT=json['created_at'];
    resolvedAT=json['resolved_at'];
    staffId=json['staff_id'];
    categoryId=json['category_id'];
    subCategoryId=json['sub_categoryId'];

  }


}