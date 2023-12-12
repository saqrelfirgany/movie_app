import 'package:bnoud/core/constatnts/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MainLoading extends StatelessWidget {
  const MainLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.threeArchedCircle(
      color: AppColors.fontColor,
      size: 40,
    );
  }
}

class CenterMainLoading extends StatelessWidget {
  const CenterMainLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MainLoading(),
    );
  }
}
