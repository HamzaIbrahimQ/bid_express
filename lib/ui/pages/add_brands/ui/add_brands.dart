import 'package:bid_express/components/colors.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/brand_widget.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/search_text_field.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddBrandsPage extends StatefulWidget {
  const AddBrandsPage({super.key});

  @override
  State<AddBrandsPage> createState() => _AddBrandsPageState();
}

class _AddBrandsPageState extends State<AddBrandsPage> with UiUtility {
  late AddBrandsBloc _bloc;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = context.read<AddBrandsBloc>();
    return Scaffold(
      appBar:
          getAppBar(context: context, title: 'New Brand', hasBackIcon: true),
      body: Column(
        children: [
          16.verticalSpace,

          /// Search field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SearchTextField(
              controller: _controller,
              focusNode: _focusNode,
              onChange: (v) => _bloc.add(Search(input: v.trim())),
            ),
          ),

          16.verticalSpace,

          /// Brands list
          BlocConsumer<AddBrandsBloc, AddBrandsState>(
            listener: (context, state) {
              if (state is SearchSuccessState) {}
            },
            builder: (context, state) {
              return Expanded(
                child: _controller.text.trim().isNotEmpty &&
                        ((_bloc.searchList?.isEmpty ?? false) ||
                            (_bloc.searchList == null))
                    ? Center(
                        child: Text(
                          'No Result',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding:
                            EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                        itemCount: (_bloc.searchList != null)
                            ? _bloc.searchList?.length
                            : _bloc.data.length,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemBuilder: (context, index) {
                          return BrandWidget(
                            brand: (_bloc.searchList != null)
                                ? _bloc.searchList![index]
                                : _bloc.data[index],
                          );
                        },
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
