

class ComplaintModel{




  int? staffId;

  String? status;


  ComplaintModel({this.staffId,this.status,});

  ComplaintModel.fromJson(Map<String, dynamic> json) {
    staffId = json['staff_id'];

  status = json['status'];

  }






}