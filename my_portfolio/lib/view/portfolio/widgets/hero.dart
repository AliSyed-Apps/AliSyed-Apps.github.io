import 'package:flutter/material.dart';
import 'package:my_portfolio/model/models.dart';
import 'package:my_portfolio/utils/img.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/utils/glow.dart';

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
                  style: addGlowToTextStyle(
                    Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                    color: const Color(0xFF6750A4),
                    blurRadius: 18,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  data.title,
                  textAlign: isWide ? TextAlign.start : TextAlign.center,
                  style: addGlowToTextStyle(
                    Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xFF6750A4),
                      fontWeight: FontWeight.w700,
                    ),
                    color: const Color(0xFF6750A4),
                    blurRadius: 14,
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
                    GlowWrapper(
                      color: const Color(0xFF6750A4),
                      child: FilledButton.icon(
                        onPressed: () async {
                          String email = data.contacts.email;
                          String url = 'mailto:$email?subject=&body=';
                          await launchUrl(Uri.parse(url));
                        },
                        icon: const Icon(Icons.email),
                        label: const Text('Contact Me'),
                      ),
                    ),
                    GlowWrapper(
                      color: const Color(0xFF6750A4),
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          String url =
                              'https://drive.google.com/file/d/12N9wH28T6_t4MVUnrmottIzcv4N-BtHb/view?usp=drivesdk';
                          await launchUrl(Uri.parse(url));
                        },
                        icon: const Icon(Icons.file_download),
                        label: const Text('Download CV'),
                      ),
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
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF6750A4).withAlpha(40),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Image.asset(data.image, fit: BoxFit.fitWidth),

                  // child: Icon(
                  //   Icons.flutter_dash_rounded,
                  //   size: 120,
                  //   color: Color(0xFF6750A4),
                  // ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
