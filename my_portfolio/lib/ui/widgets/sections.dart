import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../domain/models.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.child, this.color});
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color ?? Colors.white, child: child);
  }
}

class DividerStripe extends StatelessWidget {
  const DividerStripe({super.key});
  @override
  Widget build(BuildContext context) =>
      Container(height: 1, color: Colors.black.withOpacity(0.06));
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Container(
          width: 48,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFF6750A4),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.isWide, required this.data});
  final bool isWide;
  final PortfolioData data;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 420),
      child: Flex(
        direction: isWide ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: isWide ? 1 : 0,
            child: Column(
              crossAxisAlignment: isWide
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello, I\'m',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.black54),
                ),
                const SizedBox(height: 8),
                Text(
                  data.ownerName,
                  textAlign: isWide ? TextAlign.start : TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  data.title,
                  textAlign: isWide ? TextAlign.start : TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: const Color(0xFF6750A4),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: isWide ? 520 : 600,
                  child: Text(
                    data.summary,
                    textAlign: isWide ? TextAlign.start : TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(height: 1.5),
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: isWide
                      ? WrapAlignment.start
                      : WrapAlignment.center,
                  children: <Widget>[
                    FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.email),
                      label: const Text('Contact Me'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.file_download),
                      label: const Text('Download CV'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isWide) const SizedBox(width: 40) else const SizedBox(height: 40),
          Expanded(
            flex: isWide ? 1 : 0,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF6750A4).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(
                    Icons.flutter_dash,
                    size: 120,
                    color: Color(0xFF6750A4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.isWide, required this.data});
  final bool isWide;
  final PortfolioData data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SectionHeader(title: 'About'),
        const SizedBox(height: 12),
        Text(
          "I'm a Flutter developer with experience shipping apps to iOS, Android, and Web. I focus on performance, accessibility, and maintainable code.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(isWide ? 24 : 16),
            child: Wrap(
              spacing: 16,
              runSpacing: 12,
              children: data.highlights
                  .map((String e) => _Chip(text: e))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.isWide, required this.data});
  final bool isWide;
  final PortfolioData data;
  @override
  Widget build(BuildContext context) {
    final int columns = isWide ? 2 : 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SectionHeader(title: 'Key Skills'),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: isWide ? 3.5 : 3.2,
          ),
          itemCount: data.skills.length,
          itemBuilder: (BuildContext context, int index) {
            final Skill skill = data.skills[index];
            return _SkillCard(skill: skill);
          },
        ),
      ],
    );
  }
}

class _SkillCard extends StatefulWidget {
  const _SkillCard({required this.skill});
  final Skill skill;
  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _triggered = false;

