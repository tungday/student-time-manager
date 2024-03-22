import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer({required this.callback});

  VoidCallback callback;

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool _showListLanguage = false;
  bool _VISelected = true;
  bool _ENSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.bluePrimaryColor1,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 8.0, left: 8, top: 15, bottom: 15),
            child: Row(
              children: [
                IconButton(
                    onPressed: () => {},
                    icon: SvgPicture.asset(
                      'assets/user_ic.svg',
                      width: 40,
                      height: 40,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    )),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NGUYEN PHUONG NAM",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    Text("NamNP.B20CN457@stu.ptit.edu.vn",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          height: 1,
                        ))
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Padding(
              padding: EdgeInsets.only(top: 20, right: 10, left: 10),
              child: Column(
                children: [
                  ListTile(
                    leading: SvgPicture.asset(
                      "assets/setting_ic.svg",
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                          AppColor.bluePrimaryColor1, BlendMode.srcIn),
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.settingAccount,
                      style: const TextStyle(
                          color: AppColor.bluePrimaryColor1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      "assets/language_ic.svg",
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                          AppColor.bluePrimaryColor1, BlendMode.srcIn),
                    ),
                    title: Text(AppLocalizations.of(context)!.languages,
                        style: const TextStyle(
                            color: AppColor.bluePrimaryColor1,
                            fontWeight: FontWeight.bold)),
                    trailing: SvgPicture.asset(
                      !_showListLanguage
                          ? "assets/angle_down_ic.svg"
                          : "assets/angle_up_ic.svg",
                      width: 15,
                      height: 15,
                      colorFilter: const ColorFilter.mode(
                          AppColor.bluePrimaryColor1, BlendMode.srcIn),
                    ),
                    onTap: () => {
                      setState(() {
                        _showListLanguage = !_showListLanguage;
                      })
                    },
                  ),
                  Visibility(
                      visible: _showListLanguage,
                      child: ListTile(
                        leading: Container(
                          width: 20,
                          height: 20,
                        ),
                        title: Text(
                            AppLocalizations.of(context)!.vietnamLanguage,
                            style: const TextStyle(
                                color: AppColor.bluePrimaryColor1,
                                fontWeight: FontWeight.bold)),
                        trailing: _VISelected
                            ? SvgPicture.asset(
                                "assets/check_ic.svg",
                                width: 15,
                                height: 15,
                                colorFilter: const ColorFilter.mode(
                                    AppColor.bluePrimaryColor1,
                                    BlendMode.srcIn),
                              )
                            : null,
                        onTap: () => {
                          setState(() {
                            _VISelected = true;
                            _ENSelected = false;
                          })
                        },
                      )),
                  Visibility(
                      visible: _showListLanguage,
                      child: ListTile(
                        leading: Container(
                          width: 20,
                          height: 20,
                        ),
                        title: Text(
                            AppLocalizations.of(context)!.englishLanguage,
                            style: const TextStyle(
                                color: AppColor.bluePrimaryColor1,
                                fontWeight: FontWeight.bold)),
                        trailing: _ENSelected
                            ? SvgPicture.asset(
                                "assets/check_ic.svg",
                                width: 15,
                                height: 15,
                                colorFilter: const ColorFilter.mode(
                                    AppColor.bluePrimaryColor1,
                                    BlendMode.srcIn),
                              )
                            : null,
                        onTap: () => {
                          setState(() {
                            _VISelected = false;
                            _ENSelected = true;
                          })
                        },
                      )),
                  const Divider(
                    height: 1,
                    thickness: 2,
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      "assets/logout_ic.svg",
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                          AppColor.bluePrimaryColor2, BlendMode.srcIn),
                    ),
                    title: Text(AppLocalizations.of(context)!.logout,
                        style: const TextStyle(
                            color: AppColor.bluePrimaryColor2,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
