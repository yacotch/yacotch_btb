import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trainee_restaurantapp/core/common/app_colors.dart';

class TextMessageWidget extends StatelessWidget {
  final bool isMyMessage;
  final String text;
  const TextMessageWidget({
    super.key,
    required this.isMyMessage,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          constraints: BoxConstraints(
            minWidth: 0.25.sw,
            maxWidth: 0.75.sw, // 70% of screen width
          ),
          margin: EdgeInsets.only(
              left: isMyMessage ? 2.w : 18.w, right: isMyMessage ? 18.w : 0),
          alignment: isMyMessage ? Alignment.centerLeft : Alignment.centerRight,
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
          decoration: BoxDecoration(
              color: isMyMessage ? Color(0xff56575C) : Color(0xff1D1E21),
              borderRadius: BorderRadius.circular(7.w)),
          child: Text(
            text.isEmpty
                ? "You can customize the messages and add more messages as needed to create different chat scenarios."
                : text
                    .trim(), // messages[index].message ?? "",           style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
