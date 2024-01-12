import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinPut extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;

  const CustomPinPut(
      {Key? key, required this.controller, this.focusNode, this.onChanged})
      : super(key: key);

 


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        controller: controller,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        focusNode: focusNode,
        cursorColor: Colors.white,

        enableActiveFill: true,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          selectedFillColor: Colors.transparent,
          selectedColor: Colors.white,
          borderWidth: 1,
          fieldWidth: 50,
          inactiveFillColor: Colors.black,
          inactiveColor: Colors.white,
          disabledColor: Colors.transparent,
          activeFillColor: Colors.black,
          activeColor: Colors.brown,
        ),
        animationDuration: const Duration(milliseconds: 300),
        textStyle: const TextStyle(fontSize: 20, height: 1.6),
        backgroundColor: Colors.transparent,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        validator: (text) {
        },
        appContext: context,
        length: 6,
        onChanged: (String value) {
          onChanged!(value);
        },
      ),
    );
  }
}
