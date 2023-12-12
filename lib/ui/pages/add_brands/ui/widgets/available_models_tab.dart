import 'package:bid_express/components/colors.dart';
import 'package:bid_express/models/data_models/cars/brand/brand_model.dart';
import 'package:bid_express/ui/pages/add_brands/bloc/add_brands_bloc.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/model_widget.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableModelsTab extends StatefulWidget {
  final Brand brand;

  const AvailableModelsTab({super.key, required this.brand});

  @override
  State<AvailableModelsTab> createState() => _AvailableModelsTabState();
}

class _AvailableModelsTabState extends State<AvailableModelsTab> {
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
    return Column(
      children: [
        /// Search field
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SearchTextField(
            controller: _controller,
            focusNode: _focusNode,
            onChange: (v) => _bloc.add(SearchForModel(
              brand: widget.brand,
              input: v.trim(),
            )),
          ),
        ),

        16.verticalSpace,

        /// Brands list
        BlocConsumer<AddBrandsBloc, AddBrandsState>(
          listener: (context, state) {
            if (state is SearchForModelSuccessState) {}
            if (state is SelectUnselectModelSuccessState) {}
          },
          builder: (context, state) {
            return Expanded(
              child: _controller.text.trim().isNotEmpty &&
                      ((widget.brand.searchList?.isEmpty ?? false) ||
                          (widget.brand.searchList == null))
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
                      itemCount: (widget.brand.searchList != null)
                          ? widget.brand.searchList?.length
                          : widget.brand.models.length,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemBuilder: (context, index) {
                        return ModelWidget(
                          model: (widget.brand.searchList != null)
                              ? widget.brand.searchList![index]
                              : widget.brand.models[index],
                          onTap: () => _bloc.add(
                            SelectUnselectModel(
                              brand: widget.brand,
                              index: (widget.brand.searchList != null)
                                  ? widget.brand.models.indexWhere(
                                      (element) =>
                                          element.id ==
                                          widget.brand.searchList?[index].id,
                                    )
                                  : index,
                            ),
                          ),
                        );
                      },
                    ),
            );
          },
        ),
      ],
    );
  }
}
