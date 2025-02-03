import 'package:flutter/material.dart';
import 'package:hng_1_task/features/features.dart';

class PageTextField extends StatelessWidget {
  final String message;
  final TextEditingController controller;
  final FocusNode focusNode;
  final PageType pageType;
  final Function(String)? onSubmitted;
  const PageTextField(
      {required this.message,
      required this.controller,
      required this.focusNode,
      required this.pageType,
      this.onSubmitted,
      super.key});

  @override
  Widget build(BuildContext context) {
    final mainColor =
        pageType == PageType.encrypt ? Colors.grey.shade400 : Colors.white;
    const secondaryColor = Colors.white;
    return TextFormField(
      controller: controller,
      cursorColor: secondaryColor,
      style: const TextStyle(color: secondaryColor),
      decoration: InputDecoration(
          hintText: message,
          hintStyle: TextStyle(color: mainColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: mainColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: secondaryColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: mainColor))),
      onFieldSubmitted: onSubmitted,
    );
  }
}
