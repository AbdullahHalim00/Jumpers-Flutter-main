import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Core/resources/data_state.dart';
import 'package:jumper/src/Core/services/network/request_status.dart';
import 'package:jumper/src/Core/utils/utils.dart';
import 'package:jumper/src/Features/shared/AgreementFeature/bloc/controller/fetch_contract_terms_controller.dart';
import 'package:jumper/src/Ui/dialogs/agreement_dialog.dart';
import 'package:jumper/src/Ui/loading/loading_box.dart';
import 'package:jumper/src/core/utils/extensions.dart';

class BuildAgreementDialog extends StatelessWidget {
  final VoidCallback? onAccept;

  BuildAgreementDialog({Key? key, this.onAccept}) : super(key: key);
  final FetchContractTermsController _fetchContractTermsController =
      Get.put(FetchContractTermsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FetchContractTermsController>(
        init: _fetchContractTermsController,
        builder: (_) {
          printDM("DATA ${_.dataState.runtimeType} ");

          return DataStatusBuilder(
            status: _.dataState,
            onDoneBuild: _.dataState is! DataSuccess
                ? 0.ESH()
                : AgreementDialog(
                    text: "agreement_text".tr,
                    agreementLabel: "agree_on_contract".tr,
                    description: "${_.dataState.data!.text} ",
                    isAgreed: _.isTermsAgreed,
                    toggleAgreement: _.toggleAgreement,
                    onAccept: onAccept,
                  ),
            onLoadingBuild: const LoadingBox(),
          );
        });
  }
}
