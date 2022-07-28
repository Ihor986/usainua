import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    // required this.onTap,
    required this.screen,
  }) : super(key: key);
  // final void Function(int index) onTap;
  final Size screen;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<String> iconsLeft = [
    AppIcons.homeBold,
    AppIcons.home,
    AppIcons.choiceBold,
    AppIcons.choice,
  ];
  final List<String> iconsRigth = [
    AppIcons.boxBold,
    AppIcons.box,
    AppIcons.profileBold,
    AppIcons.profile,
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(
            bottom: widget.screen.height * 0.032,
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: widget.screen.width * 0.99,
                height: widget.screen.height * 0.062,
                // padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[
                      AppColors.grayBackground,
                      AppColors.grayBackground,
                      AppColors.white,
                    ],
                    // tileMode: TileMode.mirror,
                  ),
                  color: AppColors.grayBackground,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.textColorOp,
                      offset: Offset(0.0, 15.0),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: widget.screen.width * 0.94,
                height: widget.screen.height * 0.062,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _LeftSideIcons(
                      screen: widget.screen,
                      icons: iconsLeft,
                      index: state.pageIndex,
                    ),
                    _RigthSideIcons(
                      screen: widget.screen,
                      icons: iconsRigth,
                      index: state.pageIndex,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 11),
                child: SizedBox(
                  width: widget.screen.width * 0.15,
                  height: widget.screen.width * 0.15,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: widget.screen.width * 0.15,
                        height: widget.screen.width * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.white,
                              offset: Offset(0.0, 20.0),
                              blurRadius: 10.0,
                            ),
                          ],
                          color: AppColors.white,
                        ),
                      ),
                      _AnimationButton(
                        screen: widget.screen,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AnimationButton extends StatefulWidget {
  const _AnimationButton({
    Key? key,
    // required this.onTap,
    required this.screen,
  }) : super(key: key);
  // final void Function(int index)? onTap;
  final Size screen;
  @override
  State<_AnimationButton> createState() => __AnimationButtonState();
}

class __AnimationButtonState extends State<_AnimationButton>
    with SingleTickerProviderStateMixin {
  bool isRotate = false;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    setRotation(45);
  }

  void setRotation(int degrees) {
    final angle = degrees * 3.14 / 180;
    animation = Tween<double>(
      begin: 0,
      end: angle,
    ).animate(controller);
  }

  void backRotation(int degrees) {
    final angle = degrees * 3.14 / 180;
    animation = Tween<double>(
      begin: angle,
      end: 0,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: widget.screen.width * 0.13,
      height: widget.screen.width * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: isRotate
                ? AppColors.textShadowColor
                : AppColors.greenButtonShadowColor,
            offset: const Offset(0.0, 16.0),
            blurRadius: 15.0,
          ),
        ],
        color: isRotate ? AppColors.textColor : AppColors.greenButtonColor,
      ),
      child: AnimatedBuilder(
        animation: animation,
        child: IconButton(
          onPressed: () {
            setState(() {
              isRotate = !isRotate;
              isRotate ? setRotation(45) : backRotation(45);
              controller.forward(from: 0);
            });
          },
          icon: SvgPicture.asset(
            AppIcons.plus,
            color: isRotate ? AppColors.white : AppColors.textColor,
          ),
        ),
        builder: (context, child) => Transform.rotate(
          angle: animation.value,
          child: child,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _LeftSideIcons extends StatelessWidget {
  const _LeftSideIcons({
    Key? key,
    required this.screen,
    required this.icons,
    required this.index,
  }) : super(key: key);
  final Size screen;

  final List<String> icons;
  final int index;

  @override
  Widget build(BuildContext context) {
    return _SideIcons(
      screen: screen,
      icons: icons,
      pageIndex: index,
      firstIconIndex: 0,
      secondIconIndex: 1,
    );
  }
}

class _RigthSideIcons extends StatelessWidget {
  const _RigthSideIcons({
    Key? key,
    required this.screen,
    required this.icons,
    required this.index,
  }) : super(key: key);
  final Size screen;

  final List<String> icons;
  final int index;

  @override
  Widget build(BuildContext context) {
    return _SideIcons(
      screen: screen,
      icons: icons,
      pageIndex: index,
      firstIconIndex: 3,
      secondIconIndex: 4,
    );
  }
}

class _SideIcons extends StatelessWidget {
  const _SideIcons({
    Key? key,
    required this.screen,
    required this.icons,
    required this.pageIndex,
    required this.firstIconIndex,
    required this.secondIconIndex,
  }) : super(key: key);
  final Size screen;
  final List<String> icons;
  final int pageIndex;
  final int firstIconIndex;
  final int secondIconIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screen.width * 0.39,
      height: screen.height * 0.062,
      decoration: BoxDecoration(
        color: AppColors.grayBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              context
                  .read<NavigationBloc>()
                  .add(ChangePage(index: firstIconIndex));
            },
            icon: SvgPicture.asset(
              pageIndex == firstIconIndex
                  ? icons.elementAt(0)
                  : icons.elementAt(1),
              height: screen.height * 0.025,
              color: AppColors.textColor,
            ),
          ),
          IconButton(
            onPressed: () {
              context
                  .read<NavigationBloc>()
                  .add(ChangePage(index: secondIconIndex));
            },
            icon: SvgPicture.asset(
              pageIndex == secondIconIndex
                  ? icons.elementAt(2)
                  : icons.elementAt(3),
              height: screen.height * 0.025,
              color: AppColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
