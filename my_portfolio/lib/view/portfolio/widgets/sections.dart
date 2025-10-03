import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/glow.dart';

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
          style: addGlowToTextStyle(
            Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
            color: const Color(0xFF6750A4),
            blurRadius: 14,
          ),
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

class FooterSection extends StatelessWidget {
  final String name;
  const FooterSection({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: <Widget>[
          Text(
            '© ${DateTime.now().year} $name — Flutter Developer',
            style: Theme.of(context).textTheme.bodySmall,
            // ?.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 8),
          const Divider(),
        ],
      ),
    );
  }
}
