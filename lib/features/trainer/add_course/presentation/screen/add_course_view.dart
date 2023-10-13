// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';
import 'package:trainee_restaurantapp/core/common/validators.dart';
import 'package:trainee_restaurantapp/core/constants/app/app_constants.dart';
import 'package:trainee_restaurantapp/core/localization/language_helper.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_button.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/custom_text.dart';
import 'package:trainee_restaurantapp/features/trainer/add_course/presentation/controller/add_course_cubit.dart';
import 'package:trainee_restaurantapp/features/trainer/add_course/presentation/widgets/add_course_image.dart';

import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/models/categories_model.dart';
import '../../../../../core/ui/widgets/custom_text_field.dart';

class AddCourseView extends StatefulWidget {
  const AddCourseView({super.key});

  @override
  State<AddCourseView> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends State<AddCourseView> {
  @override
  Widget build(BuildContext context) {
    var trans = LanguageHelper.getTranslation(context);
    return BlocProvider(
      create: (context) => AddCourseCubit()..getCategories(),
      child: BlocBuilder<AddCourseCubit, AddCourseState>(
        buildWhen: (previous, current) =>
            previous != current ||
            current is AddCourseLoading ||
            current is UploadSignUpFileState,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: AddCourseCubit.of(context).formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AddCourseScreenTitleWidget(),
                        Gaps.vGap16,
                        const CourseArabicNameField(),
                        Gaps.vGap16,
                        const CourseEnglishNameField(),
                        Gaps.vGap16,
                        const CourseImageWidget(),
                        Gaps.vGap16,
                        DropdownButton<Items>(
                          isExpanded: true,
                          value: AddCourseCubit.of(context).dropdownValueCate,
                          hint: Text(
                            trans.choose_category,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          dropdownColor: Colors.grey,
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (Items? value) {
                            setState(() {
                              AddCourseCubit.of(context).dropdownValueCate =
                                  value!;
                            });
                          },
                          items: AddCourseCubit.of(context)
                              .listOfCates
                              .map<DropdownMenuItem<Items>>((Items value) {
                            return DropdownMenuItem<Items>(
                              value: value,
                              child: Text(
                                value.name ?? '',
                              ),
                            );
                          }).toList(),
                        ),
                        Gaps.vGap16,
                        const CoursePriceWidget(),
                        Gaps.vGap16,
                        const CourseDiscountPercentage(),
                        Gaps.vGap16,
                        const CourseHoursNumber(),
                        Gaps.vGap16,
                        const CourseArabicDescription(),
                        Gaps.vGap16,
                        const CourseEnglishDescription(),
                        Gaps.vGap16,
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 45.0,
                              horizontal: 20,
                            ),
                            child: CustomElevatedButton(
                              borderRadius: 12,
                              onTap: () {
                                if (AddCourseCubit.of(context).file == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text(trans.choose_course_img)));
                                } else {
                                  AddCourseCubit.of(context).addCourse(context);
                                }
                              },
                              text: LanguageHelper.getTranslation(context).add,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CoursePriceWidget extends StatelessWidget {
  const CoursePriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      text: LanguageHelper.getTranslation(context).enter_course_price,
      validator: (input) => Validators.isNumber(input!, context),
      keboardType: TextInputType.number,
      onFiledSubmitted: () {
        FocusScope.of(context).requestFocus(
            AddCourseCubit.of(context).discountPercentageFocusNode);
      },
      textInputAction: TextInputAction.next,
      controller: AddCourseCubit.of(context).feeController,
      focusNode: AddCourseCubit.of(context).feeFocusNode,
    );
  }
}

class CourseEnglishDescription extends StatelessWidget {
  const CourseEnglishDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      validator: (input) => !Validators.isEnglish(input!)
          ? LanguageHelper.getTranslation(context).enter_eng_letters
          : null,
      text: LanguageHelper.getTranslation(context).course_details_en,
      onFiledSubmitted: () {
        // FocusScope.of(context).requestFocus(passwordFocusNode);
      },
      textInputAction: TextInputAction.next,
      controller: AddCourseCubit.of(context).enDescriptionController,
      focusNode: AddCourseCubit.of(context).enDescriptionFocusNode,
    );
  }
}

