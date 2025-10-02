import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/view/portfolio/widgets/about.dart';
import 'package:my_portfolio/view/portfolio/widgets/appbar.dart';
import 'package:my_portfolio/view/portfolio/widgets/education.dart';
import 'package:my_portfolio/view/portfolio/widgets/contact.dart';
import 'package:my_portfolio/view/portfolio/widgets/experience.dart';
import 'package:my_portfolio/view/portfolio/widgets/hero.dart';
import 'package:my_portfolio/view/portfolio/widgets/projects.dart';
import 'package:my_portfolio/view/portfolio/widgets/skill.dart';
import 'widgets/sections.dart';
import '../../controllers/portfolio_controller.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    PortfolioController portfolioController = Get.find<PortfolioController>();

    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isWide = constraints.maxWidth >= 900;
          final EdgeInsets pagePadding = EdgeInsets.symmetric(
            horizontal: isWide ? 80 : 20,
            vertical: isWide ? 24 : 16,
          );

          return Scaffold(
            appBar: customAppbar(
              context,
              isWide,
              portfolioController.data,
              portfolioController.scrollTo,
              portfolioController.keys,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    key: portfolioController.homeKey,
                    child: Padding(
                      padding: pagePadding,
                      child: HeroSection(
                        isWide: isWide,
                        data: portfolioController.data,
                      ),
                    ),
                  ),
                  const Divider(),
                  Container(
                    key: portfolioController.aboutKey,
                    child: Padding(
                      padding: pagePadding,
                      child: AboutSection(
                        isWide: isWide,
                        data: portfolioController.data,
                      ),
                    ),
                  ),
                  Container(
                    key: portfolioController.skillsKey,
                    // color: const Color(0xFFF1F0F5),
                    child: Padding(
                      padding: pagePadding,
                      child: SkillsSection(
                        isWide: isWide,
                        data: portfolioController.data,
                      ),
                    ),
                  ),
                  Container(
                    key: portfolioController.experienceKey,
                    child: Padding(
                      padding: pagePadding,
                      child: ExperienceSection(
                        isWide: isWide,
                        data: portfolioController.data,
                      ),
                    ),
                  ),
                  Container(
                    key: portfolioController.educationKey,
                    // color: const Color(0xFFF1F0F5),
                    child: Padding(
                      padding: pagePadding,
                      child: EducationSection(
                        isWide: isWide,
                        isEdu: true,
                        data: portfolioController.data,
                      ),
                    ),
                  ),
                  Container(
                    key: portfolioController.certificationsKey,
                    child: Padding(
                      padding: pagePadding,
                      child: EducationSection(
                        isWide: isWide,
                        isEdu: false,
                        data: portfolioController.data,
                      ),
                    ),
                  ),

                  Container(
                    key: portfolioController.projectsKey,
                    child: Padding(
                      padding: pagePadding,
                      child: ProjectsSection(
                        isWide: isWide,
                        data: portfolioController.data,
                      ),
                    ),
                  ),
                  Container(
                    key: portfolioController.contactKey,
                    // color: const Color(0xFFF1F0F5),
                    child: Padding(
                      padding: pagePadding,
                      child: ContactSection(data: portfolioController.data),
                    ),
                  ),

                  FooterSection(name: portfolioController.data.ownerName),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
