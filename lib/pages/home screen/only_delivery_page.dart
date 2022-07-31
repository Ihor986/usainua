import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/pages/home%20screen/bloc/calculation_bloc.dart';
import 'package:usainua/pages/home%20screen/delivery_calculate_screen.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/widgets/big_button.dart';
import 'package:usainua/widgets/delivery_type_container.dart';
import 'package:usainua/widgets/home%20screen/header.dart';
import 'package:usainua/widgets/tittle_text.dart';

class OnlyDeliveryPage extends StatelessWidget {
  const OnlyDeliveryPage({
    Key? key,
    // required this.screen,
  }) : super(key: key);

  // final Size screen;
  static const routeName = '/OnlyDeliveryPage';

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              AppIcons.arrowLeft,
              color: AppColors.blueIconsColor,
            ),
          ),
          title: TittleText(
            screen: screen,
            text: 'Только доставка',
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.massage,
                color: AppColors.blueIconsColor,
              ),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Header(
              screen: screen,
              color: AppColors.grayBackground,
              text:
                  'Текст о мейлфорвардинге и о том что мы доставим супер быстро но такие покупи менее защищены',
            ),
            _DeliveryTypeContainer(
              screen: screen,
            ),
            Align(
              alignment: const Alignment(0, 0.64),
              child: BigButton(
                onPressed: () {
                  context.read<CalculationBloc>().add(
                        ChangeCalculation(isOnlyDelivery: true),
                      );
                  Navigator.pushNamed(
                    context,
                    DeliveryCalculatePage.routeName,
                  );
                },
                text: 'Рассчитать только доставку',
                color: AppColors.blueIconsColor,
                shadowColor: AppColors.blueIconsShadowColor,
                textColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}

class _DeliveryTypeContainer extends StatelessWidget {
  const _DeliveryTypeContainer({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.095),
      child: DeliveryTypeContainer(
        screen: screen,
        text1:
            '\nСкопируйте адреса складов, на \nкоторые Вы сможете доставлять \nсамостоятельно купленные заказы',
        text2: '\nВведите трекинг-номер, полученный от \nмагазина.',
        text3: '\nВыберите способ доставки и оплатите \nзаказ',
        text4:
            '\n\n\nТеперь остается всего немного \nподождать, и посылка у Вас! \nPS.... можете отслеживать ее в своем \nкабинете',
        icon1: AppIcons.copyLocation,
        icon2: AppIcons.edit,
        icon3: AppIcons.moneyBag,
        icon4: AppIcons.location,
        icon5: AppIcons.locationHome,
        color: AppColors.blueIconsColor,
      ),
    );
  }
}
