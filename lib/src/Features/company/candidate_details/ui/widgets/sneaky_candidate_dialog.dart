part of 'imports_widgets_candidate_details.dart';

class SneakyCandidateDialog extends StatelessWidget {
  final CandidateModel candidate;

  const SneakyCandidateDialog({
    Key? key,
    required this.candidate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AlertDialog(
          shape: AppShapes.dialogShape,
          content: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Transform.scale(
                    scale: 0.9,
                    child: SingleChildScrollView(
                      physics: AppPhysics.alwaysScrollablePhysics,
                      child: AnimatedWrapper(
                        styles: WrapAnimationStyles.slide,
                        child: Column(
                          children: [
                            CandidateDetailsHeader(
                              name: candidate.name,
                              userImage: candidate.image,
                              description: candidate.about,
                              showImage: false,
                            ),
                            CandidateDetailsBuilder(
                              employee: candidate,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConditionalBuilder(
            condition: candidate.image != "",
            onBuild: CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColors.circleAvatarDarker,
              backgroundImage: NetworkImage(candidate.image),
            ),
            onFeedBack: CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColors.circleAvatarDarker,
              backgroundImage: const AssetImage(Assets.defaultUser),
            ),
          ),
        ),
      ],
    );
  }
}
