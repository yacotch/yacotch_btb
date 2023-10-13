import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/ui/widgets/change_language_button_text.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/common/style/gaps.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/ui/widgets/custom_button.dart';
import '../../../../../core/ui/widgets/custom_text.dart';

///this widget will have an appbar, a widget space, a button and an additional
/// bottom screen text

class GeneralAuthScreen extends StatefulWidget {
  final PreferredSizeWidget appBar;
  final String buttonText;
  final String additionalText;
  final String additionalTapText;
  final Widget child;
  final Function onButtonTap;
  final Function onAdditionalTextTapped;
  final bool isloading;

  const GeneralAuthScreen(
      {Key? key,
      required this.appBar,
      required this.buttonText,
      required this.additionalText,
      required this.additionalTapText,
      required this.child,
      required this.onButtonTap,
      required this.onAdditionalTextTapped,
      this.isloading = false})
      : super(key: key);

  @override
  _GeneralAuthScreenState createState() => _GeneralAuthScreenState();
}

class _GeneralAuthScreenState extends State<GeneralAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColorLight,
        extendBodyBehindAppBar: true,
        appBar: widget.appBar,
        body: _buildBody());
  }

  Widget _buildLogoWithBackgroundWidget() {
    return Container(
      width: 1.sw,
      height: 0.325.sh,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppConstants.CARD_IMG), fit: BoxFit.fill),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 48.h),
          child: SizedBox(
              width: 0.337.sw,
              child: Image.asset(AppConstants.APP_LOGO_IMG_HORIZONTAL)),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildLogoWithBackgroundWidget(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: widget.child,
              ),
              widget.isloading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 44.h,
                          width: 44.w,
                          child: const CircularProgressIndicator(
                            color: AppColors.accentColorLight,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300.w,
                          child: CustomElevatedButton(
                              onTap: () {
                                widget.onButtonTap();
                              },
                              text: widget.buttonText),
                        ),
                      ],
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: widget.additionalText,
                    fontSize: AppConstants.textSize12,
                  ),
                  Gaps.hGap4,
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      widget.onAdditionalTextTapped();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: CustomText(
                        text: widget.additionalTapText,
                        color: AppColors.accentColorLight,
                        fontSize: AppConstants.textSize14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const AuthChangeLanguageTextButton()
            ],
          ),
        )
      ],
    );
  }
}
