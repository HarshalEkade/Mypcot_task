import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomersCard extends StatelessWidget {
  const CustomersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF4CAF50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ---------------- LEFT SIDE ----------------
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    'assets/icons/customers-illustration-image.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE91E63),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'View Customers',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// ---------------- RIGHT STACK ----------------
          Expanded(
            flex: 5,
            child: SizedBox(
              height: 260,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  /// ---- PINK CARD (UNCHANGED) ----
                  Positioned(
                    top: -25,
                    right: 0,
                    child: Container(
                      width: 190,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE91E63),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '15 ',
                              style: GoogleFonts.roboto(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'New Customers',
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
                   const Positioned(
                    top: 61,
                    right: 0,
                    child: const _StatCard(
                      title: '1.8%',
                      subtitle: 'Growth',
                      showGraph: true,
                    ),
                  ),

                  /// ---- AVATARS + PLUS ----
                  const Positioned(
                    top: 33,
                    right: 32,
                    child: SizedBox(
                      height: 44,
                      width: 150,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          _ProfileAvatar(left: 0),
                          _ProfileAvatar(left: 30),
                          _ProfileAvatar(left: 60),
                          _PlusAvatar(left: 90),
                        ],
                      ),
                    ),
                  ),

                  /// ---- 1.8% GROWTH CARD ----
                 const Positioned(
                    top: 62,
                    right: 0,
                    child: const _StatCard(
                      title: '1.8%',
                      subtitle: 'Growth',
                      showGraph: true,
                    ),
                  ),

                  /// ---- 10 ACTIVE CUSTOMERS (OVERLAP) ----
                 const Positioned(
                    top: 160,
                    right: 20,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const _StatCard(
                          title: '10',
                          subtitle: 'Active',
                        ),

                        /// mini avatars outside card
                        Positioned(
                          right: -42,
                          top: 22,
                          child: SizedBox(
                            width: 80,
                            height: 25,
                            child: Stack(
                              children: const [
                                _MiniAvatar(left: 0),
                                _MiniAvatar(left: 20),
                                _MiniAvatar(left: 40),
                              ],
                            ),
                          ),
                        ),
                      ],
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

/// ---------------- PROFILE AVATAR ----------------
class _ProfileAvatar extends StatelessWidget {
  final double left;

  const _ProfileAvatar({required this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: -12,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
          image: const DecorationImage(
            image: AssetImage(
              'assets/icons/Screenshot 2026-01-05 221115.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

/// ---------------- PLUS AVATAR ----------------
class _PlusAvatar extends StatelessWidget {
  final double left;

  const _PlusAvatar({required this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: -12,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 3),
        ),
        child: const Icon(Icons.add, size: 20),
      ),
    );
  }
}

/// ---------------- MINI AVATAR ----------------
class _MiniAvatar extends StatelessWidget {
  final double left;

  const _MiniAvatar({required this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          image: const DecorationImage(
            image: AssetImage(
              'assets/icons/Screenshot 2026-01-05 221115.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

/// ---------------- STAT CARD ----------------
class _StatCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showGraph;

  const _StatCard({
    required this.title,
    required this.subtitle,
    this.showGraph = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          if (showGraph) ...[
            const SizedBox(height: 0),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                'assets/icons/graph.png',
                height: 30,
                width: 200, // 🔥 slightly smaller
                fit: BoxFit.fill,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
