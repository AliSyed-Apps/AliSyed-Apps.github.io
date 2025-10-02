import 'package:flutter/material.dart';
import 'package:my_portfolio/model/models.dart';
import 'package:my_portfolio/view/portfolio/widgets/sections.dart';

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
          "I'm a Flutter developer with experience shipping apps to iOS, and Android. I focus on performance, accessibility, and maintainable code.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 0,
          // color: Colors.white,
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

class _Chip extends StatelessWidget {
  const _Chip({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        // color: const Color(0xFFF7F7FB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE4E1EC)),
      ),
      child: Text(text, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}
