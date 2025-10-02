import 'package:flutter/material.dart';
import 'package:my_portfolio/model/models.dart';
import 'package:my_portfolio/view/portfolio/widgets/sections.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key, required this.isWide, required this.data});
  final bool isWide;
  final PortfolioData data;

  @override
  Widget build(BuildContext context) {
    final int columns = isWide ? 3 : 1;
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
            childAspectRatio: isWide ? 2.5 : 3.5,
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
        // color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Image.asset(
                widget.skill.image ?? '',
                width: 35,
                height: 35,
                fit: BoxFit.fitHeight,
                // color: Color(0xFF6750A4),
                // colorBlendMode: BlendMode.srcIn,
              ),

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
                          // backgroundColor: const Color(0xFFECEAF2),
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
