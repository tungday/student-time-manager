import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        // Container(color: Colors.black12,),
        // Container(color: Colors.deepOrange,),
        NavigationDestination(
            icon: SvgPicture.asset(
              "assets/calendar_ic.svg",
              width: 2,
              height: 2,
            ),
            label: "Lich hoc"),
        NavigationDestination(
            icon: SvgPicture.asset(
              "assets/timeline_ic.svg",
              width: 2,
              height: 2,
            ),
            label: "Hoat dong"),
      ],
    );
  }
}
