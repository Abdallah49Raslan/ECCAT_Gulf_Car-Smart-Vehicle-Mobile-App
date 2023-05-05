import 'package:flutter/material.dart';

import '../core/colors.dart';
import '../core/text_style.dart';

typedef OnChangedCallback = Function(String);

class UserRoleDropdown extends StatefulWidget {
  final String? selectedOption;
  final OnChangedCallback? onChanged;
  final String? Function(String?)? validator;
  final List<String> options;
  final Widget? prefixIcon;
  final String hintTxt;

  UserRoleDropdown({
    Key? key,
    required this.options,
    this.selectedOption,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    required this.hintTxt,
  }) : super(key: key);

  @override
  _UserRoleDropdownState createState() => _UserRoleDropdownState();
}

class _UserRoleDropdownState extends State<UserRoleDropdown> {
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: blackTextFild,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              value: selectedOption ?? null,
              onChanged: (newValue) {
                setState(() {
                  selectedOption = newValue;
                  widget.onChanged?.call(newValue!);
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your role';
                }
                return widget.validator?.call(value);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintTxt,
                hintStyle: hintStyle,
                prefixIcon: widget.prefixIcon,
                errorStyle: const TextStyle(color: Colors.red),
              ),
              items: widget.options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
