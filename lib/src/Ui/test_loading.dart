import 'package:flutter/material.dart';
import 'package:jumper/src/Core/constants/decorations/app_physics.dart';
import 'package:jumper/src/Ui/loading/loading.dart';
import 'package:jumper/src/Ui/spaces_and_dividers/custom_divider.dart';
import 'package:jumper/src/Ui/text/custom_text.dart';

// . .
class TestLoadersScreen extends StatelessWidget {
  const TestLoadersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText("Test Loaders"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: AppPhysics.alwaysScrollablePhysics,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: XDivider.normal(),
              ),
              const CustomText("SpinKit"),
              _TestLabelTile(
                "Pulse",
                Loading.pulse(),
              ),
              _TestLabelTile(
                "fadingCircle",
                Loading.fadingCircle(),
              ),
              _TestLabelTile(
                "hourGlass",
                Loading.hourGlass(),
              ),
              _TestLabelTile(
                "pouringHourGlass",
                Loading.pouringHourGlass(),
              ),
              _TestLabelTile(
                "wanderingCubes",
                Loading.wanderingCubes(),
              ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: XDivider.normal(),
              ),
              const CustomText("Loading Animation"),
              //
              _TestLabelTile(
                "beat",
                Loading.beat(),
              ),
              _TestLabelTile(
                "discreteCircle",
                Loading.discreteCircle(),
              ),
              _TestLabelTile(
                "fourRotatingDots",
                Loading.fourRotatingDots(),
              ),
              _TestLabelTile(
                "hexagonDots",
                Loading.hexagonDots(),
              ),
              _TestLabelTile(
                "inkDrop",
                Loading.inkDrop(),
              ),
              _TestLabelTile(
                "stretchedDots",
                Loading.stretchedDots(),
              ),
              _TestLabelTile(
                "staggeredDotsWave",
                Loading.staggeredDotsWave(),
              ),
              _TestLabelTile(
                "twoRotatingArc",
                Loading.twoRotatingArc(),
              ),
              _TestLabelTile(
                "threeRotatingDots",
                Loading.threeRotatingDots(),
              ),
              _TestLabelTile(
                "waveDots",
                Loading.waveDots(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TestLabelTile extends StatelessWidget {
  final String label;

  final Widget child;

  const _TestLabelTile(this.label, this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              CustomText(
                label,
              ),
              const Spacer(),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
