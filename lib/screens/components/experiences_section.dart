import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:web_responsive/app/app_fonts.dart';
import 'package:web_responsive/app/extensions/context_extension.dart';
import 'package:web_responsive/screens/base_container.dart';

class ExperiencesSection extends StatelessWidget {
  const ExperiencesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      backgroundColor: Colors.grey.shade200,
      child: ResponsiveRowColumn(
        rowSpacing: 100,
        layout: context.isLargerThan(MOBILE)
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            rowFit: FlexFit.tight,
            columnOrder: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Working Experience',
                  style: AppFonts.defaultFont().copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(30),
                ItemContent(),
                ItemContent(),
                ItemContent(),
                ItemContent(isDivider: false),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            rowFit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Working Experience',
                  style: AppFonts.defaultFont().copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(30),
                ItemContent(),
                ItemContent(),
                ItemContent(),
                ItemContent(isDivider: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemContent extends StatelessWidget {
  const ItemContent({super.key, this.isDivider = true});

  final bool isDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1.5,
                  color: Colors.white24,
                ),
              ),
              child: const Icon(
                Icons.account_circle_outlined,
                color: Colors.black87,
              ),
            ),
            const Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product Design at Uber",
                  style: AppFonts.defaultFont().copyWith(
                      fontSize: context.responsive(large: 18, mobile: 14),
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),
                ),
                const Gap(4),
                Text(
                  "February 2018 - February 2022",
                  style: AppFonts.defaultFont().copyWith(
                    fontSize: context.responsive(large: 14, mobile: 12),
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Gap(16),
        if (isDivider)
          SizedBox(width: double.infinity, child: Divider(color: Colors.grey.shade300)),
        const Gap(16),
      ],
    );
  }
}

