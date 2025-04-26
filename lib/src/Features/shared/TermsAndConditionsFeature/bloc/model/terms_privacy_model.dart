class TermsPrivacyModel {
  int? id;
  String? text;

  TermsPrivacyModel({this.id, this.text});

  TermsPrivacyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;

    text = json['text'] ?? "";
  }
}
