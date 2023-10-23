import 'package:bid_express/components/constants.dart';
import 'package:bid_express/components/main_button.dart';
import 'package:bid_express/components/text_field.dart';
import 'package:bid_express/models/data_models/address.dart';
import 'package:bid_express/ui/pages/signup/ui/widgets/address_title.dart';
import 'package:bid_express/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAddressPage extends StatefulWidget {
  final Address address;

  const EditAddressPage({required this.address});

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> with UiUtility {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _addressNameCont = TextEditingController();
  final FocusNode _addressNameFoc = FocusNode();

  final TextEditingController _cityCont = TextEditingController();
  final FocusNode _cityFoc = FocusNode();

  final TextEditingController _areaCont = TextEditingController();
  final FocusNode _areaFoc = FocusNode();

  final TextEditingController _streetCont = TextEditingController();
  final FocusNode _streetFoc = FocusNode();

  final TextEditingController _buildingCont = TextEditingController();
  final FocusNode _buildingFoc = FocusNode();

  @override
  void dispose() {
    _addressNameFoc.dispose();
    _addressNameFoc.dispose();
    _cityCont.dispose();
    _cityFoc.dispose();
    _areaCont.dispose();
    _areaFoc.dispose();
    _streetCont.dispose();
    _streetFoc.dispose();
    _buildingCont.dispose();
    _buildingFoc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        context: context,
        title: 'Add Address',
        hasBackIcon: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            16.verticalSpace,

            /// Form fields
            Expanded(
              flex: 3,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// Address name field
                      AppTextField(
                        controller: _addressNameCont,
                        focusNode: _addressNameFoc,
                        title: 'Address Name',
                        hint: 'Amman branch, Zarqa branch',
                        inputType: TextInputType.name,
                        regex: businessNameRegex,
                        onSubmit: (val) => _cityFoc.requestFocus(),
                        onSaved: (val) => {},
                      ),

                      12.verticalSpace,

                      /// City field
                      AppTextField(
                        controller: _cityCont,
                        focusNode: _cityFoc,
                        title: 'City',
                        hint: 'Located city',
                        inputType: TextInputType.name,
                        regex: businessNameRegex,
                        onSubmit: (val) => _areaFoc.requestFocus(),
                        onSaved: (val) => {},
                      ),

                      12.verticalSpace,

                      /// Area field
                      AppTextField(
                        controller: _areaCont,
                        focusNode: _areaFoc,
                        title: 'Area',
                        hint: 'Located Area',
                        inputType: TextInputType.name,
                        regex: businessNameRegex,
                        onSubmit: (val) => _streetFoc.requestFocus(),
                        onSaved: (val) => {},
                      ),

                      12.verticalSpace,

                      /// Street field
                      AppTextField(
                        controller: _streetCont,
                        focusNode: _streetFoc,
                        title: 'Street',
                        hint: 'Street Name, Number..',
                        inputType: TextInputType.name,
                        regex: streetAndBuildingRegex,
                        onSubmit: (val) => _buildingFoc.requestFocus(),
                        onSaved: (val) => {},
                      ),

                      12.verticalSpace,

                      /// Building field
                      AppTextField(
                        controller: _buildingCont,
                        focusNode: _buildingFoc,
                        title: 'Building',
                        hint: 'Building Number',
                        isRequired: false,
                        inputType: TextInputType.name,
                        regex: streetAndBuildingRegex,
                        textInputAction: TextInputAction.done,
                        onSaved: (val) => {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Save button
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: MainButton(
                    title: 'SAVE',
                    onTap: () => _validate(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validate({bool? isKeyboardOpen}) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    } else {
      _formKey.currentState?.save();
      if (isKeyboardOpen ?? false) {
        FocusManager.instance.primaryFocus?.unfocus();
        Future.delayed(const Duration(milliseconds: 300)).then((value) {
          _callSaveAddressApi();
        });
      } else {
        _callSaveAddressApi();
      }
    }
  }

  void _callSaveAddressApi() {}
}
