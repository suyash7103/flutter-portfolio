import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../core/theme.dart';
import '../../core/glassmorphism.dart';
import '../../core/hover_effect.dart';
import '../../core/tilt_effect.dart';
import '../../core/on_screen_animator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

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
                    "02.",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.accent,
                      fontSize: isMobile ? 24 : 32,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Some Things I've Built",
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
                spacing: 32,
                runSpacing: 32,
                children: [
                  SizedBox(
                    width: isMobile ? double.infinity : 400,
                    child: _buildProjectCard(
                      context,
                      title: "Real-Time Chat Application",
                      description: "Architected a real-time one-to-one chat application using Flutter and Firebase, integrating Firebase Authentication for secure user login and Cloud Firestore for live message synchronization across platforms.",
                      tags: ["Flutter", "Firebase Auth", "Cloud Firestore", "Dart"],
                      githubLink: "https://github.com/suyash7103",
                    ).animate(target: isVisible ? 1 : 0, delay: 200.ms).fade().slideY(begin: 0.1, end: 0),
                  ),
                  
                  SizedBox(
                    width: isMobile ? double.infinity : 400,
                    child: _buildProjectCard(
                      context,
                      title: "Vehicle Tracking & Monitoring",
                      description: "Developed a real-time vehicle tracking application in Flutter, consuming cloud-hosted GPS APIs and handling continuous data updates with local caching and optimized API calls to improve reliability under unstable network conditions.",
                      tags: ["Flutter", "Google Maps", "REST APIs", "Caching"],
                      githubLink: "https://github.com/suyash7103",
                    ).animate(target: isVisible ? 1 : 0, delay: 400.ms).fade().slideY(begin: 0.1, end: 0),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _buildProjectCard(BuildContext context, {
    required String title,
    required String description,
    required List<String> tags,
    required String githubLink,
  }) {
    return TiltEffect(
      child: HoverEffect(
        child: GlassContainer(
          padding: const EdgeInsets.all(32),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.folder_open, color: AppTheme.primary, size: 40),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github, color: AppTheme.textSecondary),
                  onPressed: () async {
                    final Uri url = Uri.parse(githubLink);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                ),
              ],
            ),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: tags.map((tag) => Text(
              tag,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.accent,
                fontFamily: 'Inter',
              ),
            )).toList(),
          ),
        ],
      ),
    )));
  }
}
