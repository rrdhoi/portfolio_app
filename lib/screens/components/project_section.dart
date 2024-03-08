import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:web_responsive/app/app_fonts.dart';
import 'package:web_responsive/app/extensions/context_extension.dart';

import '../base_container.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Text(
            "Sederhana, Transparan!",
            style: AppFonts.defaultFont().copyWith(
              fontWeight: FontWeight.w900,
              fontSize: context.responsive(large: 42, mobile: 28),
              height: 1.65,
            ),
          ),
          Text("Tanpa syarat, kontrak maupun biaya yang tidak terduga!"),
          const Gap(50),
          Container(
            color: Colors.yellow,
            height: 300,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.greenAccent,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
