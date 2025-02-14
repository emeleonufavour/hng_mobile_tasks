import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hng_2_task/core/core.dart';

class BottomSheetBackButton extends StatelessWidget {
  const BottomSheetBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: context.read<ThemeProvider>().isDarkMode
              ? Palette.grey500
              : Palette.grey300,
          borderRadius: BorderRadius.circular(4)),
      child: GestureDetector(
        child: Icon(
          Icons.close,
          color: Palette.grey400,
          size: 16,
        ),
        onTap: () => goBack(),
      ),
    );
  }
}
