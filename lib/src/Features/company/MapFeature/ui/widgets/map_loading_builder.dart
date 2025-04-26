part of 'imports_widgets_map_screen.dart';

class MapLoadingBuilder extends StatelessWidget {
  const MapLoadingBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.3,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Assets.map_templete),
              ),
            ),
          ),
        ),
        LoadingBox(loading: Loading.beat()),
      ],
    );
  }
}
