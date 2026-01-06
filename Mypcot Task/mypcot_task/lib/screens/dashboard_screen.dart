import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/top_bar.dart';
import '../widgets/welcome_section.dart';
import '../widgets/dashboard_cards/orders_card.dart';
import '../widgets/dashboard_cards/subscriptions_card.dart';
import '../widgets/dashboard_cards/customers_card.dart';
import '../widgets/timeline_section.dart';
import '../widgets/activity_card.dart';
import '../constants/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentCarouselIndex = 0;
  late double screenWidth;
  late double screenHeight;
  late double carouselHeight;
  late double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    carouselHeight = screenHeight * 0.35;
    horizontalPadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            const WelcomeSection(),
                            SizedBox(height: screenHeight * 0.03),
                            _buildCarouselSection(),
                            SizedBox(height: screenHeight * 0.01),
                            _buildPageIndicators(),
                            SizedBox(height: screenHeight * 0.02),
                            const TimelineSection(),
                            const ActivityCard(),
                            SizedBox(height: screenHeight * 0.03),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselSection() {
    return SizedBox(
      height: carouselHeight,
      child: CarouselSlider(
        options: CarouselOptions(
          height: carouselHeight,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentCarouselIndex = index;
            });
          },
        ),
        items: const [
          OrdersCard(),
          SubscriptionsCard(),
          CustomersCard(),
        ],
      ),
    );
  }

  Widget _buildPageIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: _currentCarouselIndex == index ? 24 : 8,
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
          decoration: BoxDecoration(
            color: _currentCarouselIndex == index
                ? AppColors.darkBlue
                : AppColors.darkBlue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
