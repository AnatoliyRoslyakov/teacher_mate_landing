import 'package:flutter/material.dart';
import 'package:teacher_mate_landing/generated/l10n.dart';
import 'package:teacher_mate_landing/shared/app_layout_item_builder.dart';
import 'package:teacher_mate_landing/theme/app_text_style.dart';
import 'package:teacher_mate_landing/widget/feature_card.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({super.key, required this.scrollPosition});

  final double scrollPosition;

  @override
  Widget build(BuildContext context) {
    bool isSmall = AppLayoutItemBuilder(
      wide: () => false,
      narrow: () => true,
    ).call(context);
    return Container(
      padding:
          isSmall
              ? EdgeInsets.symmetric(vertical: 20, horizontal: 16)
              : EdgeInsets.symmetric(vertical: 80, horizontal: 100),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            S.of(context).secondSectionTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.b7f46.copyWith(fontSize: 36),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              FeatureCard(
                icon: Icons.calendar_month,
                title: S.of(context).secondSectionTitle1,
                description: S.of(context).secondSectionSubtitle1,
                scrollPosition: scrollPosition,
                index: 0,
              ),
              FeatureCard(
                icon: Icons.group,
                title: S.of(context).secondSectionTitle2,
                description: S.of(context).secondSectionSubtitle2,
                scrollPosition: scrollPosition,
                index: 1,
              ),
              FeatureCard(
                icon: Icons.search,
                title: S.of(context).secondSectionTitle3,
                description: S.of(context).secondSectionSubtitle3,
                scrollPosition: scrollPosition,
                index: 2,
              ),
              FeatureCard(
                icon: Icons.money_off,
                title: S.of(context).secondSectionTitle4,
                description: S.of(context).secondSectionSubtitle4,
                scrollPosition: scrollPosition,
                index: 3,
              ),
              FeatureCard(
                icon: Icons.notifications_active,
                title: S.of(context).secondSectionTitle5,
                description: S.of(context).secondSectionSubtitle5,
                scrollPosition: scrollPosition,
                index: 4,
              ),
              FeatureCard(
                icon: Icons.note_alt,
                title: S.of(context).secondSectionTitle6,
                description: S.of(context).secondSectionSubtitle6,
                scrollPosition: scrollPosition,
                index: 5,
              ),
              FeatureCard(
                icon: Icons.design_services,
                title: S.of(context).secondSectionTitle7,
                description: S.of(context).secondSectionSubtitle7,
                scrollPosition: scrollPosition,
                index: 6,
              ),
              FeatureCard(
                icon: Icons.phone_android,
                title: S.of(context).secondSectionTitle8,
                description: S.of(context).secondSectionSubtitle8,
                scrollPosition: scrollPosition,
                index: 7,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
