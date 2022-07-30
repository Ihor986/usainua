import 'package:flutter/material.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
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

bool isOnlyDelivery = false;

class _FourthPageState extends State<FourthPage> {
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
                  _ButtonRow(
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
                  _ButtonRow(
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

class _ButtonRow extends StatelessWidget {
  const _ButtonRow({
    Key? key,
    required this.screen,
    required this.onClick,
    required this.text,
    required this.color,
    required this.isCheced,
  }) : super(key: key);
  final Size screen;
  final void Function() onClick;
  final String text;
  final Color color;
  final bool isCheced;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(screen.height * 0.01),
                  width: screen.height * 0.04,
                  height: screen.height * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                          50.0), //                 <--- border radius here
                    ),
                    color: isCheced ? color : AppColors.grayBackground,
                  ),
                  child: Container(
                    width: screen.height * 0.02,
                    height: screen.height * 0.02,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                            50.0), //                 <--- border radius here
                      ),
                      color: AppColors.grayBackground,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color:
                    isCheced ? AppColors.textColor : AppColors.grayBackground,
                fontSize: screen.height * 0.024,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _DeliveryTypeContainer extends StatelessWidget {
//   const _DeliveryTypeContainer({
//     Key? key,
//     required this.screen,
//     required this.text1,
//     required this.text2,
//     required this.text3,
//     required this.text4,
//     required this.icon1,
//     required this.icon2,
//     required this.icon3,
//     required this.icon4,
//     required this.color,
//   }) : super(key: key);
//   final Size screen;
//   final String text1;
//   final String text2;
//   final String text3;
//   final String text4;
//   final String icon1;
//   final String icon2;
//   final String icon3;
//   final String icon4;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: const Alignment(0, 0.12),
//       child: SizedBox(
//         height: 0.5 * screen.height,
//         child: Stack(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _LineRow(
//                   color: color,
//                   text: text1,
//                   icon: icon1,
//                   screen: screen,
//                 ),
//                 _LineRow(
//                   color: color,
//                   text: text4,
//                   icon: icon4,
//                   screen: screen,
//                 ),
//               ],
//             ),
//             Center(
//               child: SizedBox(
//                 height: 0.25 * screen.height,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _LineRow(
//                       color: color,
//                       text: text2,
//                       icon: icon2,
//                       screen: screen,
//                     ),
//                     _LineRow(
//                       color: color,
//                       text: text3,
//                       icon: icon3,
//                       screen: screen,
//                     ),
//                     const SizedBox(),
//                   ],
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 foregroundDecoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                       AppIcons.snakePng,
//                     ),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 height: 0.33 * screen.height,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _LineRow extends StatelessWidget {
//   const _LineRow({
//     Key? key,
//     required this.screen,
//     required this.text,
//     required this.icon,
//     required this.color,
//   }) : super(key: key);
//   final Size screen;
//   final String text;
//   final String icon;
//   final Color color;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         SvgPicture.asset(
//           icon,
//           alignment: Alignment.topCenter,
//           color: color,
//         ),
//         Text(
//           text,
//           style: TextStyle(
//             color: AppColors.textColor,
//             fontSize: screen.height * 0.017,
//             fontWeight: FontWeight.w400,
//             letterSpacing: 0.5,
//           ),
//         ),
//         const SizedBox(),
//       ],
//     );
//   }
// }
