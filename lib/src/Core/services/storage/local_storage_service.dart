// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'storage_constants.dart';
//
//   class LocalStorageService <T>  with StorageKeys {
//
//     T _initialValue() {
//       if(T is String ){
//         return "";
//       }
//       else if (T is int){
//         return 0 ;
//       }
//       else {
//         return false;
//       }
//
//     }
//
//     final GetStorage _box = GetStorage();
//   /// reset initial value
//   void reSetInitialValue (T value){
//     initialValue = value ;
//   }
//
//   /// saves value
//   void save (String key,T value){
//     _box.write(key,value);
//   }
//  /// read value
//   T read (String key){
//    return _box.hasData(key) ?  _box.read(key) :initialValue ;
//   }
//  /// remove value
//   void remove (String key){
//     _box.remove(key);
//   }
//
//   void listen (){}
//
//
//
// }
