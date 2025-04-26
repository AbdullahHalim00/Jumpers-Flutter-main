class ContactResponse {
  int? status;
  List<Contacts>? contacts;
  int? total;
  int? lastPage;

  ContactResponse({this.status, this.contacts, this.total, this.lastPage});

  ContactResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(new Contacts.fromJson(v));
      });
    }
    total = json['total'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    if (contacts != null) {
      data['contacts'] = contacts!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['last_page'] = lastPage;
    return data;
  }
}

class Contacts {
  int? id;
  bool jobEnded = false;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? maxCreatedAt;

  Contacts(
      {this.id,
      required this.jobEnded,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.maxCreatedAt});

  Contacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobEnded = json['job_ended'] ?? false;
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    maxCreatedAt = json['max_created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_ended'] = jobEnded;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['max_created_at'] = maxCreatedAt;
    return data;
  }
}
