import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/model/models.dart';
import 'package:my_portfolio/utils/theme.dart';

PreferredSizeWidget customAppbar(
  BuildContext context,
  bool isWide,
  PortfolioData data,
  Future<void> Function(GlobalKey<State<StatefulWidget>>) scrollTo,
  Map<String, GlobalKey<State<StatefulWidget>>> navKeys,
) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(72),

    child: Container(
      padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(
                Icons.flutter_dash,
                color: Color(0xFF6750A4),
                size: 28,
              ),
              const SizedBox(width: 12),
              Text(
                data.ownerName,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Obx(() {
                final ThemeMode mode =
                    Get.find<ThemeController>().themeMode.value;
                final bool isDark = mode == ThemeMode.dark;
                return IconButton(
                  tooltip: isDark ? 'Switch to Light' : 'Switch to Dark',
                  onPressed: Get.find<ThemeController>().toggleTheme,
                  icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                );
              }),
              const SizedBox(width: 8),
              _TopNav(isWide: isWide, onTap: scrollTo, keys: navKeys),
            ],
          ),
        ],
      ),
    ),
  );
}

class _TopNav extends StatelessWidget {
  const _TopNav({
    required this.isWide,
    required this.onTap,
    required this.keys,
  });
  final bool isWide;
  final Future<void> Function(GlobalKey) onTap;
  final Map<String, GlobalKey> keys;

  @override
  Widget build(BuildContext context) {
    // if (isWide) {
    //   return Row(
    //     children: keys.entries
    //         .map(
    //           (MapEntry<String, GlobalKey> e) => TextButton(
    //             onPressed: () => onTap(e.value),
    //             child: Padding(
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 12,
    //                 vertical: 8,
    //               ),
    //               child: Text(
    //                 e.key,
    //                 style: Theme.of(context).textTheme.labelLarge?.copyWith(
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         )
    //         .toList(),
    //   );
    // }
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      ),
      onSelected: (String value) => onTap(keys[value]!),
      itemBuilder: (BuildContext context) => keys.keys
          .map((String e) => PopupMenuItem<String>(value: e, child: Text(e)))
          .toList(),
    );
  }
}
