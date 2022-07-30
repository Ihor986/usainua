import 'package:flutter/material.dart';
import 'package:usainua/utils/app_images.dart';

class FirstPageProBoxScreen extends StatelessWidget {
  const FirstPageProBoxScreen({Key? key}) : super(key: key);
  static const routeName = '/FirstPageProBoxScreen';

  @override
  Widget build(BuildContext context) {
    // final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: AppColors.white,
      //     elevation: 0,
      //     leading: IconButton(
      //       onPressed: () {},
      //       icon: SvgPicture.asset(
      //         AppIcons.notification,
      //         color: AppColors.textColor,
      //       ),
      //     ),
      //     title: SvgPicture.asset(
      //       AppImages.logo,
      //       width: screen.width * 0.4,
      //     ),
      //     centerTitle: true,
      //     actions: [
      //       IconButton(
      //         onPressed: () {},
      //         icon: SvgPicture.asset(
      //           AppIcons.massage,
      //           color: AppColors.textColor,
      //         ),
      //       ),
      //     ]),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.boxscreen),
            fit: BoxFit.scaleDown,
            alignment: Alignment.topCenter,
            // opacity: 0.5,
          ),
        ),
      ),
    );
  }
}
