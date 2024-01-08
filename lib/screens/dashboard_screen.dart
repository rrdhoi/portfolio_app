import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:web_responsive/context_extension.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _listContent = [
    const AboutMeSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ScrollablePositionedList.builder(
            itemCount: _listContent.length,
            itemBuilder: (context, index) {
              return _listContent[index];
            }));
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      maxWidth: 1100,
      child: ResponsiveRowColumn(
        columnMainAxisAlignment: MainAxisAlignment.center,
        columnSpacing: 32,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        layout: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        children: [
          if (context.isMobile())
            ResponsiveRowColumnItem(
              columnFlex: 1,
              rowFlex: 0,
              // child: Container(constraints: BoxConstraints(maxWidth: 250, maxHeight: 250), color: Colors.yellow),
              child: Container(color: Colors.yellow),
            ),
          ResponsiveRowColumnItem(
            rowFlex: 2,
            columnFlex: 2,
            child:
                Container(color: Colors.greenAccent),
          ),
          ResponsiveRowColumnItem(
              rowFlex: 3,
              columnFlex: 3,
            child:
            Container(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
