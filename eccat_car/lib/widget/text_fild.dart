import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/colors.dart';
import '../core/text_style.dart';

typedef OnChangedCallback = Function(String);

Widget textField({
  required TextEditingController controller,
  String? Function(String?)? validator,
  OnChangedCallback? onChanged,
  required String hintTxt,
  String? image,
  bool isObs = false,
  TextInputType? keyboardType,
  Widget? prefixIcon,
  bool enabled = false,
}) {
  return Container(
    height: 60.0,
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    margin: const EdgeInsets.symmetric(
      horizontal: 8.0,
      vertical: 8.0,
    ),
    decoration: BoxDecoration(
      color: blackTextFild,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: hintStyle,
              prefixIcon:
                  prefixIcon, // Add prefixIcon parameter to InputDecoration
              errorStyle: TextStyle(color: Colors.red),
            ),
            style: headline2,
          ),
        ),
        if (image != null)
          SvgPicture.asset(
            'assets/icon/$image',
            height: 22,
            color: grayText,
          ),
      ],
    ),
  );
}
