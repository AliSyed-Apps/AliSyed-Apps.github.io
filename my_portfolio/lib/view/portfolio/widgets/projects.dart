import 'package:flutter/material.dart';
import 'package:my_portfolio/model/models.dart';
import 'package:my_portfolio/view/portfolio/widgets/sections.dart';

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
                            // color: Colors.white,
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
                                      Visibility(
                                        visible: project.link != null,
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: TextButton.icon(
                                            onPressed: project.link == null
                                                ? null
                                                : () {},
                                            icon: const Icon(Icons.open_in_new),
                                            label: const Text('View'),
                                          ),
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
