import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:roome/src/config/themes/cubit/themes_cubit.dart';

import '../../../../core/helpers/helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.title,
  });

  final TextEditingController controller;
  final String hint;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: AppTextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.normal,
                color: state.brightness == Brightness.light
                    ? Colors.black.withOpacity(0.8)
                    : AppColors.white38,
              ),
            ),
            CustomTextFormField(
              height: 35.h,
              errorBorder: InputBorder.none,
              enabledBorder: Helper.buildUnderlineInputBorder(
                color: AppColors.grey.withOpacity(0.75),
              ),
              focusedBorder: Helper.buildUnderlineInputBorder(
                color: AppColors.grey.withOpacity(0.75),
              ),
              hint: hint,
              hintStyle: _buildTextStyle(state),
              style: _buildTextStyle(state),
              controller: controller,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.name,
            ),
          ],
        );
      },
    );
  }

  TextStyle _buildTextStyle(ThemeData themeState) {
    return AppTextStyles.hintStyle.copyWith(
      fontWeight: FontWeight.normal,
      color: themeState.brightness == Brightness.light
          ? Colors.black
          : AppColors.white60,
    );
  }
}