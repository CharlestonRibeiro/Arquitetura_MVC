
import 'package:arquitetura_mvc/src/core/images/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height * 0.3023,
    
      child: Image.asset(
        CustomImages.imageAppBar, 
        fit: BoxFit.cover,
      ),
    );
  }
}