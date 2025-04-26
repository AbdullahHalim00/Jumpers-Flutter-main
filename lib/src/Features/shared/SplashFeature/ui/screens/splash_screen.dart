part of 'splash_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.9),
          // image: DecorationImage(
          //   image: AssetImage(
          //     Assets.splashLogo,
          //   ),
          //   fit: BoxFit.fill,
          // ),
        ),
        child: AnimatedContainer(
          duration: _splashDuration,
          child: Center(
            child: GetBuilder<SplashController>(
                init: SplashController(),
                builder: (_) {
                  return Image.asset(
                    'assets/lottie/logo.GIF',
                    height: 300.h,
                    width: 300.w,
                  );
                }),
          ),
        ),
      ),
    );
  }
}
