part of 'imports_widgets_service_details.dart';

class ServiceDetailsJobInfoBuilder extends StatelessWidget {
  final JumperJob job;

  const ServiceDetailsJobInfoBuilder(this.job, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AppPhysics.alwaysScrollablePhysics,
      child: ServiceJobDetailsItem(
        service: job,
      ),
    );
  }
}
