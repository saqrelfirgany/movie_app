import 'package:bnoud/core/constatnts/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/theme_helper.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../core/widgets/custom_image_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Define the initial and final positions of the image and the text
  double imageLeft = -216.0; // The width of the image
  double imageTop = 0.0;
  double textRight = -216.0; // The width of the text
  double textTop = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      navigateToNextScreen();
    });
    // Start the animation after a short delay
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        // Set the final positions to the center of the screen
        imageLeft = (mediaQueryData.size.width - 216.h) / 2; // Subtract the width of the image and divide by 2
        imageTop = (mediaQueryData.size.height - 192.v) / 2; // Subtract the height of the image and divide by 2
        textRight = (mediaQueryData.size.width - 290.h) / 2; // Subtract the width of the text and divide by 2
        textTop = imageTop + 192.v + 9.v; // Add the height of the image and the vertical space
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Stack(
        children: [
          AnimatedPositioned(
            // Use the left and top properties for the image
            left: imageLeft,
            top: 157.v,
            duration: const Duration(milliseconds: 1600),
            curve: Curves.easeOut,
            child: Center(
              child: CustomImageView(
                imagePath: ImageConstant.splash,
                height: 192.v,
                width: 216.h,
              ),
            ),
          ),
          AnimatedPositioned(
            // Use the right and top properties for the text
            right: textRight,
            top: 350.v,
            duration: const Duration(milliseconds: 1600),
            curve: Curves.easeOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Movie",
                  style: theme.textTheme.displayMedium!.copyWith(color: Colors.white),
                ),
                SizedBox(height: 9.v),
                Text(
                  "Watch & learn",
                  style: theme.textTheme.headlineSmall!.copyWith(color: Colors.white),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> navigateToNextScreen() async {
    context.go(AppRouteName.homeScreenRoute);
  }
}
