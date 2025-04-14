import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final double? fontSize;
  final Color? color;
  final Color? textColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double? width;

  const AppButton({
    super.key,
    this.title,
    this.fontSize = 18,
    this.child,
    this.color,
    this.textColor = const Color.fromARGB(255, 3, 36, 183),
    this.borderRadius = 45,
    this.onTap,
    this.padding,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(68, 137, 255, 0.559),
      textStyle: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 99, 1, 1) ) ,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        // overlayColor: Colors.blueAccent,
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: child ??
            Text( '$title',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: fontSize,
                color: textColor,
              ),
            ),
        ),
      ),
    );
  }
}
