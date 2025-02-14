
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



import '../theme/colors_app.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText; 
  final VoidCallback onPressed; 

  const CustomButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onPressed, // Use the provided onPressed action
        child: Container(
          width: size.width,
          height: 56,
          decoration: BoxDecoration(
            color: ColorsApp.secondColorLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              buttonText, // Use the provided button text
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}