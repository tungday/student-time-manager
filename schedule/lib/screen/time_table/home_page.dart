import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/schedule_item.dart';
import 'package:schedule/screen/drawer_nav/main_drawer.dart';
import 'package:schedule/screen/navigation_menu/navigation_menu.dart';
import 'package:schedule/screen/time_table/schedule.dart';

class HomePage extends StatelessWidget {
  HomePage({required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return HomePageView(
      callback: this.callback,
    );
  }
}

class HomePageView extends StatefulWidget {
  // const HomePageView({Key? key}) : super(key: key);
  HomePageView({required this.callback});

  final VoidCallback callback;

  @override
  State<HomePageView> createState() => _HomePageView();
}

class _HomePageView extends State<HomePageView> {
  // late final HomeBloc _bloc;
  // ScrollController _scrollController = ScrollController();

  late int _layoutSelected;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // _bloc = context.read<HomeBloc>()..add(InitialHomeEvent());
    // _scrollController = ScrollController();
    // _scrollController.addListener(_scrollListener);
    _layoutSelected = 0;
    super.initState();
  }

  void toggleSelected(int index) {
    setState(() {
      _layoutSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: SafeArea(
          child: SizedBox(
            width: 250,
            child: Drawer(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: MainDrawer(
                callback: widget.callback,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: [
            Schedule(
              scaffoldKey: scaffoldKey,
            ),
            const Card(
              margin: EdgeInsets.all(16.0),
              child: Center(child: Text('Hoat Dong')),
            ),
            const Card(
              margin: EdgeInsets.all(16.0),
              child: Center(child: Text('Bao Thuc')),
            ),
            const Card(
              margin: EdgeInsets.all(16.0),
              child: Center(child: Text('Thong Ke')),
            ),
            const Card(
              margin: EdgeInsets.all(16.0),
              child: Center(child: Text('Nhiem Vu')),
            )
          ][_layoutSelected],
        ),
        bottomNavigationBar: NavigationMenu(
          onPressed: toggleSelected,
        ));
  }
}
