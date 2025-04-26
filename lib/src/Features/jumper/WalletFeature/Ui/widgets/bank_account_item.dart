part of 'widgets_wallet_imports.dart';

class BankAccountItem extends StatelessWidget {
  final BankAccount account;
  final bool isSelected;

  final VoidCallback onTap;

  const BankAccountItem({
    Key? key,
    required this.account,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankAccountsController>(builder: (logic) {
      return InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: AppDurations.mainTransition,
          padding: EdgeInsetsDirectional.only(
            start: 16.w,
            end: 0.w,
            top: 14.h,
            bottom: 20.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: (isSelected) ? AppColors.primary : AppColors.greyOverlay,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(
              4.0.r,
            ),
          ),
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.topLeft,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(end: 20.0.w, top: 6.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageNetwork(
                      url: account.image,
                      width: 40.h,
                      height: 40.h,
                    ),
                    16.ESW(),
                    CustomText(
                      account.title,
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FW.medium,
                    ),
                  ],
                ),
              ),
              if ((isSelected))
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 2.0.w),
                  child: Icon(
                    Icons.verified,
                    color: AppColors.primary,
                    size: 20.8.r,
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
