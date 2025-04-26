import 'package:flutter/material.dart';

import '../../../../../Bloc/models/company_job_model.dart';
import '../../../../shared/ContactUsScreen/ui/widgets/contact_us_scaffold.dart';
import 'imports_job_details_screen.dart';

class FavCanditatesScreen extends StatelessWidget {
  final CompanyJobModel? job;

  FavCanditatesScreen({this.job});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FavouriteScaffold(
      body: Center(
        child: FaveCandidatesWidget(
          jobID: job!.id,
          job: job!,
        ),
      ),
    );
  }
}
