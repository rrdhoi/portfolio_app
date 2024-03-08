import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_responsive/app/extensions/context_extension.dart';
import 'package:web_responsive/app/extensions/figma_extension.dart';
import 'package:web_responsive/screens/dashboard_screen.dart';

import '../../app/app_colors.dart';
import '../base_container.dart';

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
        ],
      ),
    );
  }
}
