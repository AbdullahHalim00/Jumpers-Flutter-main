part of 'routes_imports.dart';

/// Add screens here this way :
abstract class AppRoutes {
  static final List<GetPage> getPages = [
    //Splash Screen
    GetPage(
      name: NamedRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),

    /// company
    // help center
    GetPage(
      name: NamedRoutes.companyCenterScreen,
      transition: Transition.cupertinoDialog,
      page: () => const CompanyHelpCenterScreen(),
    ),
    //terms
    GetPage(
      name: NamedRoutes.companyTermsScreen,
      transition: Transition.cupertinoDialog,
      page: () => const TermsScreen(),
    ),
    //privacy
    GetPage(
      name: NamedRoutes.companyPrivacyScreen,
      transition: Transition.cupertinoDialog,
      page: () => const PrivacyScreen(),
    ),
  ];
}
