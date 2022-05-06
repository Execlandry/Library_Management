// ignore_for_file: prefer_const_literals_to_create_immutables


import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_management/controllers/LocalNavigation/navigation_controller.dart';
import 'package:library_management/controllers/menu_controller.dart';
import 'package:library_management/firebase_options.dart';
import 'package:library_management/main_page.dart';
import 'package:library_management/pages/dashboard/DisplayData/404/error.dart';
import 'package:library_management/pages/introUi/welcome_page.dart';
import 'package:library_management/routes/routes.dart';

import 'common/app_colors.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  Get.put(MenuController());
  Get.put(NavigationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: AnimatedSplashScreen(
      //     splash: Icons.home,
      //     duration: 1000,
      //     splashTransition: SplashTransition.scaleTransition,
      //     backgroundColor: Color.fromARGB(255, 126, 191, 245),
      //     nextScreen: WelcomePage()),
      home: MainPage(),
     
      unknownRoute: GetPage(
          name: AppRoutes.unknownRoute,
          page: () => PageNotFound(),
          transition: Transition.fadeIn),
      getPages: AppRoutes.routes,
      title: 'Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColor.light,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
          primaryColor: Colors.blue),
    );
  }

}
// class MainScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context,snapshot){
//         if(snapshot.hasData && snapshot.data !=null){
//           Get.offAllNamed(AppRoutes.homeRoute);
          
//         }
//         else{
//           Get.offAllNamed(AppRoutes.authenticationPageRoute);
//         }
//       }
//     );
//   }
// }
