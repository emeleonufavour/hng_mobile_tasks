import 'package:flutter/material.dart';
import 'package:hng_2_task/core/core.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});
  static Future<void> show(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      barrierColor: Palette.transparent,
      barrierDismissible: false,
      builder: (context) => const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [LoadingWidget()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SizedBox(
          height: 150.h,
          width: 150.w,
          child: CircularProgressIndicator.adaptive()),
    );
  }
}
