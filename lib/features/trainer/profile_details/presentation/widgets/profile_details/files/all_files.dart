import 'package:flutter/material.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/profile_details/files/cv.dart';
import 'package:trainee_restaurantapp/features/trainer/profile_details/presentation/widgets/profile_details/files/experience.dart';

class TrainerFilesWidget extends StatelessWidget {
  const TrainerFilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TrainerCVwidget(),
          Gaps.vGap12,
          const TrainerExperiencePDFSWidget(),
        ],
      ),
    );
  }
}
