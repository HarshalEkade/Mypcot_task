import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final titleFontSize = screenWidth * 0.065;
    final subtitleFontSize = screenWidth * 0.038;
    final avatarSize = screenWidth * 0.14;
    final horizontalPadding = screenWidth * 0.05;
    final topPadding = screenHeight * 0.025;
    final textSpacing = screenHeight * 0.007;

    return Padding(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        top: topPadding,
        right: horizontalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Welcome, Mypcot !!',
                    style: GoogleFonts.roboto(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                      height: 1.2,
                    ),
                  ),
                ),
                SizedBox(height: textSpacing),
                Text(
                  'here is your dashboard....',
                  style: GoogleFonts.roboto(
                    fontSize: subtitleFontSize,
                    color: AppColors.darkBlue.withOpacity(0.6),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: SvgPicture.asset(
                "assets/icons/Group 922.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
