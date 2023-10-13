import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/style/dimens.dart';
import 'package:trainee_restaurantapp/core/common/style/gaps.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/add_course/presentation/controller/add_course_cubit.dart';

class AddCourseImageWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const AddCourseImageWidget(
      {required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 120.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.hGap20,
              CustomText(
                  text: text,
                  fontSize: AppConstants.textSize18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.accentColorLight),
              Gaps.hGap12,
              DottedBorder(
                color: AppColors.white,
                dashPattern: const [10, 3],
                radius: const Radius.circular(10),
                borderType: BorderType.Rect,
                strokeWidth: 3,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((Dimens.dp12))),
                    height: Dimens.dp80.h,
                    width: double.infinity,
                    child: BlocBuilder<AddCourseCubit, AddCourseState>(
                      builder: (context, state) {
                        if (state is PickedImagesState) {
                          return Image.file(state.file);
                        }
                        return const Center(
                          child: FaIcon(
                            FontAwesomeIcons.upload,
                            color: AppColors.accentColorLight,
                            size: Dimens.dp40,
                          ),
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
