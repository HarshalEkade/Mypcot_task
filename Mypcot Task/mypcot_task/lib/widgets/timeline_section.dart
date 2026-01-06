import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'January, 23 2021',
            style: GoogleFonts.roboto(
              fontSize: 15,
              color: AppColors.darkBlue.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Today',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue,
                ),
              ),
              const SizedBox(width: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'TIMELINE',
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                      color: AppColors.darkBlue,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: AppColors.darkBlue,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'JAN, 2021',
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Week view
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDayItem('MON', '20', false),
              _buildDayItem('TUE', '21', false),
              _buildDayItem('WED', '22', false),
              _buildDayItem('THU', '23', true), // Today
              _buildDayItem('FRI', '24', false),
              _buildDayItem('SAT', '25', false),
              _buildDayItem('SUN', '26', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayItem(String day, String date, bool isToday) {
    return Column(
      children: [
        Text(
          day,
          style: GoogleFonts.roboto(
            fontSize: 13,
            color: isToday ? AppColors.brightGreen : AppColors.darkBlue.withOpacity(0.5),
            fontWeight: isToday ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          date,
          style: GoogleFonts.roboto(
            fontSize: 15,
            color: isToday ? AppColors.brightGreen : AppColors.darkBlue.withOpacity(0.5),
            fontWeight: isToday ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        if (isToday)
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.brightGreen,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}

