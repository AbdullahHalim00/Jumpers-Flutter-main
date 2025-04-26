import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Bloc/models/faq_model.dart';
import 'question_builder.dart';

class AppQuestionBuilder extends StatelessWidget {
  final List<FAQModel> faqList;

  const AppQuestionBuilder({
    Key? key,
    required this.faqList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: faqList.length,
          itemBuilder: (context, index) {
            final data = faqList[index];
            return QuestionBuilder(
              question: data.question ?? "",
              answer: data.answer ?? "",
            );
          }),
    );
  }
}
