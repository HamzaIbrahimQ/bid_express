import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/ui/pages/home/bloc/home_bloc.dart';
import 'package:bid_express/ui/pages/home/ui/widgets/username_widget.dart';
import 'package:bid_express/ui/pages/orders/bloc/orders_bloc.dart';
import 'package:bid_express/ui/pages/orders/ui/orders.dart';
import 'package:bid_express/ui/pages/home_cancelled_bids/ui/home_cancelled_bids_page.dart';
import 'package:bid_express/ui/pages/home_history/ui/home_history_page.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/home_won_bids_page.dart';
import 'package:bid_express/ui/pages/submitted_bids/ui/submitted_bigs_page.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with UiUtility, Utility, TickerProviderStateMixin {
  late HomeBloc _bloc;
  late Future<String> _future;

  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _future = getUserName();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = context.read<HomeBloc>();
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is GetUserDataLoadingState) {
            LoadingView.shared.startLoading(context);
          }

          if (state is GetUserDataSuccessState) {
            LoadingView.shared.stopLoading();
          }

          if (state is GetUserDataErrorState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context, msg: state.error);
          }

          if (state is GetUserDataFailureState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context);
          }
        },
        builder: (context, state) {
          return DefaultTabController(
            length: 5,
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  /// Bg image and username
                  Stack(
                    children: [

                      /// Bg
                      Container(
                        width: 1.sw,
                        height: .25.sh,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/imgs/dashboard_bg.jpg',
                            ),
                          ),
                        ),
                      ),

                      /// Username
                      UserNameWidget(future: _future),
                    ],
                  ),

                  /// Dashboard tabs
                  Expanded(
                    child: StatefulBuilder(builder: (context, setState) {
                      return Column(
                        children: [
                          16.verticalSpace,

                          /// Tabs
                          SizedBox(
                            height: kToolbarHeight / 2,
                            child: TabBar(
                              controller: _tabController,
                              physics: const BouncingScrollPhysics(),
                              indicatorPadding: EdgeInsets.zero,
                              overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent,
                              ),
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 4,
                              tabAlignment: TabAlignment.center,
                              labelPadding: EdgeInsetsDirectional.only(
                                start: 12.w,
                                end: 12.w,
                                bottom: 4.h,
                              ),
                              indicatorColor: const Color(0XFF0057B8),
                              labelColor: const Color(0XFF0B9CD4),
                              isScrollable: true,
                              unselectedLabelColor: blackColor,
                              onTap: (index) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                              tabs: [
                                Text(
                                  'Bid',
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 12.sp,
                                    fontWeight: _currentIndex == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Submitted bids',
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 12.sp,
                                    fontWeight: _currentIndex == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Won Bids',
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 12.sp,
                                    fontWeight: _currentIndex == 2
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Cancelled',
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 12.sp,
                                    fontWeight: _currentIndex == 3
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'History',
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 12.sp,
                                    fontWeight: _currentIndex == 4
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Tabs body
                          Expanded(
                            child: NotificationListener(
                              onNotification: (scrollNotification) {
                                _onTabChanged(setState);
                                return false;
                              },
                              child: TabBarView(
                                controller: _tabController,
                                children:  const [
                                  OrdersPage(),
                                  SubmittedBidsPage(),
                                  HomeWonBidsPage(),
                                  HomeCancelledBidsPage(),
                                  HomBidsHistoryPage(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTabChanged(StateSetter setState) {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }
}

// MainButton(
// title: 'Profile',
// onTap: () {
// navigate(
// context: context,
// page: ProfilePage(),
// );
// },
// ),
