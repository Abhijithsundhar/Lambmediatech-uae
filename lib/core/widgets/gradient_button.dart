import 'package:flutter/material.dart';

import '../palette.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String text;
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Palette.gradient1,
            Palette.gradient2,
            Palette.gradient3,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: isLoading ? null : const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: isLoading
            ? const Padding(
                padding:
                    EdgeInsets.only(left: 8.0, right: 8.0, top: 5, bottom: 5),
                child: CircularProgressIndicator(),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
      ),
    );
  }
}
