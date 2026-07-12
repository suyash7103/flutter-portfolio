import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onExplorePressed;
  const HeroSection({Key? key, this.onExplorePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        
        return Container(
          constraints: BoxConstraints(
            minHeight: isMobile ? 0 : MediaQuery.of(context).size.height * 0.9,
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 100,
            vertical: isMobile ? 80 : 0,
          ),
          child: isMobile
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfileImage().animate().fade(duration: 800.ms, curve: Curves.easeOutExpo).scale(begin: const Offset(0.8, 0.8)),
                    const SizedBox(height: 48),
                    _buildTextContent(context, isMobile),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildTextContent(context, isMobile),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: _buildProfileImage()
                            .animate()
                            .fade(duration: 1000.ms, curve: Curves.easeOutExpo)
                            .scale(begin: const Offset(0.8, 0.8))
                            .slideX(begin: 0.2, end: 0),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildTextContent(BuildContext context, bool isMobile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [

                    Text(
                      "Hi, my name is",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.accent,
                        fontSize: 20,
                        letterSpacing: 1.5,
                      ),
                    ).animate().fade(duration: 800.ms, curve: Curves.easeOutExpo).slideY(begin: 0.5, end: 0),
                    const SizedBox(height: 16),
                    Text(
                      "SUYASH SHARMA.",
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      style: isMobile 
                          ? Theme.of(context).textTheme.displayMedium?.copyWith(height: 1.1) 
                          : Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 90, height: 1.1, letterSpacing: -2),
                    ).animate(delay: 100.ms).fade(duration: 800.ms, curve: Curves.easeOutExpo).slideY(begin: 0.5, end: 0).shimmer(duration: 2000.ms, color: AppTheme.primary.withOpacity(0.5)),
                    Text(
                      "I build seamless mobile experiences.",
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      style: isMobile 
                          ? Theme.of(context).textTheme.displayMedium?.copyWith(color: AppTheme.textSecondary, height: 1.1)
                          : Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 70, color: AppTheme.textSecondary, height: 1.1, letterSpacing: -1.5),
                    ).animate(delay: 200.ms).fade(duration: 800.ms, curve: Curves.easeOutExpo).slideY(begin: 0.5, end: 0),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: isMobile ? double.infinity : 600,
                      child: Text(
                        "I'm a Software Engineer specializing in Flutter. I build production-grade Android and iOS applications with a focus on telematics, embedded dashcam systems, GPS visualization, and performance optimization.",
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 20,
                          color: AppTheme.textSecondary.withOpacity(0.8),
                        ),
                      ).animate(delay: 300.ms).fade(duration: 800.ms, curve: Curves.easeOutExpo).slideY(begin: 0.5, end: 0),
                    ),
                    const SizedBox(height: 48),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: onExplorePressed ?? () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primary,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 10,
                            shadowColor: AppTheme.primary.withOpacity(0.5),
                          ),
                          child: Text(
                            "Explore My Work",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppTheme.background,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            final url = Uri.parse("https://drive.google.com/file/d/1lb23GUDufrbGVwW62zIwR9aZQG33W1nw/view?usp=sharing");
                            if (await canLaunchUrl(url)) await launchUrl(url);
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppTheme.primary, width: 2),
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            "View Resume",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ).animate(delay: 400.ms).fade(duration: 800.ms, curve: Curves.easeOutExpo).slideY(begin: 0.5, end: 0),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.primary.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withOpacity(0.2),
            blurRadius: 50,
            spreadRadius: 10,
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('assets/pic.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    ).animate(onPlay: (controller) => controller.repeat(reverse: true))
     .moveY(begin: -10, end: 10, duration: 3000.ms, curve: Curves.easeInOut);
  }
}
