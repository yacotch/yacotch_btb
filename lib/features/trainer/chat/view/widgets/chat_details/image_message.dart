import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageMessageWidget extends StatelessWidget {
  final String image;
  final bool isMyMessage;
  const ImageMessageWidget({
    super.key,
    required this.image,
    required this.isMyMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      alignment: isMyMessage ? Alignment.centerLeft : Alignment.centerRight,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 0.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.w)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.w),
        child: Image.network(image),
      ),
    );
  }
}
