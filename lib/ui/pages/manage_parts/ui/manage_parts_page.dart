import 'package:bid_express/models/responses/category/category_response.dart';
import 'package:bid_express/ui/pages/add_brands/ui/widgets/search_text_field.dart';
import 'package:bid_express/ui/pages/manage_parts/bloc/manage_parts_bloc.dart';
import 'package:bid_express/ui/pages/manage_parts/ui/widgets/part_widget.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManagePartsPage extends StatefulWidget {
  final CategoryResponse category;
  final List<int?>? selectedPartsIds;

  const ManagePartsPage(
      {super.key, required this.category, required this.selectedPartsIds});

  @override
  State<ManagePartsPage> createState() => _ManagePartsPageState();
}

class _ManagePartsPageState extends State<ManagePartsPage> with UiUtility {
  late ManagePartsBloc _bloc;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ManagePartsBloc>();
    if (widget.selectedPartsIds != null &&
        (widget.selectedPartsIds?.isNotEmpty ?? false)) {
      _bloc.selectedPartsIds = widget.selectedPartsIds;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: widget.category.nameEn ?? '',
        hasBackIcon: true,
      ),
      body: Column(
        children: [
          /// Search field
          SearchTextField(
            controller: _controller,
            focusNode: _focusNode,
            onChange: (v) => {},
          ),

          16.verticalSpace,

          /// Parts grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 6.h,
              ),
              itemCount: _bloc.parts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
              ),
              itemBuilder: (context, index) {
                return PartWidget(
                  part: _bloc.parts[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
