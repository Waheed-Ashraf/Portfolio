import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/modules/home/data/models/service_model.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/services_section/service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              "Services",
              style: AppStyles.styleSemiBold24(context).copyWith(
                color: ColorPallet.white,
                shadows: AppStyles.sectionTitleShadow(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LayoutBuilder(
              builder: (context, c) {
                final w = c.maxWidth;
                final columns = w >= 1200 ? 4 : (w >= 900 ? 3 : 2);
                const spacing = 16.0;

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: [
                    for (final s in services)
                      SizedBox(
                        width: (w - (columns - 1) * spacing) / columns,
                        height: 210,
                        child: ServiceCard(model: s),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
