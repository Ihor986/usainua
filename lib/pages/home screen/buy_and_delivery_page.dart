import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/widgets/big_button.dart';
import 'package:usainua/widgets/delivery_type_container.dart';
import 'package:usainua/widgets/home%20screen/header.dart';
import 'package:usainua/widgets/tittle_text.dart';

class BuyAndDeliveryPage extends StatefulWidget {
  const BuyAndDeliveryPage({
    Key? key,
    // required this.screen,
  }) : super(key: key);

  // final Size screen;
  static const routeName = '/BuyAndDeliveryPage';

  @override
  State<BuyAndDeliveryPage> createState() => _BuyAndDeliveryPageState();
}

bool isOnlyDelivery = false;

class _BuyAndDeliveryPageState extends State<BuyAndDeliveryPage> {
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
            text: 'Покупка и доставка',
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
              color: AppColors.mediaButtonBackgroundColor,
              text:
                  'Текст о безопастности и всем таком,\n что отличает покупку и доставку от\n просто доставки',
            ),
            _DeliveryTypeContainer(
              screen: screen,
            ),
            Align(
              alignment: const Alignment(0, 0.64),
              child: BigButton(
                onPressed: () {},
                text: 'Рассчитать покупку и доставку',
                color: AppColors.greenButtonColor,
                shadowColor: AppColors.greenButtonShadowColor,
                textColor: AppColors.greenButtonTextColor,
              ),
            )
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
        text1: '\nВыберите желаемые товары в\n интернет-магазинах США/Европы.',
        text2: '\nСкопируйте ссылки на выбранные \nтовары в форму заказа.',
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
    );
  }
}
