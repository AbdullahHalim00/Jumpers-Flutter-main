import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumper/src/Bloc/models/candidate_model.dart';
import 'package:jumper/src/Bloc/models/certificate_model.dart';
import 'package:jumper/src/Core/constants/colors/app_colors.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Core/constants/decorations/app_shapes.dart';
import 'package:jumper/src/Core/constants/strings/assets.dart';
import 'package:jumper/src/Core/services/app_data/app_data.dart';
import 'package:jumper/src/Core/services/photo_view.dart';
import 'package:jumper/src/Ui/cards/employee_details_card.dart';
import 'package:jumper/src/Ui/chips/custom_chip.dart';
import 'package:jumper/src/Ui/list_tiles/certificate_tile.dart';
import 'package:jumper/src/Ui/list_tiles/dotted_info_tile.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

import '../cards/custom_image_network.dart';

class CandidateDetailsBuilder extends StatelessWidget {
  final CandidateModel? employee;

  const CandidateDetailsBuilder({
    Key? key,
    this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // bio
          GeneralDetailsCard(
            isSectionDivider: false,
            label: "bio".tr,
            body: CustomText.subtitle(
              employee?.about ?? "-",
              fontWeight: FW.light,
            ),
          ),
          // personal Info
          GeneralDetailsCard(
            label: "personal_info".tr,
            body: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DottedInfoTile(
                        label: "nationality".tr,
                        data: (employee?.nationality != ""
                            ? employee?.nationality
                            : "-"),
                      ),
                    ),
                    Expanded(
                      child: DottedInfoTile(
                        label: "age".tr,
                        data: (employee?.age != 0
                                ? employee?.age.toString()
                                : "-")! +
                            ("age_is".tr),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DottedInfoTile(
                        label: "gender".tr,
                        data: (employee?.gender != "" ? employee?.gender : "-"),
                      ),
                    ),
                    Expanded(
                      child: DottedInfoTile(
                        label: "city".tr,
                        data: (employee?.city != "" ? employee?.city : "-"),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Icon(
                        Icons.circle,
                        size: 8.r,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: CustomText(
                        '${"address".tr} ${(employee?.address != "" ? employee?.address : "-")}',
                        fontWeight: FW.light,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                DottedInfoTile(
                  label: "distance".tr,
                  data: (employee?.distance != ""
                      ? '${employee?.distance.toString()} Km'
                      : "-"),
                ),
              ],
            ),
          ),
          // gallery Images
          if (employee!.serviceImages.isNotEmpty)
            GeneralDetailsCard(
              label: "employee_gallery".tr,
              body: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: AppPhysics.bouncingPhysics,
                  itemCount: employee?.serviceImages.length,
                  itemBuilder: (context, index) {
                    final image = employee?.serviceImages[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                          onTap: () {
                            Get.dialog(
                              PhotoViewWidget(
                                imageProvider: NetworkImage(image),
                              ),
                            );
                          },
                          onLongPress: () {
                            AppData.applyHapticFeedback();
                            Get.dialog(
                              Dialog(
                                backgroundColor: AppColors.transparent,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: AppShapes.dialogShape,
                                child: Image.network(
                                  image,
                                  fit: BoxFit.cover,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                ),
                              ),
                            );
                          },
                          child: CustomImageNetwork(
                            image: image!,
                            width: 200.w,
                            height: MediaQuery.of(context).size.height * 0.2,
                            fit: BoxFit.cover,
                            radius: 10,
                          )),
                    );
                  },
                ),
              ),
            ),
          // skills
          GeneralDetailsCard(
            label: "skills".tr,
            body: Wrap(
              children: employee!.skills
                  .map((e) => e.title)
                  .toList()
                  .map(
                    (e) => CustomChip(label: e),
                  )
                  .toList(),
            ),
          ),
          // languages
          // GeneralDetailsCard(
          //   label: "languages".tr,
          //   body: Wrap(
          //     children: employee!.languages
          //         .map((e) => e.title)
          //         .toList()
          //         .map(
          //           (e) => CustomChip(label: e),
          //         )
          //         .toList(),
          //   ),
          // ),

          /// certificates section
          // certificates
          if (employee!.certificates.isNotEmpty)
            GeneralDetailsCard(
              label: "certificates".tr,
              isSectionDivider: false,
              body: Column(
                /// replace to =>
                // children:  employee!.certificates
                children: [
                  CertificateModel(
                      id: 1,
                      text: "تصميم تجربة مستخدم",
                      description: "ITI Center ",
                      grade: "جيد جدا",
                      image: ""),
                ]
                    .map(
                      (e) => CertificateTile(
                        text: e.text,
                        image: e.image,
                        defaultSectionImage: Assets.note_2,
                        description: e.description,
                        grade: e.grade,
                      ),
                    )
                    .toList(),
              ),
            ),
          if (employee!.scientificCertificates.isNotEmpty)
            GeneralDetailsCard(
              label: "scientific_certificates".tr,
              isSectionDivider: false,
              body: Column(
                /// replace to =>
                // children:  employee!.scientificCertificates
                children: [
                  CertificateModel(
                    id: 1,
                    text: "قسم الهندسة المدنية - جامعة المنصورة",
                    description: "جيد",
                    grade: "2022-2021",
                    image: "",
                  ),
                ]
                    .map(
                      (e) => CertificateTile(
                        text: e.text,
                        image: e.image,
                        defaultSectionImage: Assets.teacher,
                        description: e.description,
                        grade: e.grade,
                      ),
                    )
                    .toList(),
              ),
            ),
          // experience
          if (employee!.experience.isNotEmpty)
            GeneralDetailsCard(
              label: "experience".tr,
              isSectionDivider: false,
              body: Column(
                /// replace to =>
                // children:  employee!.experience
                children: [
                  CertificateModel(
                    id: 1,
                    text: " مصمم تجربة المستخدم - شركة النور ",
                    description: "ITI Center",
                    grade: "2022-2021",
                    image: "",
                  ),
                  CertificateModel(
                    id: 2,
                    image:
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/600px-Facebook_Logo_%282019%29.png",
                    text: " Facebook- مصمم تجربة المستخدم",
                    description: "ITI Center ",
                    grade: "2022-2021",
                  ),
                ]
                    .map(
                      (e) => CertificateTile(
                        text: e.text,
                        image: e.image,
                        defaultSectionImage: Assets.briefcase,
                        description: e.description,
                        grade: e.grade,
                      ),
                    )
                    .toList(),
              ),
            ),
          // training_courses
          if (employee!.courses.isNotEmpty)
            GeneralDetailsCard(
              label: "training_courses".tr,
              isSectionDivider: false,
              body: Column(
                /// replace to =>
                // children:  employee!.courses
                children: [
                  CertificateModel(
                      id: 1,
                      image:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/600px-Facebook_Logo_%282019%29.png",
                      text: " دورة تصميم تجربة المستخدم- مركز ITI",
                      description: "ساعة - ممتاز",
                      grade: ""),
                ]
                    .map(
                      (e) => CertificateTile(
                        text: e.text,
                        image: e.image,
                        defaultSectionImage: Assets.note_2,
                        description: e.description,
                        grade: e.grade,
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
