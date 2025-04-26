part of 'imports_widgets_candidate_details.dart';

class CandidateDetailsHeader extends StatelessWidget {
  final String? name;
  final String? description;
  final String? userImage;
  final bool showImage;
  final num? rate_review;

  final String cv;

  const CandidateDetailsHeader({
    Key? key,
    this.userImage,
    this.name,
    this.description,
    this.rate_review,
    this.cv = "",
    this.showImage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// user
        if (showImage)
          ConditionalBuilder(
            condition: userImage != "",
            onBuild: CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColors.circleAvatarDarker,
              backgroundImage: NetworkImage("$userImage"),
            ),
            onFeedBack: CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColors.circleAvatarDarker,
              backgroundImage: const AssetImage(Assets.defaultUser),
            ),
          ),

        11.0.ESH(),
        CustomText(
          name ?? "",
          fontWeight: FW.semiBold,
        ),
        11.0.ESH(),
        RatingBar(
          itemSize: 14,
          initialRating: rate_review!.toDouble(),
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,

          ratingWidget: RatingWidget(
            full: Image.asset(
              'assets/images/rate_full.png',
              width: 14.w,
              height: 14.h,
            ),
            half: Image.asset(
              'assets/images/rate_full.png',
              width: 14.w,
              height: 14.h,
            ),
            empty: Image.asset(
              'assets/images/rate_empty.png',
              width: 14.w,
              height: 14.h,
            ),
          ),
          // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        14.0.ESH(),
        CustomText.subtitle(
          description ?? "",
          fontWeight: FW.regular,
          fontSize: 12,
        ),
        12.0.ESH(),
        DownloadCVButton(
          onPressed: () {
            DownloaderService.downloadAndLoad(url: cv);
          },
          isEnabled: cv != "",
        ),
      ],
    );
  }
}
