import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/progress_hud.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:bid_express/helpers/shared_preference_helper.dart';
import 'package:bid_express/models/responses/get_cars/get_cars_response.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/home/bloc/home_bloc.dart';
import 'package:bid_express/ui/pages/home/ui/widgets/username_widget.dart';
import 'package:bid_express/ui/pages/manage_cars/bloc/manage_cars_bloc.dart';
import 'package:bid_express/ui/pages/manage_cars/ui/widgets/category_widget.dart';
import 'package:bid_express/ui/pages/manage_cars/ui/widgets/manage_cars_username_widget.dart';
import 'package:bid_express/ui/pages/manage_cars/ui/widgets/seller_brand_widget.dart';
import 'package:bid_express/ui/pages/manage_cars/ui/widgets/seller_car_model_widget.dart';
import 'package:bid_express/ui/pages/nav_bar/nav_bar.dart';
import 'package:bid_express/ui/pages/success_page/ui/success_page.dart';
import 'package:bid_express/ui/widgets/custom_tooltip.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:bid_express/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_tooltip/overlay_tooltip.dart';

class ManageCarsPage extends StatefulWidget {
  const ManageCarsPage({super.key});

  @override
  State<ManageCarsPage> createState() => _ManageCarsPageState();
}

class _ManageCarsPageState extends State<ManageCarsPage>
    with UiUtility, Utility {
  late ManageCarsBloc _bloc;
  final TextEditingController fromCont = TextEditingController();
  final TextEditingController toCont = TextEditingController();
  late Future<String> _future;

  final TooltipController tooltipController = TooltipController();
  bool start = false;
  bool done = false;
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper();

  @override
  void initState() {
    super.initState();
    _future = getUserName();
    tooltipController.onDone(() {
      setState(() {
        done = true;
      });
      _sharedPreferenceHelper.saveBooleanValue(
          key: 'isFirstConfig', value: false);
    });
  }

  @override
  void dispose() {
    fromCont.dispose();
    toCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = context.read<ManageCarsBloc>();
    return BlocConsumer<ManageCarsBloc, ManageCarsState>(
      listener: (context, state) {
        if (state is GetSelectedCategoriesSuccessState) {
          start = true;
        }
      },
      builder: (context, state) {
        return OverlayTooltipScaffold(
          controller: tooltipController,
          tooltipAnimationCurve: Curves.linear,
          tooltipAnimationDuration: const Duration(milliseconds: 500),

          startWhen: (initializedWidgetLength) async {
            final bool? _isFirstConfig = await _sharedPreferenceHelper
                .getBooleanValue(key: 'isFirstConfig');
            await Future.delayed(const Duration(milliseconds: 250));
            return initializedWidgetLength == 4 &&
                start &&
                !done &&
                (_isFirstConfig ?? true);
          },
          // preferredOverlay: GestureDetector(
          //   onTap: () {
          //     tooltipController.dismiss();
          //     //move the overlay forward or backwards, or dismiss the overlay
          //   },
          //   child: Container(
          //     height: double.infinity,
          //     width: double.infinity,
          //     color: Colors.blue.withOpacity(.2),
          //   ),
          // ),
          builder: (context) {
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

                  if (state is AddCategoriesLoadingState) {
                    LoadingView.shared.startLoading(context);
                  }

                  if (state is AddCategoriesSuccessState) {
                    LoadingView.shared.stopLoading();
                    navigate(
                      context: context,
                      page: SuccessPage(
                        title: 'Success',
                        message:
                            'Your configuration has been saved Successfully!',
                        onContinue: () {
                          Navigator.of(context).pop();
                          navigate(
                              context: context,
                              isFade: true,
                              clearPagesStack: true,
                              page: BlocProvider(
                                create: (context) =>
                                    HomeBloc()..add(GetUserData()),
                                child: const NavBar(),
                              ));
                        },
                      ),
                    );
                  }

                  if (state is AddCategoriesErrorState) {
                    LoadingView.shared.stopLoading();
                    showErrorToast(context: context, msg: state.error);
                  }

                  if (state is AddCategoriesFailureState) {
                    LoadingView.shared.stopLoading();
                    showErrorToast(context: context);
                  }
                },
                builder: (context, state) {
                  return Stack(
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
                                height: .215.sh,
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
                              ManageCarsUserNameWidget(future: _future),
                            ],
                          ),

                          116.verticalSpace,

                          /// Model years and categories
                          Expanded(
                            child:
                                BlocConsumer<ManageCarsBloc, ManageCarsState>(
                              listener: (context, state) {
                                if (state is GetCategoriesLoadingState) {
                                  LoadingView.shared.startLoading(context);
                                }

                                if (state is GetCategoriesSuccessState) {
                                  LoadingView.shared.stopLoading();
                                  if (_bloc.cars.isNotEmpty) {
                                    _bloc.add(SelectBrand(
                                        brandId:
                                            _bloc.cars.first.brandId ?? 0));
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

                                if (state
                                    is GetSelectedCategoriesLoadingState) {
                                  LoadingView.shared.startLoading(context);
                                }

                                if (state
                                    is GetSelectedCategoriesSuccessState) {
                                  LoadingView.shared.stopLoading();
                                  //
                                }

                                if (state is GetSelectedCategoriesErrorState) {
                                  LoadingView.shared.stopLoading();
                                  showErrorToast(
                                      context: context, msg: state.error);
                                }

                                if (state
                                    is GetSelectedCategoriesFailureState) {
                                  LoadingView.shared.stopLoading();
                                  showErrorToast(context: context);
                                }
                              },
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    /// Fields
                                    OverlayTooltipItem(
                                      displayIndex: 1,
                                      tooltip: (controller) {
                                        return Padding(
                                          padding: EdgeInsetsDirectional.only(
                                            start: 16.w,
                                          ),
                                          child: CustomTooltip(
                                            title:
                                                'Select the model year such as:\n'
                                                'from: 2005 to: 2020',
                                            controller: controller,
                                          ),
                                        );
                                      },
                                      child: Visibility(
                                        visible: _bloc.categories.isNotEmpty,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24.w),
                                          child: BlocConsumer<ManageCarsBloc,
                                              ManageCarsState>(
                                            listener: (context, state) {
                                              if (state
                                                  is UpdateSelectedModelState) {
                                                fromCont
                                                    .text = _getSelectedBrand()
                                                        ?.sellerCarModels
                                                        ?.firstWhere((element) =>
                                                            element
                                                                ?.sellerCarModelId ==
                                                            _getSelectedModelId())
                                                        ?.yearFrom ??
                                                    '';
                                                toCont
                                                    .text = _getSelectedBrand()
                                                        ?.sellerCarModels
                                                        ?.firstWhere((element) =>
                                                            element
                                                                ?.sellerCarModelId ==
                                                            _getSelectedModelId())
                                                        ?.yearTo ??
                                                    '';
                                              }
                                            },
                                            builder: (context, state) {
                                              return Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .only(end: 8.w),
                                                    child: Text(
                                                      'Year from',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFFA2A9B2),
                                                        fontSize: 9.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: InkWell(
                                                      onTap: () => _pickYear(),
                                                      overlayColor:
                                                          const MaterialStatePropertyAll(
                                                              Colors
                                                                  .transparent),
                                                      child: AppTextField(
                                                        controller: fromCont,
                                                        hint: '2005',
                                                        enabled: false,
                                                        hintTextColor:
                                                            const Color(
                                                                0xFFA2A9B2),
                                                        borderColor:
                                                            const Color(
                                                                0xFFC7CBD1),
                                                        suffixWidget: Icon(
                                                          Icons.arrow_drop_down,
                                                          size: 18.w,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  /// To date
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .only(
                                                                start: 8.w,
                                                                end: 8.w),
                                                    child: Text(
                                                      'To',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0xFFA2A9B2),
                                                        fontSize: 9.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),

                                                  Flexible(
                                                    child: InkWell(
                                                      onTap: () =>
                                                          _pickYear(isTo: true),
                                                      overlayColor:
                                                          const MaterialStatePropertyAll(
                                                              Colors
                                                                  .transparent),
                                                      child: AppTextField(
                                                        controller: toCont,
                                                        hint: DateTime.now()
                                                            .year
                                                            .toString(),
                                                        enabled: false,
                                                        hintTextColor:
                                                            const Color(
                                                                0xFFA2A9B2),
                                                        borderColor:
                                                            const Color(
                                                                0xFFC7CBD1),
                                                        suffixWidget: Icon(
                                                          Icons.arrow_drop_down,
                                                          size: 18.w,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),

                                    12.verticalSpace,

                                    /// Categories
                                    Expanded(
                                      child: OverlayTooltipItem(
                                        displayIndex: 2,
                                        tooltipVerticalPosition:
                                            TooltipVerticalPosition.TOP,
                                        tooltip: (controller) {
                                          return Padding(
                                            padding: EdgeInsetsDirectional.only(
                                              start: 16.w,
                                            ),
                                            child: CustomTooltip(
                                              title:
                                                  'Select the categories in which you prefer '
                                                  'to receive orders for the car you have selected',
                                              controller: controller,
                                            ),
                                          );
                                        },
                                        child: GridView.builder(
                                          // shrinkWrap: true,
                                          padding: EdgeInsetsDirectional.only(
                                            start: 24.w,
                                            end: 24.w,
                                            top: 6.h,
                                            bottom: 82.h,
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
                                            return BlocConsumer<ManageCarsBloc,
                                                ManageCarsState>(
                                              listener: (context, state) {
                                                if (state
                                                        is SelectUnSelectCategorySuccessState &&
                                                    (state.clearFields ??
                                                        false)) {
                                                  fromCont.clear();
                                                  toCont.clear();
                                                }
                                              },
                                              builder: (context, state) {
                                                return CategoryWidget(
                                                  category:
                                                      _bloc.categories[index],
                                                );
                                              },
                                            );
                                          },
                                        ),
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
                        top: 124.h,
                        child: BlocConsumer<ManageCarsBloc, ManageCarsState>(
                          listener: (context, state) {
                            if (state is UpdateSelectedBrandState) {
                              // _bloc.add(SelectModel(
                              //     modelId: _getSelectedBrand()
                              //             ?.sellerCarModels
                              //             ?.first
                              //             ?.carModelId ??
                              //         0));
                              _bloc.add(
                                  SelectModel(modelId: _getSelectedModelId()));
                            }
                          },
                          builder: (context, state) {
                            return OverlayTooltipItem(
                              displayIndex: 0,
                              tooltip: (controller) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    start: 16.w,
                                  ),
                                  child: CustomTooltip(
                                    title:
                                        'As a first step select the car brand and model',
                                    controller: controller,
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  /// Brands
                                  SizedBox(
                                    width: 1.sw,
                                    height: .12.sh,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _bloc.cars.length,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w),
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
                                        fromCont.text = _getSelectedBrand()
                                                ?.sellerCarModels
                                                ?.firstWhere((element) =>
                                                    element?.sellerCarModelId ==
                                                    _getSelectedModelId())
                                                ?.yearFrom ??
                                            '';
                                        toCont.text = _getSelectedBrand()
                                                ?.sellerCarModels
                                                ?.firstWhere((element) =>
                                                    element?.sellerCarModelId ==
                                                    _getSelectedModelId())
                                                ?.yearTo ??
                                            '';
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24.w),
                                          itemCount: _getModelsCount(),
                                          itemBuilder: (context, index) {
                                            return SellerCarModelWidget(
                                              model: _getSelectedBrand()
                                                          ?.sellerCarModels![
                                                      index] ??
                                                  GetCarsResponseCarModels(),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: OverlayTooltipItem(
                displayIndex: 3,
                tooltipVerticalPosition: TooltipVerticalPosition.TOP,
                tooltip: (controller) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 16.w,
                    ),
                    child: CustomTooltip(
                      title: 'After selecting the categories for all models,'
                          'press save and start receiving orders!',
                      controller: controller,
                    ),
                  );
                },
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(primaryColor),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.check, size: 22),
                  label: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    _bloc.add(AddCategories());
                  },
                ),
              ),
            );
          },
        );
      },
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

  int _getSelectedModelId() {
    try {
      return _getSelectedBrand()
              ?.sellerCarModels
              ?.firstWhere((element) => element?.isSelected ?? false)
              ?.sellerCarModelId ??
          0;
    } catch (e) {
      return _getSelectedBrand()?.sellerCarModels?.first?.carModelId ?? 0;
    }
  }

  void _pickYear({bool? isTo}) {
    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      backgroundColor: Colors.white,
      builder: (context) {
        final Size size = MediaQuery.of(context).size;
        return Container(
          height: size.height * .7,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 4.w,
            children: [
              ...List.generate(
                50,
                (index) => InkWell(
                  onTap: () {
                    if (isTo ?? false) {
                      if (fromCont.text.isNotEmpty) {
                        final int val = int.tryParse(fromCont.text) ?? 0;
                        if (val > (DateTime.now().year - index)) {
                          showErrorToast(
                              context: context, msg: 'Select valid value');
                          return;
                        }
                      }
                      toCont.text = (DateTime.now().year - index).toString();
                      _bloc.add(UpdateModelYear(
                          from: fromCont.text, to: toCont.text));
                    } else {
                      if (toCont.text.isNotEmpty) {
                        final int val = int.tryParse(toCont.text) ?? 0;
                        if (val < (DateTime.now().year - index)) {
                          showErrorToast(
                              context: context, msg: 'Select valid value');
                          return;
                        }
                      }
                      fromCont.text = (DateTime.now().year - index).toString();
                      _bloc.add(UpdateModelYear(
                          from: fromCont.text, to: toCont.text));
                    }
                    Navigator.pop(context);
                  },
                  child: Chip(
                    surfaceTintColor: Colors.white,
                    shadowColor: Colors.white,
                    label: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        (DateTime.now().year - index).toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
