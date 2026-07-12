import 'package:flutter/material.dart';

class TiltEffect extends StatefulWidget {
  final Widget child;
  const TiltEffect({Key? key, required this.child}) : super(key: key);

  @override
  State<TiltEffect> createState() => _TiltEffectState();
}

class _TiltEffectState extends State<TiltEffect> {
  double rx = 0.0;
  double ry = 0.0;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() {
        isHovered = false;
        rx = 0.0;
        ry = 0.0;
      }),
      onHover: (details) {
        final renderBox = context.findRenderObject() as RenderBox;
        final size = renderBox.size;
        final position = renderBox.globalToLocal(details.position);
        
        // Normalize coordinates to -1 to 1
        final x = (position.dx / size.width) * 2 - 1;
        final y = (position.dy / size.height) * 2 - 1;
        
        setState(() {
          // Max rotation of 10 degrees (0.17 radians)
          rx = -y * 0.1;
          ry = x * 0.1;
        });
      },
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        tween: Tween<double>(begin: 0, end: isHovered ? 1.0 : 0.0),
        builder: (context, double value, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..rotateX(rx * value)
              ..rotateY(ry * value),
            alignment: Alignment.center,
            child: widget.child,
          );
        },
      ),
    );
  }
}
