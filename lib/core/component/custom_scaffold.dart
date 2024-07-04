import 'package:flutter/material.dart';
import 'package:grapegrow_apps/core/constants/colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? appBarTitle;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showBackButton;
  final double toolbarHeight;

  const CustomScaffold({
    super.key,
    this.appBarTitle,
    this.actions,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showBackButton = true,
    this.toolbarHeight = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: appBarTitle,
        actions: actions,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}