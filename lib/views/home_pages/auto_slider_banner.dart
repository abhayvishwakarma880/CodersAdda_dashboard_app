// import 'dart:async';

// import 'package:coders_adda_app/models/home_model.dart';
// import 'package:coders_adda_app/services/navigation_service.dart';
// import 'package:coders_adda_app/utils/app_colors/app_theme.dart';
// import 'package:coders_adda_app/utils/app_sizer/app_sizer.dart';
// import 'package:coders_adda_app/views/subscription_pages/subscrption_page.dart';
// import 'package:flutter/material.dart';

// class BannerSliderWidget extends StatefulWidget {
//   final List<BannerItem> banners;

//   const BannerSliderWidget({Key? key, required this.banners}) : super(key: key);

//   @override
//   State<BannerSliderWidget> createState() => _BannerSliderWidgetState();
// }

// class _BannerSliderWidgetState extends State<BannerSliderWidget> {
//   late PageController _pageController;
//   int _currentPage = 0;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//     _startAutoSlide();
//   }

//   void _startAutoSlide() {
//     _timer = Timer.periodic(Duration(seconds: 3), (timer) {
//       if (_currentPage < widget.banners.length - 1) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }
      
//       if (_pageController.hasClients) {
//         _pageController.animateToPage(
//           _currentPage,
//           duration: Duration(milliseconds: 350),
//           curve: Curves.easeInOut,
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: AppSizer.deviceHeight20,
//           child: PageView.builder(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentPage = index;
//               });
//             },
//             itemCount: widget.banners.length,
//             itemBuilder: (context, index) {
//               final banner = widget.banners[index];
//               return GestureDetector(
//                 onTap: () {
//                   NavigationService.navigateTo(context, SubscriptionPage());
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: AppSizer.deviceWidth1),
//                   child: Card(
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(AppSizer.deviceWidth4),
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [AppColors.primaryColor, AppColors.accentColor],
//                         ),
//                         borderRadius: BorderRadius.circular(AppSizer.deviceWidth4),
//                       ),
//                       padding: EdgeInsets.all(AppSizer.deviceWidth5),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             banner.title,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: AppSizer.deviceSp18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: AppSizer.deviceHeight1),
//                           Text(
//                             banner.subtitle,
//                             style: TextStyle(
//                               color: Colors.white70,
//                               fontSize: AppSizer.deviceSp12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         SizedBox(height: AppSizer.deviceHeight1),
//         // Dots Indicator
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(
//             widget.banners.length,
//             (index) => AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               margin: EdgeInsets.symmetric(horizontal: 4),
//               height: 8,
//               width: _currentPage == index ? 24 : 8,
//               decoration: BoxDecoration(
//                 color: _currentPage == index
//                     ? AppColors.primaryColor
//                     : Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:async';

import 'package:coders_adda_app/models/home_model.dart';
import 'package:coders_adda_app/services/navigation_service.dart';
import 'package:coders_adda_app/utils/app_colors/app_theme.dart';
import 'package:coders_adda_app/utils/app_sizer/app_sizer.dart';
import 'package:coders_adda_app/views/subscription_pages/subscrption_page.dart';
import 'package:flutter/material.dart';

class BannerSliderWidget extends StatefulWidget {
  final List<BannerItem> banners;

  const BannerSliderWidget({Key? key, required this.banners}) : super(key: key);

  @override
  State<BannerSliderWidget> createState() => _BannerSliderWidgetState();
}

class _BannerSliderWidgetState extends State<BannerSliderWidget> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < widget.banners.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizer.deviceHeight20,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: widget.banners.length,
            itemBuilder: (context, index) {
              final banner = widget.banners[index];
              return GestureDetector(
                onTap: () {
                  NavigationService.navigateTo(context, SubscriptionPage());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizer.deviceWidth1),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizer.deviceWidth4),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizer.deviceWidth4),
                      ),
                      child: Stack(
                        children: [
                          // Background Image or Gradient
                          if (banner.imageUrl != null && banner.imageUrl!.isNotEmpty)
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSizer.deviceWidth4),
                                image: DecorationImage(
                                  image: NetworkImage(banner.imageUrl!), // Changed to NetworkImage
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          else
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSizer.deviceWidth4),
                                gradient: LinearGradient(
                                  colors: [AppColors.primaryColor, AppColors.accentColor],
                                ),
                              ),
                            ),
                          
                          // Gradient Overlay for better text readability (only when image exists)
                          if (banner.imageUrl != null && banner.imageUrl!.isNotEmpty)
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSizer.deviceWidth4),
                                // gradient: LinearGradient(
                                //   begin: Alignment.topCenter,
                                //   end: Alignment.bottomCenter,
                                //   colors: [
                                //     Colors.transparent,
                                //     Colors.black.withOpacity(0.7),
                                //   ],
                                // ),
                              ),
                            ),
                          
                          // Text Content
                          // Padding(
                          //   padding: EdgeInsets.all(AppSizer.deviceWidth5),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         banner.title,
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: AppSizer.deviceSp18,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //       SizedBox(height: AppSizer.deviceHeight1),
                          //       Text(
                          //         banner.subtitle,
                          //         style: TextStyle(
                          //           color: Colors.white70,
                          //           fontSize: AppSizer.deviceSp12,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: AppSizer.deviceHeight1),
        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.banners.length,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentPage == index ? 24 : 8,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? AppColors.primaryColor
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}