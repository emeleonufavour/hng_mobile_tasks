import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_0_task/features/features.dart';

class Button extends StatefulWidget {
  Button({
    super.key,
    this.text,
    required this.onTap,
    this.color,
    this.textSize = 16,
    this.height,
    this.width,
    this.useHeightOrWidth = true,
    this.textFontWeight = FontWeight.w500,
  }) : textStyle = TextStyle(
            fontSize: textSize,
            fontWeight: textFontWeight,
            color: Colors.white);

  final String? text;
  final TextStyle textStyle;
  final void Function()? onTap;
  final Color? color;
  final double? textSize;
  final double? height;
  final double? width;
  final FontWeight? textFontWeight;
  final bool? useHeightOrWidth;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    double buttonHeight = (screenHeight * 0.07);
    double buttonWidth = (screenWidth * 0.95);

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        HapticFeedback.lightImpact();
        if (widget.onTap != null) widget.onTap!();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          margin: EdgeInsets.only(bottom: screenHeight * 0.03),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Palette.primaryColor,
          ),
          child: Center(
              child: Text(
            widget.text ?? "",
            style: widget.textStyle,
          )),
        ),
      ),
    );
  }
}
