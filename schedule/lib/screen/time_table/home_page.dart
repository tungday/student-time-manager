import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/component/app_colors.dart';
import 'package:schedule/component/schedule_item.dart';
import 'package:schedule/screen/navigation_menu/navigation_menu.dart';
import 'package:schedule/screen/time_table/schedule.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageView();
}

class _HomePageView extends State<HomePageView> {
  // late final HomeBloc _bloc;
  // ScrollController _scrollController = ScrollController();

  late int _layoutSelected;

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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: const [
            Schedule(),
            Card(
              margin: const EdgeInsets.all(16.0),
              child: Center(child: Text('Hoat Dong')),
            ),
            Card(
              margin: const EdgeInsets.all(16.0),
              child: Center(child: Text('Bao Thuc')),
            ),
            Card(
              margin: const EdgeInsets.all(16.0),
              child: Center(child: Text('Thong Ke')),
            ),
            Card(
              margin: const EdgeInsets.all(16.0),
              child: Center(child: Text('Nhiem Vu')),
            )
          ][_layoutSelected],
        ),
        bottomNavigationBar: NavigationMenu(
          onPressed: toggleSelected,
        ));
  }
}
