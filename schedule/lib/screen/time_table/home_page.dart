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

  @override
  void initState() {
    // _bloc = context.read<HomeBloc>()..add(InitialHomeEvent());
    // _scrollController = ScrollController();
    // _scrollController.addListener(_scrollListener);
    super.initState();
  }

  // _scrollListener() {
  //   if (_scrollController.offset >=
  //       _scrollController.position.maxScrollExtent - 500 &&
  //       !_scrollController.position.outOfRange) {
  //     if (!_bloc.state.isLoading) {
  //       _bloc.add(LoadMoreDataEvent(_bloc.state.page + 1));
  //     }
  //   }
  //   if (_scrollController.offset < -100) {
  //     if (!_bloc.state.isLoading) {
  //       _bloc.add(RefreshDataEvent(_bloc.state.page));
  //     }
  //   }
  // }

  // void _loadMoreData() async {
  //   if (!_isLoading) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await Future.delayed(Duration(seconds: 1));
  //     List<int> newContainerList = List.generate(10, (index) => index);
  //
  //     setState(() {
  //       _containerList.addAll(newContainerList);
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Schedule(),
        ),
        bottomNavigationBar: NavigationMenu());
  }
}
