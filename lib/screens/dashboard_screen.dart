import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:web_responsive/app/extensions/context_extension.dart';

import 'components/about_section.dart';
import 'components/articles_screen.dart';
import 'components/experiences_section.dart';
import 'components/hero_section.dart';
import 'components/project_section.dart';

class FontsStyle {
  static TextStyle defaultFont() => GoogleFonts.inter();
}

typedef ItemAppbar = ({String text, GestureTapCallback onTap});

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final List<ItemAppbar> listItemAppBar;
  late ItemScrollController _itemScrollController;
  late GlobalKey<ScaffoldState> mobileDrawer;

  @override
  void initState() {
    super.initState();
    mobileDrawer = GlobalKey();
    _itemScrollController = ItemScrollController();
    listItemAppBar = [
      (text: "Home", onTap: () => _changeToIndex(1)),
      (text: "About", onTap: () => _changeToIndex(2)),
      (text: "Project", onTap: () => _changeToIndex(3)),
      (text: "Contact", onTap: () => _changeToIndex(4)),
    ];
  }

  void _changeToIndex(int i) {
    _itemScrollController.scrollTo(
      index: i,
      duration: const Duration(milliseconds: 300),
    );
  }

  final List<Widget> _listContent = [
    const HeroSection(),
    const AboutMeSection(),
    const ExperiencesSection(),
    const ProjectSection(),
    const ArticlesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 32,
          titleTextStyle: Theme.of(context).textTheme.titleSmall,
          scrolledUnderElevation: 4,
          shadowColor: Colors.grey.shade50.withOpacity(0.2),
          title: Center(
            child: MaxWidthBox(
              maxWidth: 1100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "@rrdhoi",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  if (context.isLargerThan(MOBILE))
                    Row(
                      children: listItemAppBar
                          .map((e) => Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 32, 0),
                                child: GestureDetector(
                                  onTap: e.onTap,
                                  child: Text(e.text),
                                ),
                              ))
                          .toList(),
                    ),
                ],
              ),
            ),
          ),
        ),
        drawer: _drawer(context),
        body: ScrollablePositionedList.builder(
            itemScrollController: _itemScrollController,
            itemCount: _listContent.length,
            itemBuilder: (context, index) {
              return _listContent[index];
            }));
  }

  Widget? _drawer(BuildContext context) {
    if (context.isLargerThan(MOBILE)) return null;

    return Drawer(
      backgroundColor: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.close),
          ),
          const Gap(16),
          ...listItemAppBar
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 8),
                  child: ListTile(
                    onTap: e.onTap,
                    title: Text(e.text),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
