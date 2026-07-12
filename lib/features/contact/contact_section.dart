import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme.dart';
import '../../core/hover_effect.dart';
import '../../core/on_screen_animator.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 100, vertical: 100),
          child: OnScreenAnimator(
            builder: (isVisible) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(
                "04. What's Next?",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.accent,
                  fontSize: 16,
                ),
              ).animate(target: isVisible ? 1 : 0).fade().slideY(begin: 0.1, end: 0),
              const SizedBox(height: 16),
              Text(
                "Get In Touch",
                style: Theme.of(context).textTheme.displayMedium,
              ).animate(target: isVisible ? 1 : 0, delay: 200.ms).fade().slideY(begin: 0.1, end: 0),
              const SizedBox(height: 24),
              SizedBox(
                width: isMobile ? double.infinity : 600,
                child: Text(
                  "I'm currently looking for new opportunities. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ).animate(target: isVisible ? 1 : 0, delay: 400.ms).fade().slideY(begin: 0.1, end: 0),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'suyashsharmaa7@gmail.com',
                  );
                  if (await canLaunchUrl(emailLaunchUri)) {
                    await launchUrl(emailLaunchUri);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Say Hello",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.background,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ).animate(target: isVisible ? 1 : 0, delay: 600.ms).fade().scale(),
              
              const SizedBox(height: 100),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HoverEffect(
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.github, color: AppTheme.textSecondary, size: 30),
                      onPressed: () async {
                        final url = Uri.parse("https://github.com/suyash7103");
                        if (await canLaunchUrl(url)) await launchUrl(url);
                      },
                    ),
                  ),
                  const SizedBox(width: 32),
                  HoverEffect(
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedin, color: AppTheme.textSecondary, size: 30),
                      onPressed: () async {
                        final url = Uri.parse("https://www.linkedin.com/in/suyashsharma7");
                        if (await canLaunchUrl(url)) await launchUrl(url);
                      },
                    ),
                  ),
                  const SizedBox(width: 32),
                  HoverEffect(
                    child: IconButton(
                      icon: const Icon(Icons.phone, color: AppTheme.textSecondary, size: 30),
                      onPressed: () async {
                        final url = Uri.parse("tel:+917018529439");
                        if (await canLaunchUrl(url)) await launchUrl(url);
                      },
                    ),
                  ),
                ],
              ).animate(target: isVisible ? 1 : 0, delay: 800.ms).fade(),
              const SizedBox(height: 16),
              Text(
                "Built with Flutter Web by Suyash Sharma",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontFamily: 'Inter',
                  fontSize: 14,
                ),
              ).animate(target: isVisible ? 1 : 0, delay: 1000.ms).fade(),
            ],
          ),
        ),
      );
    });
  }
}
