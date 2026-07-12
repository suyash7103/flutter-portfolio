import 'package:flutter/material.dart';
import 'features/hero/hero_section.dart';
import 'features/experience/experience_section.dart';
import 'features/projects/projects_section.dart';
import 'features/education/education_section.dart';
import 'features/contact/contact_section.dart';
import 'features/skills/skills_section.dart';
import 'core/animated_background.dart';
import 'core/custom_cursor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _experienceKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomCursor(
        child: Stack(
          children: [
            const AnimatedBackground(),
            SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  HeroSection(
                    onExplorePressed: () {
                      if (_experienceKey.currentContext != null) {
                        Scrollable.ensureVisible(
                          _experienceKey.currentContext!,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOutCubic,
                        );
                      }
                    },
                  ),
                  ExperienceSection(key: _experienceKey),
                  const ProjectsSection(),
                  const EducationSection(),
                  const SkillsSection(),
                  const ContactSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
