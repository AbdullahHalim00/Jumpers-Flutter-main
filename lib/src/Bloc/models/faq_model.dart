class FAQModel {
  int? id;
  String? question;
  String? answer;

  FAQModel({
    this.id,
    this.question,
    this.answer,
  });

  FAQModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'] ?? '';
    answer = json['answer'] ?? '';
  }
}

class SettingsModel {
  String? phone;
  String? email;

  SettingsModel({
    this.phone,
    this.email,
  });

  SettingsModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'] ?? '';
    email = json['email'] ?? '';
  }
}

class Contract {
  String? contractDate;
  String? textAr;
  String? price;
  String? title;
  FirstPart? firstPart;
  FirstPart? secondPart;

  Contract({
    this.contractDate,
    this.textAr,
    this.price,
    this.firstPart,
    this.title,
    this.secondPart,
  });

  Contract.fromJson(Map<String, dynamic> json) {
    contractDate = json['contract_date'];
    textAr = json['text_ar'];
    price = json['price'].toString();
    title = json["title"].toString();
    firstPart = json['first_part'] != null
        ? FirstPart.fromJson(json['first_part'])
        : null;
    secondPart = json['second_part'] != null
        ? FirstPart.fromJson(json['second_part'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contract_date'] = contractDate;
    data['text_ar'] = textAr;
    data['price'] = price;
    data['title'] = title;
    if (firstPart != null) {
      data['first_part'] = firstPart!.toJson();
    }
    if (secondPart != null) {
      data['second_part'] = secondPart!.toJson();
    }
    return data;
  }

  @override
  toString() => {
        "contractDate": contractDate,
        "textAr": textAr,
        "price": price,
        "title": title,
        "first_part": firstPart,
        "second_part": secondPart
      }.toString();
}

class FirstPart {
  String? name;
  String? email;
  String? phone;

  FirstPart({this.name, this.email, this.phone});

  FirstPart.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }

  @override
  toString() => {
        "name": name,
        "email": email,
        "phone": phone,
      }.toString();
}
