import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New order created',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkBlue,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'New Order created with Order',
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: AppColors.darkBlue.withOpacity(0.6),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    Text(
                      '09:00 AM',
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: AppColors.brightOrange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_forward,
                      size: 14,
                      color: AppColors.brightOrange,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          
              Container(
                clipBehavior: Clip.antiAlias,
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: AppColors.brightOrange,
                  shape: BoxShape.circle,
                  
                ),
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: SvgPicture.asset("assets/icons/Group 900.svg")),
                )
              ),
              
            
          
        ],
      ),
    );
  }
}

