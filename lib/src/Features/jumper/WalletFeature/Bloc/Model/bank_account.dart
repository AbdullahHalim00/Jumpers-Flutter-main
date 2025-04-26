import 'package:jumper/src/Core/utils/utils.dart';

class BankAccount {
  late int id;
  late String image;
  late String title;
  late int isBank;

  // bool ? isActive;

  BankAccount({
    required this.id,
    required this.image,
    required this.title,
    required this.isBank,
    // this.isActive=false,
  });

  @override
  String toString() {
    return 'Account{' +
        ' id: $id,' +
        ' image: $image,' +
        ' title: $title,' +
        ' bank: $isBank,' +
        '}';
  }

  BankAccount.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    printDM("id is => $id");
    image = map['image'] ?? "";
    printDM("image is => $image");
    title = map['title'] ?? "";
    printDM("title is => $title");
    isBank = map['bank'] ?? 0;
    // isActive= map['is_active']!=null ? (map['is_active']==1?true:false): false;
    printDM("isBank is => $isBank");
  }
}
