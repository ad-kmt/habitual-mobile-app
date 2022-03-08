import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitual/ui/constants/colors.dart';
import 'package:habitual/ui/constants/text_styles.dart';

class BaseInput extends StatefulWidget {
  const BaseInput({
    Key? key,
    this.labelRight = "",
    this.labelLeft = "",
    this.placeholder = "",
    this.fieldMessage = "",
    this.inputType = TextInputType.text,
    this.isObscureText = false,
    this.prefixIconData,
    this.suffixIconData,
    this.validator,
    this.textEditingController,
    this.enabled = true,
  }) : super(key: key);

  final String labelRight;
  final String labelLeft;
  final String placeholder;
  final String fieldMessage;
  final TextInputType inputType;
  final bool isObscureText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final bool enabled;

  @override
  _BaseInputState createState() => _BaseInputState();
}

class _BaseInputState extends State<BaseInput> {
  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// LABEL
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// LABEL LEFT
            if (widget.labelLeft.isNotEmpty)
              Text(
                widget.labelLeft,
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),

            /// LABEL RIGHT
            if (widget.labelRight.isNotEmpty)
              Text(
                widget.labelRight,
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),

        /// TEXT FIELD
        SizedBox(
          height: 48.h,
          child: TextFormField(
            enabled: widget.enabled,
            validator: widget.validator,
            controller: widget.textEditingController,
            obscureText: widget.isObscureText,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: widget.inputType,
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  widget.enabled ? AppColors.uiWhite : AppColors.uiGray_20,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(
                  color: AppColors.uiGray_20,
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.only(
                  left: widget.prefixIconData == null ? 16.w : 0.w,
                  right: widget.suffixIconData == null ? 16.w : 0.w),
              hintText: widget.placeholder,
              hintStyle: AppTextStyles.bodyRegular
                  .copyWith(color: AppColors.textGray_60),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(
                  color: AppColors.uiGray_40,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  color: AppColors.uiGray_40,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  color: AppColors.blue,
                  width: 1.0,
                ),
              ),
              prefixIcon: widget.prefixIconData != null
                  ? Icon(
                      widget.prefixIconData,
                      color: AppColors.uiGray_60,
                    )
                  : null,

              // suffixIcon: suffixIconData != null
              //     ? Icon(
              //         suffixIconData,
              //         color: AppColors.uiGray_60,
              //       )
              //     : null,
              suffixIcon: isTyping
                  ? IconButton(
                      onPressed: () {
                        widget.textEditingController?.clear();
                        setState(() {
                          isTyping = false;
                        });
                      },
                      icon: Icon(
                        Icons.clear,
                        color: AppColors.uiGray_60,
                        size: 20.r,
                      ),
                    )
                  : null,
            ),
            onChanged: (text) {
              setState(() {
                isTyping = text.isEmpty ? false : true;
              });
            },
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        if (widget.fieldMessage.isNotEmpty)
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: AppColors.uiGray_100,
                size: 16.r,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                "Message Text",
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class BaseInput1 extends StatelessWidget {
  const BaseInput1({
    Key? key,
    this.labelRight = "",
    this.labelLeft = "",
    this.placeholder = "",
    this.fieldMessage = "",
    this.inputType = TextInputType.text,
    this.isObscureText = false,
    this.prefixIconData,
    this.suffixIconData,
    this.validator,
    this.textEditingController,
    this.enabled = true,
  }) : super(key: key);

  final String labelRight;
  final String labelLeft;
  final String placeholder;
  final String fieldMessage;
  final TextInputType inputType;
  final bool isObscureText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// LABEL
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// LABEL LEFT
            if (labelLeft.isNotEmpty)
              Text(
                labelLeft,
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),

            /// LABEL RIGHT
            if (labelRight.isNotEmpty)
              Text(
                labelRight,
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),

        /// TEXT FIELD
        SizedBox(
          height: 48.h,
          child: TextFormField(
            enabled: enabled,
            validator: validator,
            controller: textEditingController,
            obscureText: isObscureText,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: inputType,
            decoration: InputDecoration(
              filled: true,
              fillColor: enabled ? AppColors.uiWhite : AppColors.uiGray_20,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(
                  color: AppColors.uiGray_20,
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.only(
                  left: prefixIconData == null ? 16.w : 0.w,
                  right: suffixIconData == null ? 16.w : 0.w),
              hintText: placeholder,
              hintStyle: AppTextStyles.bodyRegular
                  .copyWith(color: AppColors.textGray_60),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(
                  color: AppColors.uiGray_40,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  color: AppColors.uiGray_40,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  color: AppColors.blue,
                  width: 1.0,
                ),
              ),
              prefixIcon: prefixIconData != null
                  ? Icon(
                      prefixIconData,
                      color: AppColors.uiGray_60,
                    )
                  : null,

              // suffixIcon: suffixIconData != null
              //     ? Icon(
              //         suffixIconData,
              //         color: AppColors.uiGray_60,
              //       )
              //     : null,
              suffixIcon: textEditingController != null &&
                      textEditingController!.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.clear,
                        color: AppColors.uiGray_60,
                        size: 20.r,
                      ),
                    )
                  : null,
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        if (fieldMessage.isNotEmpty)
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: AppColors.uiGray_100,
                size: 16.r,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                "Message Text",
                style: AppTextStyles.label.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
