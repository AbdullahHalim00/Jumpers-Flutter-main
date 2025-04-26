part of 'imports_widgets_jumper_onboarding.dart';

class JumperOnBoardingScaffold extends StatelessWidget {
  final Widget child;

  const JumperOnBoardingScaffold({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBars.logo(),
      body: child,
    );
  }
}
