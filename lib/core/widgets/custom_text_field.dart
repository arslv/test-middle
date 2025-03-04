import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String title;
  final bool obscureText;
  final IconData? prefixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.title,
    this.obscureText = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F).withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF1F1F1F).withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF87858F),
            ),
          ),
          CupertinoTextField(
            controller: controller,
            placeholder: placeholder,
            placeholderStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF87858F),
            ),
            prefix: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Icon(
                      prefixIcon,
                      color: const Color(0xFF666666),
                    ),
                  )
                : null,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF87858F),
            ),
            padding: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xff87858F), width: 0.3))
            ),
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}
