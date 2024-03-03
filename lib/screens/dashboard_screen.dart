import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:web_responsive/app/app_colors.dart';
import 'package:web_responsive/app/extensions/context_extension.dart';
import 'package:web_responsive/app/extensions/figma_extension.dart';
import 'package:web_responsive/home_screen.dart';

import 'components/home_background.dart';

class FontsStyle {
  static TextStyle defaultFont() => GoogleFonts.inter();
}

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

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.isLargerThan(MOBILE) ? 90 : 32,
        horizontal: 32,
      ),
      child: MaxWidthBox(
        maxWidth: 1100,
        child: ResponsiveRowColumn(
          columnMainAxisAlignment: MainAxisAlignment.center,
          columnSpacing: 32,
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          layout: context.isLargerThan(MOBILE)
              ? ResponsiveRowColumnType.ROW
              : ResponsiveRowColumnType.COLUMN,
          children: [
            if (context.isMobile())
              ResponsiveRowColumnItem(
                rowFlex: 2,
                columnOrder: 1,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: context.isLargerThan(MOBILE) ? 380 : 300),
                  child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ResponsiveRowColumnItem(
              rowFlex: 3,
              columnOrder: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Hi, Saya ridhoi",
                        style: FontsStyle.defaultFont()
                            .copyWith(fontWeight: FontWeight.w900),
                        textScaleFactor: context.titleScaleFactor,
                      ),
                      const Gap(8),
                      Container(width: 72, height: 72, color: Colors.blue),
                    ],
                  ),
                  const Gap(16),
                  Text(
                    "Descriptions",
                    style: FontsStyle.defaultFont(),
                  ),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 2,
              columnOrder: 1,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: context.isLargerThan(MOBILE) ? 380 : 300),
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            // ResponsiveRowColumnItem(
            //   rowFlex: 5,
            //   columnOrder: 2,
            //   child: _leftLayout(context),
            // ),
            // ResponsiveRowColumnItem(
            //   rowFlex: 4,
            //   columnOrder: 1,
            //   child: _rightLayout(context),
            // ),
          ],
        ),
      ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Text(
            "Super Cepat dan\nMeningkatkan Produktivitas",
            style: FontsStyle.defaultFont().copyWith(
                fontWeight: FontWeight.w900,
                fontSize: context.responsive(large: 42, mobile: 28),
                height: 1.65,
            ),
          ),
          const Gap(50),
          ResponsiveRowColumn(
            rowMainAxisSize: MainAxisSize.max,
            columnMainAxisSize: MainAxisSize.max,
            columnSpacing: 24,
            rowSpacing: 24,
            layout: context.isLargerThan(MOBILE)
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                rowFit: FlexFit.tight,
                child: Container(
                  height: 550,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: AppColors.greyBackground,
                      boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow.withOpacity(0.1),
                        offset: const Offset(0, 13),
                        blurRadius: 70,
                      ),
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(36, 64, 36, 0),
                    child: Column(
                      children: [
                        Text(
                          "Tervalidasi",
                          style: FontsStyle.defaultFont().copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(13),
                        Text(
                          "eFaktur yang diinput akan segera mendapatkan validasi langsung dari server DJP dalam sistem.",
                          textAlign: TextAlign.center,
                          style: FontsStyle.defaultFont().copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 28.8.toFigmaHeight(16),
                          ),
                        ),
                        const Gap(26),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 500,
                              minWidth: context.screenWidth,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade300,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFit: FlexFit.tight,
                child: Container(
                  height: 550,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: AppColors.greyBackground,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow.withOpacity(0.1),
                        offset: const Offset(0, 13),
                        blurRadius: 70,
                      ),
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(36, 64, 36, 0),
                    child: Column(
                      children: [
                        Text(
                          "Tervalidasi",
                          style: FontsStyle.defaultFont().copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(13),
                        Text(
                          "eFaktur yang diinput akan segera mendapatkan validasi langsung dari server DJP dalam sistem.",
                          textAlign: TextAlign.center,
                          style: FontsStyle.defaultFont().copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 28.8.toFigmaHeight(16),
                          ),
                        ),
                        const Gap(26),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 500,
                              minWidth: context.screenWidth,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.shade200,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFit: FlexFit.tight,
                child: Container(
                  height: 550,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: AppColors.greyBackground,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadow.withOpacity(0.1),
                        offset: const Offset(0, 13),
                        blurRadius: 70,
                      ),
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(36, 64, 36, 0),
                    child: Column(
                      children: [
                        Text(
                          "Tervalidasi",
                          style: FontsStyle.defaultFont().copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(13),
                        Text(
                          "eFaktur yang diinput akan segera mendapatkan validasi langsung dari server DJP dalam sistem.",
                          textAlign: TextAlign.center,
                          style: FontsStyle.defaultFont().copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 28.8.toFigmaHeight(16),
                          ),
                        ),
                        const Gap(26),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 500,
                              minWidth: context.screenWidth,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amberAccent.shade200,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(50),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 480,
              minWidth: double.infinity,
            ),
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.all(Radius.circular(36))
            ),
          ),
        ],
      ),
    );
  }
}
