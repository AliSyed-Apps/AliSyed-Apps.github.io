import 'package:flutter/material.dart';
import 'package:my_portfolio/model/models.dart';

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
                  style: Theme.of(context).textTheme.titleMedium,
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
          SizedBox(width: isWide ? 40 : 0, height: isWide ? 0 : 40),
          // if (isWide)
          //   SizedBox(width: isWide ? 40 : 0, height: isWide ? 0 : 40)
          // else
          //   const SizedBox(height: 40),
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
