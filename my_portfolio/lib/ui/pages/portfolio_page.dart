import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/sections.dart';
import '../../controllers/portfolio_controller.dart';
import '../../utils/theme.dart';

// ignore: must_be_immutable
class PortfolioPage extends StatelessWidget {
  PortfolioPage({super.key});

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _certificationsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // navigation to the section
  Future<void> _scrollTo(GlobalKey key) async {
    final BuildContext? ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

  var data = Get.find<PortfolioController>().data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isWide = constraints.maxWidth >= 900;
        final EdgeInsets pagePadding = EdgeInsets.symmetric(
          horizontal: isWide ? 80 : 20,
          vertical: isWide ? 24 : 16,
        );

        return Scaffold(
          // backgroundColor: const Color(0xFFF7F7FB),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(72),
            child: Container(
              // color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.flutter_dash,
                        color: Color(0xFF6750A4),
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        data.ownerName,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Obx(() {
                        final ThemeMode mode =
                            Get.find<ThemeController>().themeMode.value;
                        final bool isDark = mode == ThemeMode.dark;
                        return IconButton(
                          tooltip: isDark
                              ? 'Switch to Light'
                              : 'Switch to Dark',
                          onPressed: Get.find<ThemeController>().toggleTheme,
                          icon: Icon(
                            isDark ? Icons.light_mode : Icons.dark_mode,
                          ),
                        );
                      }),
                      const SizedBox(width: 8),
                      _TopNav(
                        isWide: isWide,
                        onTap: _scrollTo,
                        keys: <String, GlobalKey>{
                          'Home': _homeKey,
                          'About': _aboutKey,
                          'Skills': _skillsKey,
                          'Experience': _experienceKey,
                          'Education': _educationKey,
                          'Certifications': _certificationsKey,
                          'Projects': _projectsKey,
                          'Contact': _contactKey,
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Section(
                  key: _homeKey,
                  color: Colors.transparent,
                  child: Padding(
                    padding: pagePadding,
                    child: HeroSection(isWide: isWide, data: data),
                  ),
                ),
                const DividerStripe(),
                Section(
                  key: _aboutKey,
                  child: Padding(
                    padding: pagePadding,
                    child: AboutSection(isWide: isWide, data: data),
                  ),
                ),
                Section(
                  key: _skillsKey,
                  // color: const Color(0xFFF1F0F5),
                  child: Padding(
                    padding: pagePadding,
                    child: SkillsSection(isWide: isWide, data: data),
                  ),
                ),
                Section(
                  key: _experienceKey,
                  child: Padding(
                    padding: pagePadding,
                    child: ExperienceSection(isWide: isWide, data: data),
                  ),
                ),
                Section(
                  key: _educationKey,
                  // color: const Color(0xFFF1F0F5),
                  child: Padding(
                    padding: pagePadding,
                    child: EducationSection(isWide: isWide, data: data),
                  ),
                ),
                Section(
                  key: _certificationsKey,
                  child: Padding(
                    padding: pagePadding,
                    child: CertificationSection(isWide: isWide, data: data),
                  ),
                ),
                Section(
                  key: _projectsKey,
                  child: Padding(
                    padding: pagePadding,
                    child: ProjectsSection(isWide: isWide, data: data),
                  ),
                ),
                Section(
                  key: _contactKey,
                  // color: const Color(0xFFF1F0F5),
                  child: Padding(
                    padding: pagePadding,
                    child: ContactSection(data: data),
                  ),
                ),
                const FooterSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TopNav extends StatelessWidget {
  const _TopNav({
    required this.isWide,
    required this.onTap,
    required this.keys,
  });
  final bool isWide;
  final Future<void> Function(GlobalKey) onTap;
  final Map<String, GlobalKey> keys;

  @override
  Widget build(BuildContext context) {
    // if (isWide) {
    //   return Row(
    //     children: keys.entries
    //         .map(
    //           (MapEntry<String, GlobalKey> e) => TextButton(
    //             onPressed: () => onTap(e.value),
    //             child: Padding(
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 12,
    //                 vertical: 8,
    //               ),
    //               child: Text(
    //                 e.key,
    //                 style: Theme.of(context).textTheme.labelLarge?.copyWith(
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         )
    //         .toList(),
    //   );
    // }
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu),
      onSelected: (String value) => onTap(keys[value]!),
      itemBuilder: (BuildContext context) => keys.keys
          .map((String e) => PopupMenuItem<String>(value: e, child: Text(e)))
          .toList(),
    );
  }
}
