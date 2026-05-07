import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/utils/icons.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });
  final void Function(int)? onTap;
  final int selectedIndex = 0;

  final 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secoundryColor,
        backgroundColor: AppColors.backGroundColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: SvgPicture.asset(
              AppIcons.homeIcon,
              colorFilter: ColorFilter.mode(
                selectedIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.secoundryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppIcons.searchIcon,
              colorFilter: ColorFilter.mode(
                selectedIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.secoundryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            label: "Watch List",
            icon: SvgPicture.asset(
              AppIcons.watchListIcon,
              colorFilter: ColorFilter.mode(
                selectedIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.secoundryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
