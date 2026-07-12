import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../core/theme.dart';
import '../../core/glassmorphism.dart';
import '../../core/tilt_effect.dart';
import '../../core/on_screen_animator.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

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
                      "05.",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.accent,
                        fontSize: isMobile ? 24 : 32,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Technical Arsenal",
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
                
                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    _buildSkillCard(context, "Languages & Databases", "Dart, Java, Kotlin, MySQL", isVisible, 200),
                    _buildSkillCard(context, "Frameworks & Cloud", "Flutter, Firebase (Firestore, Crashlytics)", isVisible, 300),
                    _buildSkillCard(context, "Mobile Dev", "Android, iOS, Google Maps, OTA Updates, Streaming", isVisible, 400),
                    _buildSkillCard(context, "Architecture", "MVVM, Repository Pattern, State Management", isVisible, 500),
                    _buildSkillCard(context, "Networking", "REST APIs, Embedded Device Communication", isVisible, 600),
                    _buildSkillCard(context, "Tools", "Git, VS Code, Xcode, Android Studio, Postman, Figma", isVisible, 700),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkillCard(BuildContext context, String title, String skills, bool isVisible, int delayMs) {
    return SizedBox(
      width: 350,
      height: 150,
      child: TiltEffect(
        child: GlassContainer(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, color: AppTheme.primary),
              ),
              const SizedBox(height: 12),
              Text(
                skills,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
              ),
            ],
          ),
        ),
      ),
    ).animate(target: isVisible ? 1 : 0).fade(delay: delayMs.ms).slideY(begin: 0.1, end: 0);
  }
}
