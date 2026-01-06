// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// const Color _cardColor = Color(0xFF00BCD4);
// const Color _buttonColor = Color(0xFF3F51B5);

// class OrdersCard extends StatelessWidget {
//   const OrdersCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: _cardColor,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header with title and status
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Orders',
//                 style: GoogleFonts.roboto(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               // Status badge
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       width: 8,
//                       height: 8,
//                       margin: const EdgeInsets.only(right: 6),
//                       decoration: const BoxDecoration(
//                         color: Colors.green,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                     Text(
//                       'Active Orders',
//                       style: GoogleFonts.roboto(
//                         color: _cardColor,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 20),

//           // Active orders section
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: _buttonColor,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '3 Active orders from',
//                   style: GoogleFonts.roboto(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     _buildProfileAvatar(Colors.purple),
//                     const SizedBox(width: 8),
//                     _buildProfileAvatar(Colors.orange),
//                     const SizedBox(width: 8),
//                     _buildProfileAvatar(Colors.blue),
//                     const SizedBox(width: 8),
//                     Container(
//                       width: 30,
//                       height: 30,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.add,
//                         size: 16,
//                         color: _buttonColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 8),

//           // Pending orders section
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '02 Pending orders from',
//                   style: GoogleFonts.roboto(
//                     color: _buttonColor,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     _buildProfileAvatar(Colors.pink),
//                     const SizedBox(width: 8),
//                     _buildProfileAvatar(Colors.amber),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 16),

//           // View Orders button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: _buttonColor,
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 elevation: 0,
//               ),
//               child: Text(
//                 'View Orders',
//                 style: GoogleFonts.roboto(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProfileAvatar(Color color) {
//     return Container(
//       width: 36,
//       height: 36,
//       decoration: BoxDecoration(
//         color: color,
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.white, width: 2),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

const Color _bgColor = Color(0xFF2FA4CC);
const Color _activeCardColor = Color(0xFFE46A3A);
const Color _textDark = Color(0xFF2C3E50);

class OrdersCard extends StatelessWidget {
  const OrdersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          /* ---------------- LEFT ILLUSTRATION ---------------- */

          Expanded(
            flex: 2,
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: SvgPicture.asset(
                    'assets/icons/orders-illustration-image.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: _activeCardColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    'Orders',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          /* ---------------- RIGHT FLOATING CARDS ---------------- */

          Expanded(
            flex: 3,
            child: SizedBox(
              height: 220,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  /* ---- ACTIVE ORDERS (ORANGE CAP) ---- */
                  Positioned(
                    top: -20,
                    right: 0,
                    child: Container(
                      width: 190,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 34),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE46A3A),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'You have 3 active\norders from',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),

                  /* ---- AVATARS (ATTACHED TO CARD) ---- */
                  const Positioned(
                    top: 44, // 🔥 touches the card
                    right: 34,
                    child: SizedBox(
                      width: 130,
                      height: 44,
                      child: Stack(
                        children: [
                          _Avatar(left: 0),
                          _Avatar(left: 36),
                          _Avatar(left: 72),
                        ],
                      ),
                    ),
                  ),

                  /* ---- PENDING ORDERS (WHITE CARD) ---- */
                  Positioned(
                    top: 94,
                    right: 12,
                    child: Container(
                      width: 170,
                      padding: const EdgeInsets.all(14),
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
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🔥 HEADER ROW
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Big count
                              const Text(
                                '02',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3E50),
                                ),
                              ),
                              const SizedBox(width: 8),

                              // Text block
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pending',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  Text(
                                    'Orders from',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF2C3E50),
                                      height: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // 🔥 AVATARS
                          const SizedBox(
                            height: 32,
                            child: Stack(
                              children: [
                                _Avatar(left: 30,top: 20,),
                                _Avatar(left: 60),
                              ],
                            ),
                          ),
                        ],
                      ),
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

/* ---------------- AVATAR ---------------- */

class _Avatar extends StatelessWidget {
  final double left;
  final double? top; // optional

  const _Avatar({
    required this.left,
    this.top,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          image: const DecorationImage(
            image: AssetImage('assets/icons/Screenshot 2026-01-05 223110.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
