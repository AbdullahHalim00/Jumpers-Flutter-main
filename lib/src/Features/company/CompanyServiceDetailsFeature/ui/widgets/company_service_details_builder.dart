part of 'imports_widget_company_service_details.dart';

class CompanyServiceDetailsBuilder extends StatelessWidget {
  final CompanyJobModel service;

  const CompanyServiceDetailsBuilder({Key? key, required this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CompanyServiceDetailsCard(
      service: service,
    );
  }
}
