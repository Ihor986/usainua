import 'package:flutter/material.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/widgets/check_button_row_widget.dart';
import 'package:usainua/widgets/delivery_type_container.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  bool isOnlyDelivery = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.77),
            child: SizedBox(
              height: 120,
              child: Column(
                children: [
                  CheckButtonRow(
                    color: AppColors.greenButtonColor,
                    onClick: () {
                      setState(() {
                        isOnlyDelivery = false;
                      });
                    },
                    text: 'Покупка и доставка',
                    screen: widget.screen,
                    isCheced: !isOnlyDelivery,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CheckButtonRow(
                    color: AppColors.blueIconsColor,
                    onClick: () {
                      setState(() {
                        isOnlyDelivery = true;
                      });
                    },
                    text: 'Только доставка',
                    screen: widget.screen,
                    isCheced: isOnlyDelivery,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.12),
            child: isOnlyDelivery
                ? DeliveryTypeContainer(
                    screen: widget.screen,
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
                    color: AppColors.blueIconsColor,
                  )
                : DeliveryTypeContainer(
                    screen: widget.screen,
                    text1:
                        '\nВыберите желаемые товары в\n интернет-магазинах США/Европы.',
                    text2:
                        '\nСкопируйте ссылки на выбранные \nтовары в форму заказа.',
                    text3:
                        '\n\nВ течение 30 минут в кабинете \nпоявится расчёт стоимости покупки \nтоваров с доставкой.',
                    text4:
                        '\n\nМы выкупим Ваш заказ, и привезем его \nк Вам. Вы сможете отслеживать его в \nличном кабинете.',
                    icon1: AppIcons.buy,
                    icon2: AppIcons.copy,
                    icon3: AppIcons.moneyBag,
                    icon4: AppIcons.location,
                    color: AppColors.greenButtonColor,
                  ),
          ),
        ],
      ),
    );
  }
}
