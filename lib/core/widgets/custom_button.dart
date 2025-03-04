import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color textColor;
  final bool isLoading;
  final double height;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor = CupertinoColors.white,
    this.isLoading = false,
    this.height = 56,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CupertinoButton(
        onPressed: isLoading ? null : onPressed,
        padding: EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor == null
                ? const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF8924E7),
                      Color(0xFF6A46F9),
                    ],
                  )
                : null,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: isOutlined
                ? Border.all(
                    color: backgroundColor ?? const Color(0xFF8924E7),
                    width: 1.5,
                  )
                : null,
          ),
          child: Center(
            child: isLoading
                ? const CupertinoActivityIndicator(color: CupertinoColors.white)
                : Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
} 