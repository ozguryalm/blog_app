import 'app/controllers/blog_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'app/data/services/dependency_injection.dart';
import 'app/data/services/translations_service.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/ui/layouts/main/main_layout.dart';
import 'app/ui/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  DependecyInjection.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();

   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BlogController());
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        themeMode: ThemeMode.system,
        translations: Translation(),
        locale:const Locale('en'),
        fallbackLocale:const Locale('en'),
        initialRoute:
            box.read("token") == null ? AppRoutes.LOGIN : AppRoutes.MAIN,
        unknownRoute: AppPages.unknownRoutePage,
        getPages: AppPages.pages,
        builder: (_, child) {
          return MainLayout(child: child!);
        },
      );
    });
  }
}
