import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

class SubscriptionsCard extends StatelessWidget {
  const SubscriptionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.goldenYellow,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* ---------------- LEFT SIDE ---------------- */

          Expanded(
            flex: 2,
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  child: SvgPicture.asset(
                    'assets/icons/subscriptions-illustration-image.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.brightBlue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Subscriptions',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          /* ---------------- RIGHT SIDE ---------------- */

          Expanded(
            flex: 3,
            child: SizedBox(
              height: 260,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  /* ---- BLUE CARD ---- */
                  Positioned(
                    top: -25,
                    right: 0,
                    child: Container(
                      width: 190,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
                      decoration: BoxDecoration(
                        color: AppColors.brightBlue,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '03 ',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'deliveries',
                              style: GoogleFonts.roboto(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                   /* ---- ACTIVE SUBSCRIPTIONS ---- */
                  const Positioned(
                    top: 62,
                    right: 6,
                    child: SizedBox(
                      height: 90,
                      width: 160,
                      child: _InfoCard(
                        value: '10',
                        label: 'Active\nSubscriptions',
                      ),
                    ),
                  ),

                  /* ---- AVATARS (CONNECTED TO BLUE CARD) ---- */
                 const Positioned(
                    top: 32, // 🔥 key value
                    right: 32,
                    child: SizedBox(
                      height: 44,
                      width: 120,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: const [
                          _ProfileAvatar(left: 0),
                          _ProfileAvatar(left: 30),
                          _ProfileAvatar(left: 60),
                        ],
                      ),
                    ),
                  ),

                 

                  /* ---- PENDING DELIVERIES ---- */
                  const Positioned(
                    top: 154,
                    right: 6,
                    child: _InfoCard(
                      value: '119',
                      label: 'Pending\nDeliveries',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------- PROFILE AVATAR ---------------- */

class _ProfileAvatar extends StatelessWidget {
  final double left;

  const _ProfileAvatar({required this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
          image: const DecorationImage(
            image: AssetImage('assets/icons/Screenshot 2026-01-05 221115.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

/* ---------------- INFO CARD ---------------- */

class _InfoCard extends StatelessWidget {
  final String value;
  final String label;

  const _InfoCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            value,
            style: GoogleFonts.roboto(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.darkBlue,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: AppColors.darkBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
