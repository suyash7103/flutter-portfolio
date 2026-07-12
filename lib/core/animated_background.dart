import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final int _particleCount = 15;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_particles.isEmpty) {
      final size = MediaQuery.of(context).size;
      final random = Random();
      for (int i = 0; i < _particleCount; i++) {
        _particles.add(Particle(
          x: random.nextDouble() * size.width,
          y: random.nextDouble() * size.height,
          radius: random.nextDouble() * 100 + 50,
          dx: (random.nextDouble() - 0.5) * 1.5,
          dy: (random.nextDouble() - 0.5) * 1.5,
          color: random.nextBool()
              ? const Color(0xFF38BDF8).withOpacity(0.15)
              : const Color(0xFF818CF8).withOpacity(0.15),
        ));
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        _updateParticles(MediaQuery.of(context).size);
        return CustomPaint(
          painter: BackgroundPainter(particles: _particles),
          size: Size.infinite,
        );
      },
    );
  }

  void _updateParticles(Size size) {
    for (var particle in _particles) {
      particle.x += particle.dx;
      particle.y += particle.dy;

      if (particle.x < -particle.radius || particle.x > size.width + particle.radius) {
        particle.dx *= -1;
      }
      if (particle.y < -particle.radius || particle.y > size.height + particle.radius) {
        particle.dy *= -1;
      }
    }
  }
}

class Particle {
  double x, y, dx, dy, radius;
  Color color;

  Particle({
    required this.x,
    required this.y,
    required this.dx,
    required this.dy,
    required this.radius,
    required this.color,
  });
}

class BackgroundPainter extends CustomPainter {
  final List<Particle> particles;

  BackgroundPainter({required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(const Color(0xFF0F172A), BlendMode.src);

    for (var particle in particles) {
      final paint = Paint()
        ..color = particle.color
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 60);

      canvas.drawCircle(Offset(particle.x, particle.y), particle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant BackgroundPainter oldDelegate) => true;
}
