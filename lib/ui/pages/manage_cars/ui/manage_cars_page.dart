import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/models/responses/get_cars/get_cars_response.dart';
import 'package:bid_express/ui/pages/home/ui/widgets/username_widget.dart';
import 'package:bid_express/ui/pages/manage_cars/bloc/manage_cars_bloc.dart';
import 'package:bid_express/ui/pages/manage_cars/ui/widgets/category_widget.dart';
import 'package:bid_express/ui/pages/manage_cars/ui/widgets/seller_brand_widget.dart';
import 'package:bid_express/ui/pages/manage_cars/ui/widgets/seller_car_model_widget.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageCarsPage extends StatefulWidget {
  const ManageCarsPage({super.key});

  @override
  State<ManageCarsPage> createState() => _ManageCarsPageState();
}

class _ManageCarsPageState extends State<ManageCarsPage> with UiUtility, Utility {
  late ManageCarsBloc _bloc;
  late Future<String> _future;

  @override
  void initState() {
    super.initState();
    _future = getUserName();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = context.read<ManageCarsBloc>();
    return Scaffold(
      body: BlocConsumer<ManageCarsBloc, ManageCarsState>(
        listener: (context, state) {
          if (state is GetCarsLoadingState) {
            LoadingView.shared.startLoading(context);
          }

          if (state is GetCarsSuccessState) {
            LoadingView.shared.stopLoading();
            _bloc.add(GetCategories());
          }

          if (state is GetCarsErrorState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context, msg: state.error);
          }

          if (state is GetCarsFailureState) {
            LoadingView.shared.stopLoading();
            showErrorToast(context: context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                /// Bg and body
                Column(
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

                    124.verticalSpace,

                    /// Model years and categories
                    Expanded(
                      child: BlocConsumer<ManageCarsBloc, ManageCarsState>(
                        listener: (context, state) {
                          if (state is GetCategoriesLoadingState) {
                            LoadingView.shared.startLoading(context);
                          }

                          if (state is GetCategoriesSuccessState) {
                            LoadingView.shared.stopLoading();
                            if (_bloc.cars.isNotEmpty) {
                              _bloc.add(SelectBrand(
                                  brandId: _bloc.cars.first.brandId ?? 0));
                            }
                          }

                          if (state is GetCategoriesErrorState) {
                            LoadingView.shared.stopLoading();
                            showErrorToast(
                                context: context, msg: state.error);
                          }

                          if (state is GetCategoriesFailureState) {
                            LoadingView.shared.stopLoading();
                            showErrorToast(context: context);
                          }

                          if (state is GetSelectedCategoriesLoadingState) {
                            LoadingView.shared.startLoading(context);
                          }

                          if (state is GetSelectedCategoriesSuccessState) {
                            LoadingView.shared.stopLoading();
                            //
                          }

                          if (state is GetSelectedCategoriesErrorState) {
                            LoadingView.shared.stopLoading();
                            showErrorToast(
                                context: context, msg: state.error);
                          }

                          if (state is GetSelectedCategoriesFailureState) {
                            LoadingView.shared.stopLoading();
                            showErrorToast(context: context);
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            children: [
                              /// Fields
                              /// TODO: add years fields
                              const SizedBox.shrink(),

                              /// Categories
                              Expanded(
                                child: GridView.builder(
                                  // shrinkWrap: true,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                    vertical: 6.h,
                                  ),
                                  itemCount: _bloc.categories.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.0,
                                    mainAxisSpacing: 16.h,
                                    crossAxisSpacing: 16.w,
                                  ),
                                  itemBuilder: (context, index) {
                                    return CategoryWidget(
                                      category: _bloc.categories[index],
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),

                16.verticalSpace,

                /// Brands and models
                Positioned(
                  top: 144.h,
                  child: BlocConsumer<ManageCarsBloc, ManageCarsState>(
                    listener: (context, state) {
                      if (state is UpdateSelectedBrandState) {
                        _bloc.add(SelectModel(
                            modelId: _getSelectedBrand()
                                    ?.sellerCarModels
                                    ?.first
                                    ?.carModelId ??
                                0));
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          /// Brands
                          SizedBox(
                            width: 1.sw,
                            height: .12.sh,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _bloc.cars.length,
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              itemBuilder: (context, index) {
                                return SellerBrandWidget(
                                  brand: _bloc.cars[index],
                                );
                              },
                            ),
                          ),

                          16.verticalSpace,

                          /// Models
                          BlocConsumer<ManageCarsBloc, ManageCarsState>(
                            listener: (context, state) {
                              if (state is UpdateSelectedModelState) {
                                _bloc.add(GetSelectedCategories(
                                    modelId: state.modelId));
                              }
                            },
                            builder: (context, state) {
                              return SizedBox(
                                width: 1.sw,
                                height: .045.sh,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  itemCount: _getModelsCount(),
                                  itemBuilder: (context, index) {
                                    return SellerCarModelWidget(
                                      model: _getSelectedBrand()
                                              ?.sellerCarModels![index] ??
                                          GetCarsResponseCarModels(),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 24.w),
      //   child: MainButton(
      //     onTap: () {},
      //     title: 'save',
      //   ),
      // ),
    );
  }

  GetCarsResponse? _getSelectedBrand() {
    try {
      return _bloc.cars.firstWhere((element) => element.isSelected ?? false);
    } catch (e) {
      return null;
    }
  }

  int _getModelsCount() {
    try {
      return _bloc.cars
              .firstWhere((element) => element.isSelected ?? false)
              .sellerCarModels
              ?.length ??
          0;
    } catch (e) {
      return 0;
    }
  }
}
