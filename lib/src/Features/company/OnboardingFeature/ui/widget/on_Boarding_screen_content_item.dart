part of 'imports_widgets_company_onboarding.dart';

class OnBoardingScreenContentItem extends StatelessWidget {
  final String image;

  final String title;

  final String body;

  const OnBoardingScreenContentItem({
    Key? key,
    required this.image,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: 334.w,
          height: 264.h,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.subtitle(
                title,
                fontSize: 16,
              ),
              YSpace.titan,
              CustomText(
                body,
                fontSize: 20,
                isBold: true,
                // fontWeight: FW.LIGHT,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
