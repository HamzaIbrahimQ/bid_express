import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/ui/pages/home/bloc/home_bloc.dart';
import 'package:bid_express/ui/pages/home/ui/widgets/username_widget.dart';
import 'package:bid_express/ui/pages/home_bids/ui/home_bids_page.dart';
import 'package:bid_express/ui/pages/home_cancelled_bids/ui/home_cancelled_bids_page.dart';
import 'package:bid_express/ui/pages/home_history/ui/home_history_page.dart';
import 'package:bid_express/ui/pages/home_won_bids/ui/home_won_bids_page.dart';
import 'package:bid_express/ui/pages/submitted_bids/ui/submitted_bigs_page.dart';
import 'package:bid_express/ui/widgets/custom_tooltip.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';

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
  final TooltipController tooltipController = TooltipController();
  bool start = false;
  bool done = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _future = getUserName();
    tooltipController.onDone(() {
      setState(() {
        done = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = context.read<HomeBloc>();
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is GetUserDataSuccessState) {
          start = true;
        }
      },
      builder: (context, state) {
        return OverlayTooltipScaffold(
          controller: tooltipController,
          tooltipAnimationCurve: Curves.linear,
          tooltipAnimationDuration: const Duration(milliseconds: 500),
          startWhen: (initializedWidgetLength) async {
            await Future.delayed(const Duration(milliseconds: 250));
            return initializedWidgetLength == 7 && start && !done;
          },
          builder: (context) {
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
                    length: 4,
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
                            child:
                                StatefulBuilder(builder: (context, setState) {
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
                                      overlayColor:
                                          const MaterialStatePropertyAll(
                                        Colors.transparent,
                                      ),
                                      indicatorSize: TabBarIndicatorSize.label,
                                      indicatorWeight: 4,
                                      tabAlignment: TabAlignment.center,
                                      labelPadding: EdgeInsetsDirectional.only(
                                        start: 8.w,
                                        end: 8.w,
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
                                        OverlayTooltipItem(
                                          displayIndex: 0,
                                          tooltip: (controller) {
                                            return Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                start: 16.w,
                                              ),
                                              child: CustomTooltip(
                                                title:
                                                    'Here you can discover all orders related to your categories configuration.',
                                                controller: controller,
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Orders',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 12.sp,
                                              fontWeight: _currentIndex == 0
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        OverlayTooltipItem(
                                          displayIndex: 1,
                                          tooltip: (controller) {
                                            return Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                start: 16.w,
                                              ),
                                              child: SizedBox(
                                                width: .7.sw,
                                                child: CustomTooltip(
                                                  title:
                                                      'And here you can find all of your submitted bids.',
                                                  controller: controller,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Submitted bids',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 12.sp,
                                              fontWeight: _currentIndex == 1
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        // Text(
                                        //   'Won Bids',
                                        //   style: TextStyle(
                                        //     color: secondaryColor,
                                        //     fontSize: 12.sp,
                                        //     fontWeight: _currentIndex == 2
                                        //         ? FontWeight.bold
                                        //         : FontWeight.normal,
                                        //   ),
                                        // ),
                                        OverlayTooltipItem(
                                          displayIndex: 2,
                                          tooltip: (controller) {
                                            return Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                start: 16.w,
                                              ),
                                              child: SizedBox(
                                                width: .7.sw,
                                                child: CustomTooltip(
                                                  title:
                                                      'Cancelled bids which confirmed and then cancelled by the buyer will be here, with the cancellation reason.',
                                                  controller: controller,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Cancelled Bids',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 12.sp,
                                              fontWeight: _currentIndex == 2
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        OverlayTooltipItem(
                                          displayIndex: 3,
                                          tooltip: (controller) {
                                            return Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                start: 16.w,
                                              ),
                                              child: CustomTooltip(
                                                title:
                                                    'The Bids history will contain all of your submitted and won bids.',
                                                controller: controller,
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Bids History',
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: 12.sp,
                                              fontWeight: _currentIndex == 3
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                            ),
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
                                        children: const [
                                          HomeBidsPage(),
                                          SubmittedBidsPage(),
                                          // HomeWonBidsPage(),
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
          },
        );
      },
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
