import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class OnScreenAnimator extends StatefulWidget {
  final Widget Function(bool isVisible) builder;
  
  const OnScreenAnimator({Key? key, required this.builder}) : super(key: key);

  @override
  State<OnScreenAnimator> createState() => _OnScreenAnimatorState();
}

class _OnScreenAnimatorState extends State<OnScreenAnimator> {
  bool _isVisible = false;
  bool _hasAnimated = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_hasAnimated) {
          if (mounted) {
            setState(() {
              _isVisible = true;
              _hasAnimated = true; // only animate once
            });
          }
        }
      },
      child: widget.builder(_isVisible),
    );
  }
}
