import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_responsive/app/extensions/context_extension.dart';
import 'package:web_responsive/screens/dashboard_screen.dart';

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