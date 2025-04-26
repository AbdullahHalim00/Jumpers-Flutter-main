import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/candidate_model.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Features/company/candidate_details/ui/widgets/imports_widgets_candidate_details.dart';
import 'package:jumper/src/Ui/animation/animated_wrapper.dart';
import 'package:jumper/src/Ui/appbars/default_appbar.dart';
import 'package:jumper/src/Ui/builders/candidate_details_builder.dart';
import 'package:jumper/src/Ui/scaffold/default_scaffold.dart';

class CandidateDetailsScreen extends StatelessWidget {
  final CandidateModel candidate;

  const CandidateDetailsScreen(
    this.candidate, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBars.basic(
        title: "candidate_details".tr,
        isBack: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        physics: AppPhysics.alwaysScrollablePhysics,
        child: AnimatedWrapper(
          styles: WrapAnimationStyles.slide,
          child: Column(
            children: [
              CandidateDetailsHeader(
                name: candidate.name,
                rate_review: candidate.rate_review,
                userImage: candidate.image,
                description: candidate.about,
                cv: candidate.cv,
                showImage: candidate.image != "",
              ),
              CandidateDetailsBuilder(
                employee: candidate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
