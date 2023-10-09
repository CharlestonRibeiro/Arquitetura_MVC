import 'package:arquitetura_mvc/src/core/routes/custom_routes.dart';
import 'package:arquitetura_mvc/src/core/themes/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class AppMvc extends StatelessWidget {
  const AppMvc({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Arquitetura MVC',
      debugShowCheckedModeBanner: false,
      theme: customTheme(),
      getPages: customRoutes,
    );
  }
}
