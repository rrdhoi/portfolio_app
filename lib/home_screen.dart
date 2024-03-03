import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:web_responsive/app/extensions/context_extension.dart';
import 'dart:math' as math;

typedef ItemAppbar = ({String text, GestureTapCallback onTap});

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late GlobalKey<ScaffoldState> mobileDrawer;
  late ItemScrollController _itemScrollController;
  late final List<ItemAppbar> listItemAppBar;
  late final AnimationController _rotateController;
  late Animation<Offset> _animation;

  int _colorIndex = 0;
  List<Color> _colors = [Colors.yellow, Colors.green, Colors.red];
  List<Color> _colors2 = [Colors.green, Colors.red, Colors.yellow];

  var scaleAnimation;
  bool isRotate = false;

  @override
  void initState() {
    mobileDrawer = GlobalKey();
    _itemScrollController = ItemScrollController();
    // _rotateController = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();

    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    // _rotateController.addStatusListener((status) {
    //   if (status == AnimationStatus.forward) {
    //     setState(() {
    //       _colorIndex = (_colorIndex + 1) % _colors.length;
    //       isRotate = true;
    //     });
    //   }
    //
    //   if (status == AnimationStatus.completed) {
    //     setState(() => isRotate = false);
    //     _rotateController.repeat(reverse: false);
    //   }
    // });
    //
    // // _rotateController.forward();
    //
    // _animation = Tween<double>(
    //   begin: 0.0,
    //   end: 0.5,
    // ).animate(_rotateController);

    // _rotateController.repeat(reverse: false);

    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(-1.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _rotateController,
        curve: Curves.linear,
      ),
    );

    _rotateController.forward();
    _rotateController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(seconds: 1), () {
          _rotateController.reset();
          _rotateController.forward();
        });
      }
    });

    listItemAppBar = [
      (text: "Home", onTap: () => _changeToIndex(1)),
      (text: "About", onTap: () => _changeToIndex(2)),
      (text: "Project", onTap: () => _changeToIndex(3)),
      (text: "Contact", onTap: () => _changeToIndex(4)),
    ];

    super.initState();
  }

  @override
  void dispose() {
    _rotateController.dispose(); // Memastikan untuk mendispose controller
    super.dispose();
  }

  void _changeToIndex(int i) {
    _itemScrollController.scrollTo(
      index: i,
      duration: const Duration(milliseconds: 300),
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
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
        ),*/
        drawer: _drawer(context),
        body: Center(
          child: MaxWidthBox(
            maxWidth: 1100,
            child: Stack(
              children: [
                ResponsiveRowColumn(
                  layout: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                      ? ResponsiveRowColumnType.ROW
                      : ResponsiveRowColumnType.COLUMN,
                  children: [
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      columnFlex: 2,
                      columnOrder: 2,
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      rowFlex: 1,
                      columnFlex: 3,
                      columnOrder: 1,
                      child: Container(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ],
                ),
                AnimatedBuilder(
                  animation: _rotateController,
                  builder: (context, child) {
                    return Positioned(
                      bottom: MediaQuery.of(context).size.height *
                          (_rotateController.value * 0.4),
                      right: (MediaQuery.of(context).size.width *
                              (_rotateController.value * 0.4)) +
                          230,
                      child: Opacity(
                        opacity: _rotateController.value > 0.8
                            ? 1.0 - ((_rotateController.value - 0.8) * 5.0)
                            : 1.0,
                        child: Transform.rotate(
                          angle: 45 - _rotateController.value + 3.14,
                          child: Container(
                            width: 220,
                            height: 400,
                            decoration: BoxDecoration(
                              color: _colors2[_colorIndex],
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _rotateController,
                  builder: (context, child) {
                    return Positioned(
                      bottom: MediaQuery.of(context).size.height *
                              (_rotateController.value * 0.4) +
                          380,
                      right: MediaQuery.of(context).size.width *
                              (_rotateController.value * 0.4) -
                          20,
                      child: Opacity(
                        opacity: _rotateController.value > 0.8
                            ? 1.0 - ((_rotateController.value - 0.8) * 5.0)
                            : 1.0,
                        child: Transform.rotate(
                          angle: 45 - _rotateController.value + 3.14,
                          child: Container(
                            width: 220,
                            height: 400,
                            decoration: BoxDecoration(
                              color: _colors2[_colorIndex],
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                  )
                      .animate(autoPlay: true, onComplete: (con) => con.repeat())
                      .rotate(begin: 0, end: 0.04, duration: Duration(seconds: 2))
                      .moveX(begin: 300, end: 0, duration: Duration(seconds: 2))
                      // .slide(
                      //     begin: Offset(50, 0),
                      //     duration: Duration(seconds: 1),
                      //     end: Offset(0, 0))
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildSideAnimation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [],
    );
    return AnimatedBuilder(
      animation: _rotateController,
      builder: (context, child) => Transform.translate(
        offset: Offset(
            -(_rotateController.value - 0.5) *
                MediaQuery.of(context).size.width *
                0.5,
            0),
        child: Transform.rotate(
          angle: _rotateController.value * 2 * math.pi,
          child: child,
        ),
      ),
      child: customCard(Colors.red),
    );
  }

  Widget customCard(Color color) => Container(
        width: 100,
        height: 200,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22),
        ),
      );
}
