class SupervisorModel{


  int? complaintId;
  String? complaintBy;
  String? title;
  String? status;
  String? createdAt;
  String? resolveAt;

  SupervisorModel({this.complaintId,this.complaintBy,this.title,this.status, this.createdAt,this.resolveAt});

  SupervisorModel.fromJson(Map<String, dynamic> json) {
    complaintId = json['complaint_id'];
    complaintBy = json['complaintBy'];
    title = json['title'];
    status = json['status'];
    createdAt = json['created_at'];
    resolveAt=json['resolved_at'];
  }


  }


