import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? prefix;
  final Widget? suffix;
  final bool centerTitle;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.prefix,
    this.suffix,
    this.centerTitle = true,
    this.backgroundColor = const Color(0xFF1F1F1F),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE3E3E3).withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 40,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0xFF604490).withOpacity(0.3),
            offset: const Offset(0, -82),
            blurRadius: 68,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0xFF604490).withOpacity(0.3),
            offset: const Offset(0, -64),
            blurRadius: 68,
            spreadRadius: -64,
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (prefix != null)
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: prefix!,
                )
              else
                const SizedBox(width: 48),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                ),
              ),
              if (suffix != null)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: suffix!,
                )
              else
                const SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
