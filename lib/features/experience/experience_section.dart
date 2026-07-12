import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../core/theme.dart';
import '../../core/glassmorphism.dart';
import '../../core/hover_effect.dart';
import '../../core/tilt_effect.dart';
import '../../core/on_screen_animator.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 100, vertical: 80),
          child: OnScreenAnimator(
            builder: (isVisible) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
                children: [
                  Text(
                    "01.",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.accent,
                      fontSize: isMobile ? 24 : 32,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Professional Experience",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: isMobile ? 24 : 32,
                    ),
                  ),
                  if (!isMobile) const SizedBox(width: 24),
                  if (!isMobile)
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppTheme.surface,
                      ),
                    )
                ],
              ).animate(target: isVisible ? 1 : 0).fade().slideX(begin: -0.2, end: 0),
              const SizedBox(height: 48),
              
              _buildExperienceCard(
                context,
                company: "ONELAP TELEMATICS",
                role: "Flutter Developer",
                date: "Apr 2025 – Present | Noida",
                bullets: [
                  "Developed and optimized customer-facing features, driving the app to 1 Lakh+ downloads across Android and iOS.",
                  "Led Starvis 2 Dashcam integration with live streaming/recording features and engineered a sequential API request queue to prevent device overload.",
                  "Built a Pausable Cache Manager and zero-dependency video seekbar with dynamic timeline highlights.",
                  "Integrated Google Maps for real-time GPS tracking and historical route playback with live trip statistics.",
                  "Created an OTA firmware update system via Firebase Firestore and integrated Crashlytics with CRM modules."
                ],
                isMobile: isMobile,
              ).animate(target: isVisible ? 1 : 0, delay: 200.ms).fade().slideY(begin: 0.1, end: 0),
              
              const SizedBox(height: 32),
              
              _buildExperienceCard(
                context,
                company: "NIKAH FOREVER",
                role: "Flutter Developer Intern",
                date: "Jan 2025 – Apr 2025 | Delhi",
                bullets: [
                  "Built responsive UI for Android/iOS apps, integrated REST APIs, and resolved production issues to optimize performance.",
                  "Collaborated cross-functionally to deliver production-ready mobile features."
                ],
                isMobile: isMobile,
              ).animate(target: isVisible ? 1 : 0, delay: 400.ms).fade().slideY(begin: 0.1, end: 0),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildExperienceCard(BuildContext context, {
    required String company,
    required String role,
    required String date,
    required List<String> bullets,
    required bool isMobile,
  }) {
    return TiltEffect(
      child: HoverEffect(
        child: GlassContainer(
          padding: const EdgeInsets.all(32),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: [
              Text(
                role,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
              ),
              Text(
                "@",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24, color: AppTheme.primary),
              ),
              Text(
                company,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24, color: AppTheme.primary),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          ...bullets.map((bullet) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8, right: 12),
                  child: Icon(Icons.play_arrow, color: AppTheme.accent, size: 14),
                ),
                Expanded(
                  child: Text(
                    bullet,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    )));
  }
}
