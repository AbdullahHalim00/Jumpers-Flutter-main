import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

/// Used in [Utils] called like : Utils().validate();
abstract class AppValidator {
  /// Used in [Validator] method in [TextField] Widget to validate data based on the validatorType

  static String? validate(String? value,
      {ValidatorType type = ValidatorType.none}) {
    bool isNumericNum(String string) {
      final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
      return numericRegex.hasMatch(string);
    }

    String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp phoneRegExp = RegExp(phonePattern);

    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp emailRegex = RegExp(emailPattern);

    switch (type) {
      case ValidatorType.none:
        if (value!.isEmpty) {
          return "validate_empty_field".tr;
        } else {
          return null;
        }

      case ValidatorType.phone:
        if (value!.isEmpty) {
          //عفوا لم يتم ادخال رقم هاتف صحيح
          return "validate_phone".tr;
        } else if (value.startsWith("0")) {
          return " يجب ألا يبدأ رقم الجوال ب0 ";
        } else if (value.length < 9) {
          return "validate_phone_is_real".tr;
          //! حاول مرة أخرى برقم هاتف صحيح
        } else {
          return null;

          if (!phoneRegExp.hasMatch(value)) {
            return "validate_phone_is_real".tr;
            //! حاول مرة أخرى برقم هاتف صحيح
          } else {
            return "validate_phone".tr;
          } //عفوا لم يتم ادخال رقم هاتف صحيح
        }

      case ValidatorType.password:
        if (value!.isEmpty) {
          return "validate_password".tr;
          //عفوا لم يتم ادخال كلمة مرور صحيحة
        } else {
          if (value.length < 6) {
            return "validate_password_length".tr;
            //  "يجب ألا تقل كلمة المرور عن 6 أحرف أو أرقام"
          } else {
            return null;
          }
        }

      case ValidatorType.confirmPassword:
        if (value!.isEmpty) {
          return "validate_confirm_password".tr;
          //عفوا كلمة المرور غير متطابقة
        } else {
          return null;
        }

      case ValidatorType.userName:
        if (value!.isEmpty) {
          return "validate_username".tr;
          //عفوا لم يتم ادخال اسم مستخدم صحيح
        } else {
          if (value.length < 3) {
            return "validate_username_length".tr;
          } else {
            return null;
          }
        }

      case ValidatorType.email:
        if (value!.isEmpty) {
          return "validate_email".tr;
          //عفوا لم يتم ادخال بريد مستخدم صحيح
        } else {
          if (!emailRegex.hasMatch(value)) {
            return 'validate_email_2'.tr;
            //من فضلك أدخل بريد إلكتروني صحيح
          } else if (!value.contains('@')) {
            return "validate_email".tr;
          } else {
            return null;
          }
        }

      case ValidatorType.message:
        if (value!.isEmpty) {
          return "validate_message".tr;
          //عفوا لم يتم ادخال رسالة صحيحة
        } else {
          return null;
        }

      case ValidatorType.code:
        if (value!.isEmpty) {
          return "validate_promo".tr;
          //عفوا لم يتم ادخال كود صحيح
        } else {
          return null;
        }

      case ValidatorType.numeric:
        if (value!.isEmpty) {
          return "validate_empty_field".tr;
          //عفوا لم يتم ادخال كود صحيح
        } else {
          if (!isNumericNum(value)) {
            // must be a num
            return "validate_numeric".tr;
          } else {
            return null;
          }
        }
      case ValidatorType.bankAccount:
        if (value!.isEmpty) {
          return "validate_empty_field".tr;
          //عفوا لم يتم ادخال كود صحيح
        } else if (!isNumericNum(value)) {
          return "validate_numeric".tr;
        } else {
          return null;
        }
      // else if (isNumericNum(value)||value.contains("*")) {
      //   if (value.length < 14) {
      //     return "validate_bank_account_length".tr;
      //   }
      //   else {
      //     return null;
      //   }
      // }
      // else {
      //   return "validate_numeric".tr;
      // }

      case ValidatorType.iBan:{
        value = value?.replaceAll(' ', '') ?? '';
        if (value.isEmpty) {
          return "validate_empty_field".tr;
        } else if(value.length != 24){
          return "validate_iBan_length".tr;
        }else if((value[0]+value[1]).toUpperCase() != 'SA'){
          return 'validate_iBan_chr'.tr;
        }else if(!value.substring(2).isNum){
          return 'validate_iBan_num'.tr;
        }else {
          return null;
        }}
      case ValidatorType.dateOfBirth:
        if (value!.isEmpty) {
          return "validate_date_of_birth".tr;
          //عفوا لم يتم ادخال تاريخ ميلاد
        } else {
          return null;
        }

      case ValidatorType.age:
        if (value!.isEmpty) {
          return "validate_age".tr;
          //من فضلك أدخل عمر صحيح
        }
        // else if (age < 16) {
        //   return "validate_age_limit".tr;
        // }
        //يجب أن لا يقل العمر عن 16 سنة
        else {
          return null;
        }

      case ValidatorType.language:
        if (value!.isEmpty) {
          return "validate_language".tr;
          // يجب على الأقل أن تختار لغة واحدة للمتابعة
        } else {
          return null;
        }

      case ValidatorType.city:
        if (value!.isEmpty) {
          return "validate_city".tr;
          // عفوا لم يتم اختيار مدينه
        } else {
          return null;
        }

      case ValidatorType.address:
        if (value!.isEmpty) {
          return "validate_address".tr;
          // عفوا لم يتم ادخال عنوان
        } else {
          return null;
        }

      case ValidatorType.offeredService:
        if (value!.isEmpty) {
          return "validate_offered_service".tr;
          // عفوا لم يتم اختيار الخدمة المقدمة
        } else {
          return null;
        }

      case ValidatorType.skills:
        if (value!.isEmpty) {
          return "validate_skills".tr;
          // عفوا لم يتم اختيار المهارات
        } else {
          return null;
        }

      case ValidatorType.lang:
        if (value!.isEmpty) {
          return "validate_lang".tr;
          // عفوا لم يتم اختيار اللغات
        } else {
          return null;
        }

      case ValidatorType.adminAdjective:
        if (value!.isEmpty) {
          return "validate_admin_adjective".tr;
          // عفوا لم يتم صفه المسؤول
        } else {
          return null;
        }
    }
  }
}

enum ValidatorType {
  none,
  phone,
  password,
  confirmPassword,
  userName,
  email,
  message,
  code,
  age,
  language,
  numeric,
  bankAccount,
  dateOfBirth,
  city,
  address,
  offeredService,
  skills,
  lang,
  adminAdjective,
  iBan
}
