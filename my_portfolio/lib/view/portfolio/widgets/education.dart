import 'package:flutter/material.dart';
import 'package:my_portfolio/model/models.dart';
import 'package:my_portfolio/view/portfolio/widgets/sections.dart';

class EducationSection extends StatelessWidget {
  final bool isWide;
  final bool isEdu;
  final PortfolioData data;

  const EducationSection({
    super.key,
    required this.isWide,
    required this.data,
    required this.isEdu,
  });

  @override
  Widget build(BuildContext context) {
    final int columns = isWide ? 2 : 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SectionHeader(title: isEdu ? 'Education' : 'Certifications'),
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
          itemCount: isEdu ? data.education.length : data.certifications.length,
          itemBuilder: (BuildContext context, int index) {
            String title = '';
            String content = '';
            String period = '';

            if (isEdu) {
              final Education edu = data.education[index];
              title = edu.institution;
              content = edu.degree;
              period = edu.period;
            } else {
              final Certification edu = data.certifications[index];
              title = edu.title;
              content = edu.issuer;
              period = edu.period;
            }

            return Card(
              elevation: 0,
              // color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      isEdu ? Icons.school : Icons.verified,
                      color: Color(0xFF6750A4),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Flexible(
                            child: Text(
                              content,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Flexible(
                            child: Text(
                              period,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
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
