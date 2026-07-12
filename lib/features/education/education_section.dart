import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../core/theme.dart';
import '../../core/glassmorphism.dart';
import '../../core/hover_effect.dart';
import '../../core/tilt_effect.dart';
import '../../core/on_screen_animator.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({Key? key}) : super(key: key);

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
                    "03.",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.accent,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Education & Certifications",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppTheme.surface,
                    ),
                  )
                ],
              ).animate(target: isVisible ? 1 : 0).fade().slideX(begin: -0.2, end: 0),
              const SizedBox(height: 48),
              
              TiltEffect(
                child: HoverEffect(
                  child: GlassContainer(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                      "SRM Institute of Science and Technology – Modinagar",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Bachelor of Technology in Computer Science Engineering (AI & ML) | 2021 - 2025",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.primary),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "CGPA: 8.61/10",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Certifications",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, color: AppTheme.textPrimary),
                    ),
                    const SizedBox(height: 16),
                    _buildListItem(context, "Google for Developers Android Virtual Internship (AICTE)"),
                    _buildListItem(context, "NPTEL DBMS & Data Mining"),
                    _buildListItem(context, "Netcamp Android (Java)"),
                    const SizedBox(height: 24),
                    Text(
                      "Leadership",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, color: AppTheme.textPrimary),
                    ),
                    const SizedBox(height: 16),
                    _buildListItem(context, "Core Member at Innovate Tech Fest"),
                    _buildListItem(context, "Participant at Tech Yuva"),
                  ],
                ),
              ).animate(target: isVisible ? 1 : 0, delay: 200.ms).fade().slideY(begin: 0.1, end: 0),
              )),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildListItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6, right: 12),
            child: Icon(Icons.star, color: AppTheme.accent, size: 14),
          ),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
