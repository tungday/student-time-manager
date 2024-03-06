import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:schedule/component/app_colors.dart";

class NavigationMenu extends StatefulWidget {
  final Function onPressed;
  NavigationMenu({required this.onPressed});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  // const NavigationMenu({Key? key,}) : super(key: key);
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onPressed(index);
    });
  }



  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: AppColor.bluePrimaryColor1,
        selectedItemColor: AppColor.yellowColor,
        unselectedItemColor: AppColor.bluePrimaryColor3,
        unselectedFontSize: 0,
        selectedLabelStyle:
            const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColor.bluePrimaryColor2,
            label: "Lịch học",
            icon: SvgPicture.asset("assets/calendar_ic.svg",
                width: 25,
                height: 25,
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 0
                        ? AppColor.yellowColor
                        : AppColor.bluePrimaryColor3,
                    BlendMode.srcIn)),
          ),
          BottomNavigationBarItem(
            label: "Hoạt động",
            icon: SvgPicture.asset("assets/timeline_ic.svg",
                width: 25,
                height: 25,
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 1
                        ? AppColor.yellowColor
                        : AppColor.bluePrimaryColor3,
                    BlendMode.srcIn)),
          ),
          BottomNavigationBarItem(
            label: "Báo thức",
            icon: SvgPicture.asset("assets/clock_ic.svg",
                width: 25,
                height: 25,
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 2
                        ? AppColor.yellowColor
                        : AppColor.bluePrimaryColor3,
                    BlendMode.srcIn)),
          ),
          BottomNavigationBarItem(
            label: "Thống kê",
            icon: SvgPicture.asset("assets/chart_ic.svg",
                width: 25,
                height: 25,
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 3
                        ? AppColor.yellowColor
                        : AppColor.bluePrimaryColor3,
                    BlendMode.srcIn)),
          ),
          BottomNavigationBarItem(
            label: "Nhiệm vụ",
            icon: SvgPicture.asset("assets/assigment_ic.svg",
                width: 25,
                height: 25,
                colorFilter: ColorFilter.mode(
                    _selectedIndex == 4
                        ? AppColor.yellowColor
                        : AppColor.bluePrimaryColor3,
                    BlendMode.srcIn)),
          )
        ]);
  }
}
