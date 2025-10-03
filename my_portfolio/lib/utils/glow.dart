import 'package:flutter/material.dart';

TextStyle? addGlowToTextStyle(
  TextStyle? base, {
  required Color color,
  double blurRadius = 16,
}) {
  if (base == null) return null;
  return base.copyWith(
    shadows: <Shadow>[
      Shadow(
        color: color.withOpacity(0.35),
        blurRadius: blurRadius,
        offset: const Offset(0, 0),
      ),
      Shadow(
        color: color.withOpacity(0.25),
        blurRadius: blurRadius * 0.75,
        offset: const Offset(0, 0),
      ),
    ],
  );
}

class GlowWrapper extends StatefulWidget {
  final Widget child;
  final Color color;
  final double blurRadius;
  final double spreadRadius;
  final Duration duration;

  const GlowWrapper({
    super.key,
    required this.child,
    required this.color,
    this.blurRadius = 24,
    this.spreadRadius = 1.5,
    this.duration = const Duration(milliseconds: 180),
  });

  @override
  State<GlowWrapper> createState() => _GlowWrapperState();
}

class _GlowWrapperState extends State<GlowWrapper> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final List<BoxShadow> shadows = <BoxShadow>[
      BoxShadow(
        color: widget.color.withOpacity(_hovering ? 0.45 : 0.25),
        blurRadius: _hovering ? widget.blurRadius : widget.blurRadius * 0.6,
        spreadRadius: _hovering
            ? widget.spreadRadius
            : widget.spreadRadius * 0.5,
      ),
    ];

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: widget.duration,
        decoration: BoxDecoration(boxShadow: shadows),
        child: widget.child,
      ),
    );
  }
}
