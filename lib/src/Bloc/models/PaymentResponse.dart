class PaymentResponse {
  int? status;
  String? msg;
  String? data;

  PaymentResponse({this.status, this.msg, this.data});

  PaymentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['data'] = this.data;
    return data;
  }

  @override
  toString() => {
        'status': status,
        "msg": msg,
        "data": data,
      }.toString();
}
