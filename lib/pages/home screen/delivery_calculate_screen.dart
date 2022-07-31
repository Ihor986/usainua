import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/pages/home%20screen/bloc/calculation_bloc.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/widgets/check_button_row_widget.dart';
import 'package:usainua/widgets/tittle_text.dart';

class DeliveryCalculatePage extends StatefulWidget {
  const DeliveryCalculatePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/DeliveryCalculatePage';

  @override
  State<DeliveryCalculatePage> createState() => _DeliveryCalculatePageState();
}

class _DeliveryCalculatePageState extends State<DeliveryCalculatePage> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return BlocBuilder<CalculationBloc, CalculationState>(
      builder: (context, state) {
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
                text: 'Тарифы',
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
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      CheckButtonRow(
                        color: AppColors.greenButtonColor,
                        onClick: () {
                          setState(() {
                            context.read<CalculationBloc>().add(
                                  ChangeCalculation(isOnlyDelivery: false),
                                );
                          });
                        },
                        text: 'Покупка и доставка',
                        screen: screen,
                        isCheced: !state.isOnlyDelivery,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CheckButtonRow(
                        color: AppColors.blueIconsColor,
                        onClick: () {
                          setState(() {
                            context.read<CalculationBloc>().add(
                                  ChangeCalculation(isOnlyDelivery: true),
                                );
                          });
                        },
                        text: 'Только доставка',
                        screen: screen,
                        isCheced: state.isOnlyDelivery,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: state.isOnlyDelivery
                      ? _OnlyDeliveryContainer(
                          screen: screen,
                        )
                      : _BuyAndDeliveryContainer(
                          screen: screen,
                        ),
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.white,
        );
      },
    );
  }
}

class _BuyAndDeliveryContainer extends StatelessWidget {
  const _BuyAndDeliveryContainer({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 264,
      child: _CalculationForm(
        screen: screen,
        hintText: 'Выберите страну отправки',
        hintText2: 'Выберите способ доставки',
        hintText3: 'Примерный вес посылки',
        hintText4: 'Общая стоимость',
      ),
    );
  }
}

class _OnlyDeliveryContainer extends StatelessWidget {
  const _OnlyDeliveryContainer({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 264,
      child: _CalculationForm(
        screen: screen,
        hintText: '',
        hintText2: '',
        hintText3: '',
        hintText4: '',
      ),
    );
  }
}

class _CalculationForm extends StatefulWidget {
  const _CalculationForm({
    Key? key,
    required this.screen,
    required this.hintText,
    required this.hintText2,
    required this.hintText3,
    required this.hintText4,
  }) : super(key: key);
  final Size screen;
  final String hintText;
  final String hintText2;
  final String hintText3;
  final String hintText4;

  @override
  State<_CalculationForm> createState() => _CalculationFormState();
}

class _CalculationFormState extends State<_CalculationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationBloc, CalculationState>(
      builder: (context, state) {
        return Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      height: 56,
                      child: _CustomDropdownMenu(
                        screen: widget.screen,
                        items: [
                          widget.hintText,
                          'США',
                          'Испания',
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      height: 56,
                      child: _CustomDropdownMenu(
                        screen: widget.screen,
                        items: [
                          widget.hintText2,
                          'Авиа доставка',
                          'Шиппинг',
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      height: 56,
                      child: _CustomTextForm(
                        icon: AppIcons.kg,
                        screen: widget.screen,
                        hintText: widget.hintText3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      height: 56,
                      child: _CustomTextForm(
                        icon: AppIcons.dollar,
                        screen: widget.screen,
                        hintText: widget.hintText4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CustomDropdownMenu extends StatefulWidget {
  const _CustomDropdownMenu({
    Key? key,
    required this.items,
    required this.screen,
  }) : super(key: key);
  final Size screen;
  final List<String> items;

  @override
  State<_CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<_CustomDropdownMenu> {
  String? value;

  @override
  void initState() {
    value = widget.items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: const BoxDecoration(
        color: AppColors.grayBackground,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: AppColors.grayBackground,
          icon: SvgPicture.asset(AppIcons.dropdownicon),
          iconSize: 7,
          isExpanded: true,
          items: widget.items.map(_buildMenuItem).toList(),
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
          value: value,
          style: value != widget.items.first
              ? TextStyle(
                  color: AppColors.textColor,
                  fontSize: widget.screen.height * 0.02,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                )
              : TextStyle(
                  color: AppColors.disactiveTextColor,
                  fontSize: widget.screen.height * 0.017,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> _buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
      ),
    );
  }
}

class _CustomTextForm extends StatelessWidget {
  const _CustomTextForm({
    Key? key,
    required this.screen,
    required this.hintText,
    required this.icon,
    // required this.hintText3,
    // required this.hintText4,
  }) : super(key: key);
  final Size screen;
  final String hintText;
  final String icon;
  // final String hintText3;
  // final String hintText4;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: state.authService.phoneInputController,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 21),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 21),
          child: SvgPicture.asset(
            icon,
          ),
        ),
        suffixIconColor: AppColors.textColor,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.disactiveTextColor,
          fontSize: screen.height * 0.017,
          fontWeight: FontWeight.w400,
          letterSpacing: 1,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        fillColor: AppColors.grayBackground,
        filled: true,
      ),
      keyboardType: TextInputType.phone,
      onChanged: (value) {},
      style: TextStyle(
        color: AppColors.textColor,
        fontSize: screen.height * 0.02,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      ),
      validator: (value) {
        if (value == null || value.length != 13) {
          return hintText;
        }
        return null;
      },
    );
  }
}
