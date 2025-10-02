import 'package:flutter/material.dart';
import 'package:my_portfolio/model/models.dart';
import 'package:my_portfolio/view/portfolio/widgets/sections.dart';

class ContactSection extends StatelessWidget {
  final PortfolioData data;
  const ContactSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SectionHeader(title: 'Contact'),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          // color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Wrap(
              spacing: 16,
              runSpacing: 12,
              children: <Widget>[
                _ContactItem(
                  icon: Icons.email,
                  label: 'Email',
                  value: data.contacts.email,
                ),
                _ContactItem(
                  icon: Icons.link,
                  label: 'GitHub',
                  value: data.contacts.github,
                ),
                _ContactItem(
                  icon: Icons.linked_camera,
                  label: 'LinkedIn',
                  value: data.contacts.linkedin,
                ),
              ],
            ),
          ),
        ),
      ],
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
        Flexible(
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
