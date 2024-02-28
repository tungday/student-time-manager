
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule/component/schedule_item.dart';



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
        appBar: AppBar(
          title: const Text("Tin tức"),
          // leading: IconButton(
          //   icon: const Icon(Icons.close),
          //   onPressed: () {
          //     Navigator.of(context);
          //   },
          //   color: Colors.black,
          // ),
          backgroundColor: Colors.white,
          elevation: 0,
          // actions: [
          //   IconButton(
          //       onPressed: () async {
          //         await FirebaseAuth.instance.signOut();
          //         Navigator.popUntil(context, ModalRoute.withName('/'));
          //
          //       },
          //       icon: const Icon(Icons.logout, color: Colors.black))
          // ],
        ),
        body: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            // controller: _scrollController,
            child: Column(children: [
              Container(
                height: 60,
                alignment: Alignment.center,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) =>  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Container(
                        ///TODO
                        width: 120,
                      ),
                    )),
              ),
              const ScheduleItem(text: "23/02", subject: "Lập trình hướng đối tượng", teacher: "Đào Ngọc Phong", room: "302-A2", fontSize: 16)
            ]),
          ),
        ));
  }
}
