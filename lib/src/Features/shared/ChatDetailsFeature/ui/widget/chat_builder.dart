part of 'imports_widgets_chat_details.dart';

class ChatBuilder extends StatefulWidget {
  final String chatType;
  final bool enabled;
  const ChatBuilder({
    Key? key,
    required this.chatType,
    required this.enabled
  }) : super(key: key);

  @override
  State<ChatBuilder> createState() => _ChatBuilderState();
}

class _ChatBuilderState extends State<ChatBuilder> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom + 100;
    final messagesController = Get.find<FetchMessagesController>();
    return GetBuilder<FetchMessagesController>(
      init: messagesController,
      builder: (_) {
        return KeyboardVisibilityBuilder(
          child: Column(
            children: [
              Expanded(
                child: DataStatusBuilder(
                  status: _.dataState,
                  onLoadingBuild: const LoadingBox(),
                  onRedirectCallback: () =>
                      _.loadMessagesFromApi(widget.chatType),
                  onDoneBuild: _.dataState is! DataSuccess
                      ? const SizedBox.shrink()
                      : AnimatedWrapper(
                          offsetStyle: WrapOffsetStyle.horizontal,
                          child: Scrollbar(
                            controller: _.scrollController,
                            interactive: true,
                            child: ListView.separated(
                              reverse: true,
                              physics: AppPhysics.alwaysScrollablePhysics,
                              controller: _.scrollController,
                              itemCount: _.dataState.data!.length,
                              itemBuilder: (context, index) {
                                Messages message =
                                    _.dataState.data!.reversed.toList()[index];
                                printDM(
                                  "HUNTERS ${_.dataState.data!.length}",
                                );

                                return ChatBubble(
                                  message: message,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 24.h,
                                );
                              },
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                            ),
                          ),
                        ),
                ),
              ),
              ChatSendListTile(
                enabled: widget.enabled
              ),
            ],
          ),
          builder: (context, child, isKeyboardVisible) => Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: isKeyboardVisible
                      ? screenHeight - (keyboardHeight + 270)
                      : screenHeight,
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// class TypingIndicator extends StatefulWidget {
//     const TypingIndicator({
//      key,
//     this.showIndicator = false,
//     this.bubbleColor = const Color(0xFF646b7f),
//     this.flashingCircleDarkColor = const Color(0xFF333333),
//     this.flashingCircleBrightColor = const Color(0xFFaec1dd),
//   });
//
//   final bool showIndicator;
//   final Color bubbleColor;
//   final Color flashingCircleDarkColor;
//   final Color flashingCircleBrightColor;
//
//   @override
//   State<TypingIndicator> createState() => _TypingIndicatorState();
// }
//
//
// class _TypingIndicatorState extends State<TypingIndicator>
//     with TickerProviderStateMixin {
//   late AnimationController _appearanceController;
//
//   late Animation<double> _indicatorSpaceAnimation;
//
//   late Animation<double> _smallBubbleAnimation;
//   late Animation<double> _mediumBubbleAnimation;
//   late Animation<double> _largeBubbleAnimation;
//
//   late AnimationController _repeatingController;
//   final List<Interval> _dotIntervals = const [
//     Interval(0.25, 0.8),
//     Interval(0.35, 0.9),
//     Interval(0.45, 1.0),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//
//     // other initializations...
//
//     _repeatingController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1500),
//     );
//
//     if (widget.showIndicator) {
//       _showIndicator();
//     }
//   }
//
//   @override
//   void dispose() {
//     _appearanceController.dispose();
//     _repeatingController.dispose();
//     super.dispose();
//   }
//
//   void _showIndicator() {
//     _appearanceController
//       ..duration = const Duration(milliseconds: 750)
//       ..forward();
//     _repeatingController.repeat(); // <-- Add this
//   }
//
//   void _hideIndicator() {
//     _appearanceController
//       ..duration = const Duration(milliseconds: 150)
//       ..reverse();
//     _repeatingController.stop(); // <-- Add this
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _indicatorSpaceAnimation,
//       builder: (context, child) {
//         return SizedBox(
//           height: _indicatorSpaceAnimation.value,
//           child: child,
//         );
//       },
//       child: Stack(
//         children: [
//           AnimatedBubble(
//             animation: _smallBubbleAnimation,
//             left: 8,
//             bottom: 8,
//             bubble: CircleBubble(
//               size: 8,
//               bubbleColor: widget.bubbleColor,
//             ),
//           ),
//           AnimatedBubble(
//             animation: _mediumBubbleAnimation,
//             left: 10,
//             bottom: 10,
//             bubble: CircleBubble(
//               size: 16,
//               bubbleColor: widget.bubbleColor,
//             ),
//           ),
//           AnimatedBubble(
//             animation: _largeBubbleAnimation,
//             left: 12,
//             bottom: 12,
//             bubble: StatusBubble(
//               repeatingController: _repeatingController, // <-- Add this
//               dotIntervals: _dotIntervals,
//               flashingCircleDarkColor: widget.flashingCircleDarkColor,
//               flashingCircleBrightColor: widget.flashingCircleBrightColor,
//               bubbleColor: widget.bubbleColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class StatusBubble extends StatelessWidget {
//   const StatusBubble({
//     key,
//     required this.repeatingController,
//     required this.dotIntervals,
//     required this.flashingCircleBrightColor,
//     required this.flashingCircleDarkColor,
//     required this.bubbleColor,
//   });
//
//   final AnimationController repeatingController;
//   final List<Interval> dotIntervals;
//   final Color flashingCircleDarkColor;
//   final Color flashingCircleBrightColor;
//   final Color bubbleColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 85,
//       height: 44,
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(27),
//         color: bubbleColor,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FlashingCircle(
//             index: 0,
//             repeatingController: repeatingController,
//             dotIntervals: dotIntervals,
//             flashingCircleDarkColor: flashingCircleDarkColor,
//             flashingCircleBrightColor: flashingCircleBrightColor,
//           ),
//           FlashingCircle(
//             index: 1,
//             repeatingController: repeatingController,
//             dotIntervals: dotIntervals,
//             flashingCircleDarkColor: flashingCircleDarkColor,
//             flashingCircleBrightColor: flashingCircleBrightColor,
//           ),
//           FlashingCircle(
//             index: 2,
//             repeatingController: repeatingController,
//             dotIntervals: dotIntervals,
//             flashingCircleDarkColor: flashingCircleDarkColor,
//             flashingCircleBrightColor: flashingCircleBrightColor,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class FlashingCircle extends StatelessWidget {
//   const FlashingCircle({
//     key,
//     required this.index,
//     required this.repeatingController,
//     required this.dotIntervals,
//     required this.flashingCircleBrightColor,
//     required this.flashingCircleDarkColor,
//   });
//
//   final int index;
//   final AnimationController repeatingController;
//   final List<Interval> dotIntervals;
//   final Color flashingCircleDarkColor;
//   final Color flashingCircleBrightColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: repeatingController,
//       builder: (context, child) {
//         final circleFlashPercent = dotIntervals[index].transform(
//           repeatingController.value,
//         );
//         final circleColorPercent = sin(pi * circleFlashPercent);
//
//         return Container(
//           width: 12,
//           height: 12,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Color.lerp(
//               flashingCircleDarkColor,
//               flashingCircleBrightColor,
//               circleColorPercent,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
