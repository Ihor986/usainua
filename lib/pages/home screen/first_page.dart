import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usainua/pages/home%20screen/buy_and_delivery_page.dart';
import 'package:usainua/pages/home%20screen/only_delivery_page.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/utils/app_images.dart';
import 'package:usainua/widgets/list_tile_button.dart';

class FirstPageHomeScreen extends StatelessWidget {
  const FirstPageHomeScreen({Key? key}) : super(key: key);
  static const routeName = '/FirstPageHomeScreen';

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.notification,
              color: AppColors.textColor,
            ),
          ),
          title: SvgPicture.asset(
            AppImages.logo,
            width: screen.width * 0.4,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.massage,
                color: AppColors.textColor,
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _BalanceRow(
                screen: screen,
                sum: '358.93 \$',
                sumUah: ' \\ 11157 грн',
              ),
              Padding(
                padding: EdgeInsets.only(top: screen.height * 0.04),
                child: Column(
                  children: [
                    _BuyOrDelivery(
                      color: AppColors.mediaButtonBackgroundColor,
                      colorCircular: AppColors.greenButtonColor,
                      text: 'Покупка и доставка',
                      icon: AppImages.car,
                      screen: screen,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          BuyAndDeliveryPage.routeName,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    _BuyOrDelivery(
                      color: AppColors.grayBackground,
                      colorCircular: AppColors.textColor,
                      text: 'Только доставка',
                      icon: AppImages.plane,
                      screen: screen,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          OnlyDeliveryPage.routeName,
                        );
                      },
                    ),
                  ],
                ),

                // _RowButton(screen:screen)
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screen.height * 0.02,
                  left: 12,
                ),
                child: ListTileButton(
                  text: 'Тарифы на услуги доставки',
                  icon: AppIcons.calculator,
                  onTap: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screen.height * 0.056,
                  // left: 12,
                ),
                child: _InkwellRow(
                  screen: screen,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}

class _BalanceRow extends StatelessWidget {
  const _BalanceRow({
    Key? key,
    required this.screen,
    required this.sum,
    required this.sumUah,
  }) : super(key: key);
  final Size screen;
  final String sum;
  final String sumUah;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: SizedBox(
        height: screen.height * 0.025,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ваш баланс: ',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: screen.height * 0.019,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              sum,
              style: TextStyle(
                color: AppColors.blueIconsColor,
                fontSize: screen.height * 0.019,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              sumUah,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: screen.height * 0.017,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuyOrDelivery extends StatelessWidget {
  const _BuyOrDelivery({
    Key? key,
    required this.screen,
    required this.text,
    required this.icon,
    required this.color,
    required this.colorCircular,
    required this.onTap,
  }) : super(key: key);
  final Size screen;
  final String text;
  final String icon;
  final Color color;
  final Color colorCircular;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.all(screen.height * 0.03),
        height: screen.height * 0.095,
        width: screen.width * 0.88,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundDecoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(icon),
            alignment: Alignment.centerRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screen.height * 0.03),
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: screen.height * 0.025,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Container(
              height: screen.height * 0.099,
              width: screen.height * 0.095,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: colorCircular,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _InkwellRow extends StatelessWidget {
  const _InkwellRow({
    Key? key,
    required this.screen,
    // required this.sum,
    // required this.sumUah,
  }) : super(key: key);
  final Size screen;
  // final String sum;
  // final String sumUah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: screen.height * 0.037,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return _Shop(
                screen: screen,
                icon: AppImages.amazon,
                onTap: () {},
              );
            },
          ),
        ),
        _GoodsRow(
          screen: screen,
        ),
      ],
    );
  }
}

class _Shop extends StatelessWidget {
  const _Shop({
    Key? key,
    required this.screen,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final Size screen;
  final String icon;
  final void Function() onTap;
  // final String sumUah;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: screen.width * 0.25,
          foregroundDecoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(icon),
              alignment: Alignment.centerRight,
            ),
          ),
        ));
  }
}

class _GoodsRow extends StatelessWidget {
  const _GoodsRow({
    Key? key,
    required this.screen,
    // required this.sum,
    // required this.sumUah,
  }) : super(key: key);
  final Size screen;
  // final String sum;
  // final String sumUah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.045),
      child: SizedBox(
        height: screen.height * 0.29,
        // width: screen.width * 0.45,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return _Goods(
              screen: screen,
              icon: AppImages.amazon,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

class _Goods extends StatelessWidget {
  const _Goods({
    Key? key,
    required this.screen,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final Size screen;
  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screen.height * 0.29,
      width: screen.width * 0.45,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          _Card(
            icon:
                'https://columbia.scene7.com/is/image/ColumbiaSportswear2/1988732_327_f?wid=768&hei=806&v=1642418206',
            screen: screen,
            onTap: () {},
            shop: 'www.columbia.сom',
            name: 'Flash Challenger',
          ),
          Padding(
            padding: EdgeInsets.only(top: screen.height * 0.037),
            child: _Price(
              screen: screen,
              price: '75\$',
              color: AppColors.shadowPrice,
            ),
          ),
          _Price(
            screen: screen,
            price: '50\$',
            color: AppColors.textColor,
            colorShadow: AppColors.shadowPriceOp,
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.screen,
    required this.icon,
    required this.onTap,
    required this.shop,
    required this.name,
  }) : super(key: key);
  final Size screen;
  final String icon;
  final String shop;
  final String name;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          top: screen.height * 0.03,
        ),
        height: screen.height * 0.26,
        width: screen.width * 0.43,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(icon),
            fit: BoxFit.scaleDown,
            alignment: Alignment.topCenter,
            // opacity: 0.5,
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                AppColors.grayBackground, //                   <--- border color
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              name,
              style: TextStyle(
                color: AppColors.black,
                fontSize: screen.height * 0.017,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              shop,
              style: TextStyle(
                color: AppColors.black,
                fontSize: screen.height * 0.017,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Price extends StatelessWidget {
  const _Price({
    Key? key,
    required this.screen,
    required this.price,
    required this.color,
    this.colorShadow,
  }) : super(key: key);
  final Size screen;
  final String price;
  final Color color;
  final Color? colorShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screen.height * 0.06,
      width: screen.height * 0.06,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
        boxShadow: colorShadow != null
            ? [
                BoxShadow(
                  color: colorShadow!,
                  offset: const Offset(0.0, 15.0),
                  blurRadius: 20.0,
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          price,
          style: TextStyle(
            color: AppColors.white,
            fontSize: screen.height * 0.019,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
