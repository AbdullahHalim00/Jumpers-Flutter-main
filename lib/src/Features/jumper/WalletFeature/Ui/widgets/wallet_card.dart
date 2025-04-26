part of 'widgets_wallet_imports.dart';

class WalletCard extends StatelessWidget {
  final Widget child;

  const WalletCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedWrapper(
      // styles: WrapAnimationStyles.flip,
      durationStyle: WrapDurationStyle.slow,
      styles: WrapAnimationStyles.slide,
      offsetStyle: WrapOffsetStyle.horizontal,
      child: AnimatedContainer(
        key: key,
        padding: EdgeInsets.all(24.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffA86547),
          borderRadius: BorderRadius.circular(8.r),
          image: const DecorationImage(
            image: AssetImage(Assets.wallet_shadow),
            fit: BoxFit.cover,
          ),
        ),
        duration: AppDurations.mainTransition,
        child: child,
      ),
    );
  }
}