class CourseArabicDescription extends StatelessWidget {
  const CourseArabicDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      text: LanguageHelper.getTranslation(context).course_details_ar,
      validator: (input) => !Validators.isArabic(input!)
          ? LanguageHelper.getTranslation(context).enter_at_letters
          : null,
      onFiledSubmitted: () {
        FocusScope.of(context)
            .requestFocus(AddCourseCubit.of(context).enDescriptionFocusNode);
      },
      textInputAction: TextInputAction.next,
      controller: AddCourseCubit.of(context).arDescriptionController,
      focusNode: AddCourseCubit.of(context).arDescriptionFocusNode,
    );
  }
}

class CourseDiscountPercentage extends StatelessWidget {
  const CourseDiscountPercentage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      text: LanguageHelper.getTranslation(context).discount_perc,
      validator: (input) => Validators.isNumber(input!, context),
      keboardType: TextInputType.number,
      onFiledSubmitted: () {
        FocusScope.of(context).requestFocus(
            AddCourseCubit.of(context).trainingHoursCountFocusNode);
      },
      textInputAction: TextInputAction.next,
      controller: AddCourseCubit.of(context).discountPercentageController,
      focusNode: AddCourseCubit.of(context).discountPercentageFocusNode,
    );
  }
}

class CourseHoursNumber extends StatelessWidget {
  const CourseHoursNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      text: LanguageHelper.getTranslation(context).hours_num,
      validator: (input) => Validators.isNumber(input!, context),
      keboardType: TextInputType.number,
      onFiledSubmitted: () {
        FocusScope.of(context)
            .requestFocus(AddCourseCubit.of(context).arDescriptionFocusNode);
      },
      textInputAction: TextInputAction.next,
      controller: AddCourseCubit.of(context).trainingHoursCountController,
      focusNode: AddCourseCubit.of(context).trainingHoursCountFocusNode,
    );
  }
}

class CourseImageWidget extends StatelessWidget {
  const CourseImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AddCourseImageWidget(
      text: LanguageHelper.getTranslation(context).enter_related_img,
      onTap: () async => AddCourseCubit.of(context).file =
          await AddCourseCubit.of(context).getFile(),
    );
  }
}

class CourseEnglishNameField extends StatelessWidget {
  const CourseEnglishNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      text: LanguageHelper.getTranslation(context).en_course_name,
      validator: (input) => !Validators.isEnglish(input!)
          ? LanguageHelper.getTranslation(context).enter_eng_letters
          : null,
      onFiledSubmitted: () {
        FocusScope.of(context)
            .requestFocus(AddCourseCubit.of(context).feeFocusNode);
      },
      textInputAction: TextInputAction.next,
      controller: AddCourseCubit.of(context).enNameController,
      focusNode: AddCourseCubit.of(context).enNameFocusNode,
    );
  }
}

class CourseArabicNameField extends StatelessWidget {
  const CourseArabicNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      text: LanguageHelper.getTranslation(context).ar_course_name,
      validator: (input) => !Validators.isArabic(input!)
          ? LanguageHelper.getTranslation(context).enter_at_letters
          : null,
      onFiledSubmitted: () {
        FocusScope.of(context)
            .requestFocus(AddCourseCubit.of(context).enNameFocusNode);
      },
      textInputAction: TextInputAction.next,
      controller: AddCourseCubit.of(context).arNameController,
      focusNode: AddCourseCubit.of(context).arNameFocusNode,
    );
  }
}

class AddCourseScreenTitleWidget extends StatelessWidget {
  const AddCourseScreenTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: LanguageHelper.getTranslation(context).add_course,
      color: AppColors.white,
      fontWeight: FontWeight.w600,
      fontSize: AppConstants.textSize18,
    );
  }
}