  void _onVisibility(VisibilityInfo info) {
    if (!_triggered && info.visibleFraction > 0.4) {
      setState(() => _triggered = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double target = _triggered ? widget.skill.proficiency : 0.0;
    return VisibilityDetector(
      key: ValueKey<String>('skill-${widget.skill.name}'),
      onVisibilityChanged: _onVisibility,
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              const Icon(Icons.check_circle, color: Color(0xFF6750A4)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.skill.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: target),
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeOutCubic,
                      builder: (BuildContext context, double value, Widget? _) {
                        return LinearProgressIndicator(
                          value: value,
                          backgroundColor: const Color(0xFFECEAF2),
                          color: const Color(0xFF6750A4),
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(20),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key, required this.isWide, required this.data});
  final bool isWide;
  final PortfolioData data;
  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  PageController? _controller;
  int _current = 0;
  double _viewportFraction = 0.9;
  double _entranceOpacity = 0.0;
  double _entranceOffset = 24.0;

  double _computeViewportFraction(double width) {
    if (width >= 1400) return 0.45;
    if (width >= 1100) return 0.55;
    if (width >= 900) return 0.65;
    if (width >= 600) return 0.8;
    return 0.92;
  }

  void _ensureController(double fraction) {
    if (_controller == null) {
      _viewportFraction = fraction;
      _controller = PageController(viewportFraction: _viewportFraction);
      return;
    }
    if ((fraction - _viewportFraction).abs() > 0.001) {
      final int page = _current;
      _controller!.dispose();
      _viewportFraction = fraction;
      _controller = PageController(
        viewportFraction: _viewportFraction,
        initialPage: page,
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        _entranceOpacity = 1.0;
        _entranceOffset = 0.0;
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double fraction = _computeViewportFraction(width);
    _ensureController(fraction);
    final double cardHeight = width >= 900 ? 260 : 340;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SectionHeader(title: 'Projects'),
        const SizedBox(height: 12),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeOutCubic,
          opacity: _entranceOpacity,
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.only(top: _entranceOffset),
            child: SizedBox(
              height: cardHeight,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  PageView.builder(
                    controller: _controller!,
                    physics: const PageScrollPhysics(),
                    allowImplicitScrolling: true,
                    itemCount: widget.data.projects.length,
                    onPageChanged: (int index) =>
                        setState(() => _current = index),
                    itemBuilder: (BuildContext context, int index) {
                      final Project project = widget.data.projects[index];
                      final double page =
                          (_controller!.hasClients && _controller!.page != null)
                          ? _controller!.page!
                          : _current.toDouble();
                      final double distance = (index - page).abs().clamp(
                        0.0,
                        1.0,
                      );
                      final double opacity = 1.0 - (distance * 0.25);
                      final double parallax = (index - page) * 12.0;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: AnimatedScale(
                          scale: _current == index ? 1.0 : 0.98,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOut,
                          child: Card(
                            elevation: 0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut,
                              opacity: opacity,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Transform.translate(
                                  offset: Offset(parallax, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          const Icon(
                                            Icons.apps,
                                            color: Color(0xFF6750A4),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              project.title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Expanded(
                                        child: Text(
                                          project.description,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(height: 1.5),
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: TextButton.icon(
                                          onPressed: project.link == null
                                              ? null
                                              : () {},
                                          icon: const Icon(Icons.open_in_new),
                                          label: const Text('View'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  if (widget.data.projects.length > 1)
                    Positioned(
                      left: 0,
                      child: IconButton(
                        onPressed: () {
                          final int prev = (_current - 1).clamp(
                            0,
                            widget.data.projects.length - 1,
                          );
                          _controller!.animateToPage(
                            prev,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        },
                        icon: const Icon(Icons.chevron_left),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF6750A4),
                          shadowColor: Colors.black12,
                        ),
                      ),
                    ),
                  if (widget.data.projects.length > 1)
                    Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          final int next = (_current + 1).clamp(
                            0,
                            widget.data.projects.length - 1,
                          );
                          _controller!.animateToPage(
                            next,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        },
                        icon: const Icon(Icons.chevron_right),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF6750A4),
                          shadowColor: Colors.black12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            widget.data.projects.length,
            (int i) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _current == i ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _current == i
                    ? const Color(0xFF6750A4)
                    : const Color(0xFFE0DCEB),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    super.key,
    required this.isWide,
    required this.data,
  });
  final bool isWide;
  final PortfolioData data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SectionHeader(title: 'Work Experience'),
        const SizedBox(height: 12),
        Column(
          children: data.experiences.map((Experience exp) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(isWide ? 24 : 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Icon(Icons.work, color: Color(0xFF6750A4)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              exp.company,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            exp.period,
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(color: Colors.black54),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        exp.locationType,
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge?.copyWith(color: Colors.black54),
                      ),
                      const SizedBox(height: 12),
                      ...exp.roles.map((Role role) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                role.title,
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                role.period,
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(color: Colors.black54),
                              ),
                              const SizedBox(height: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: role.bullets.map((String b) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.only(top: 6),
                                          child: Icon(
                                            Icons.circle,
                                            size: 6,
                                            color: Color(0xFF6750A4),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            b,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(height: 1.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key, required this.isWide, required this.data});
  final bool isWide;
  final PortfolioData data;
  @override
  Widget build(BuildContext context) {
    final int columns = isWide ? 2 : 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SectionHeader(title: 'Education'),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: isWide ? 3.5 : 3.0,
          ),
          itemCount: data.education.length,
          itemBuilder: (BuildContext context, int index) {
            final Education edu = data.education[index];
            return Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.school, color: Color(0xFF6750A4)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            edu.institution,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            edu.degree,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            edu.period,
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class CertificationSection extends StatelessWidget {
  const CertificationSection({
    super.key,
    required this.isWide,
    required this.data,
  });
  final bool isWide;
  final PortfolioData data;
  @override
  Widget build(BuildContext context) {
    final int columns = isWide ? 2 : 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SectionHeader(title: 'Certifications'),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: isWide ? 3.5 : 3.0,
          ),
          itemCount: data.certifications.length,
          itemBuilder: (BuildContext context, int index) {
            final Certification cert = data.certifications[index];
            return Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.verified, color: Color(0xFF6750A4)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            cert.title,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cert.issuer,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cert.period,
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.data});
  final PortfolioData data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SectionHeader(title: 'Contact'),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Wrap(
              spacing: 16,
              runSpacing: 12,
              children: <Widget>[
                _ContactItem(
                  icon: Icons.email,
                  label: 'Email',
                  value: 'you@example.com',
                ),
                _ContactItem(
                  icon: Icons.link,
                  label: 'GitHub',
                  value: 'github.com/yourhandle',
                ),
                _ContactItem(
                  icon: Icons.linked_camera,
                  label: 'LinkedIn',
                  value: 'linkedin.com/in/yourhandle',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: <Widget>[
          Text(
            '© ${DateTime.now().year} Your Name — Flutter Developer',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 8),
          const DividerStripe(),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7FB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE4E1EC)),
      ),
      child: Text(text, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}

class _ContactItem extends StatelessWidget {
  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
  });
  final IconData icon;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, color: const Color(0xFF6750A4)),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(value, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
