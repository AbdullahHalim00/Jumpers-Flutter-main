part of 'imports_widgets_company_onboarding.dart';

class CompanyOnBoardingScaffold extends StatelessWidget {
  final Widget child;

  const CompanyOnBoardingScaffold({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBars.logo(),
      body: child,
    );
  }
}
