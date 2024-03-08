import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:web_responsive/app/app_fonts.dart';
import 'package:web_responsive/app/extensions/context_extension.dart';
import 'package:web_responsive/app/extensions/figma_extension.dart';

import '../base_container.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Text(
            "Articles",
            style: AppFonts.defaultFont().copyWith(
              fontWeight: FontWeight.w900,
              fontSize: context.responsive(large: 42, mobile: 28),
              height: 1.65,
            ),
          ),
          const Gap(36),
          ResponsiveRowColumn(
            rowSpacing: 100,
            columnSpacing: 20,
            layout: context.isLargerThan(MOBILE)
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                rowFit: FlexFit.tight,
                rowFlex: 2,
                columnOrder: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Mobile UI Design'),
                    Gap(12),
                    Text('Most Popular from us', style: AppFonts.defaultFont().copyWith(
                      fontSize: 28,
                      color: Colors.black,
                    ),),
                    Gap(18),
                    Text('In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.', style: AppFonts.defaultFont().copyWith(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 28.8.toFigmaHeight(16),
                    ),),
                    Gap(20),
                    Text('Read More ->',
                    style: AppFonts.defaultFont().copyWith(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    ),
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                rowFit: FlexFit.tight,
                rowFlex: 3,
                columnOrder: 1,
                child: Container(
                  height: 300,
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
