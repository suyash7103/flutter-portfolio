import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomCursor extends StatefulWidget {
  final Widget child;
  const CustomCursor({Key? key, required this.child}) : super(key: key);

  @override
  State<CustomCursor> createState() => _CustomCursorState();
}

class _CustomCursorState extends State<CustomCursor> {
  Offset position = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return widget.child;
        }
        return MouseRegion(
          onHover: (PointerHoverEvent event) {
            setState(() {
          position = event.position;
        });
      },
      cursor: SystemMouseCursors.none,
      child: Stack(
        children: [
          widget.child,
          Positioned(
            left: position.dx - 15,
            top: position.dy - 15,
            child: IgnorePointer(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF38BDF8), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF38BDF8).withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ]
                ),
              ),
            ),
          ),
          Positioned(
            left: position.dx - 3,
            top: position.dy - 3,
            child: IgnorePointer(
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF38BDF8),
                ),
              ),
            ),
          )
        ],
      ),
    );
      },
    );
  }
}
