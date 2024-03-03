import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_responsive/app/app_colors.dart';
import 'package:web_responsive/app/app_fonts.dart';
import 'package:web_responsive/app/extensions/context_extension.dart';

import 'components/home_background.dart';

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
            style: AppFonts.defaultFont().copyWith(
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