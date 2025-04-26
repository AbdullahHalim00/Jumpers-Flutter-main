import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jumper/src/Core/utils/utils.dart';

class PhoneVerifyController {
  static Future<bool?>? verifyPhone(
      {String? phone, Function? onSuccess, bool isRegister = true}) async {
    var _auth = FirebaseAuth.instance;
    Utils.showLoadingDialog();
    _auth.verifyPhoneNumber(
        // phoneNumber: phone!.startsWith("0")?"+2${phone}":"+20${phone}",
        phoneNumber: '+201212648022',
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          onSuccess!();
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            debugPrint('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          debugPrint("code sent");
          // Get.off(()=>PhoneVerficationScreen(
          //   phone: phone,
          //   register: isRegister,
          //   validationCode: verificationId,
          //   onSuccess: (String validationCode, String code) async {
          //     setLoadingDialog();
          //     AuthCredential credential = PhoneAuthProvider.credential(verificationId: validationCode, smsCode: code);
          //     UserCredential result = await _auth.signInWithCredential(credential);
          //     var user = result.user;
          //     Get.back();
          //     if (user != null){
          //       debugPrint("success verfication");
          //       onSuccess!();
          //     }
          //     else {
          //       debugPrint("an error occur");
          //     }
          //   },
          // ));
        },
        codeAutoRetrievalTimeout: (data) {});
  }
}
