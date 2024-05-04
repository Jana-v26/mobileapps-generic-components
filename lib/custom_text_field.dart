import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_components/validator_class.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final TextEditingController controller;
  final Widget? suffixWidget;
  final bool? isEnable;
  final bool? isReadOnly;
  final GestureTapCallback? onTapped;
  final Widget? prefixWidget;
  final TextInputType? keyBoardType;
  final int? maximumWordCount;
  final UnderlineInputBorder? disabledBorder;
  final bool? filled;
  final Color? enableColor;
  final FocusNode? focusNode;
  final Color? focusedBorder;
  final List<TextInputFormatter>? inputformaters;
  final Function(String)? onEditing;
  final Function(bool)? validatorCallBack;
  final Widget? prefixIcon;
  final EdgeInsets? contentPadding;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String? Function(String?)? validatorFunction;
  final AutovalidateMode? autoValidateMode;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final Color? titleColor;
  final Color? borderColor,
      enabledBorderColor,
      disabledColor,
      errorColor,
      focusedColor;
  final Color? textColor;
  final List<String>? validationRules;
  final Function? onComplete;
  final Function? onSubmitted;
  final int? fontSize;
  final Function(String)? onChanged;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final double? cursorHeight;
  final double? cursorWidth;
  final TextAlign? labelAlign;
  final TextOverflow? textOverflow;
  final EdgeInsets? labelSpacing;
  final InputDecoration? inputDecoration;

  const CustomTextField(
      {super.key,
      this.inputDecoration,
      this.hintText,
      this.textStyle,
      this.labelText = "",
      this.obscureText = false,
      required this.controller,
      this.suffixWidget,
      this.isEnable,
      this.isReadOnly = false,
      this.onTapped,
      this.prefixWidget,
      this.keyBoardType,
      this.maximumWordCount,
      this.enableColor,
      this.focusNode,
      this.focusedBorder,
      this.inputformaters,
      this.onEditing,
      this.validatorCallBack,
      this.prefixIcon,
      this.labelStyle,
      this.filled,
      this.onComplete,
      this.disabledBorder,
      this.contentPadding,
      this.fillColor,
      this.titleColor,
      this.borderColor,
      this.textColor = const Color(0xffFFA63E),
      this.onSubmitted,
      this.errorStyle,
      this.hintStyle,
      this.validatorFunction,
      this.autoValidateMode,
      this.maxLines,
      this.minLines,
      this.fontSize,
      this.validationRules,
      this.enabledBorderColor,
      this.disabledColor,
      this.errorColor,
      this.focusedColor,
      this.onChanged,
      this.height = 0,
      this.width = 0,
      this.margin = const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      this.textOverflow = TextOverflow.ellipsis,
      this.labelAlign = TextAlign.start,
      this.cursorHeight = 18.0,
      this.cursorWidth = 1.5,
      this.labelSpacing = const EdgeInsets.all(5)});

  @override
  State<CustomTextField> createState() => _CurvedTextFieldState();
}

class _CurvedTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    // final dark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: widget.margin!,
      child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Padding(
              padding: widget.labelSpacing!,
              child: Text(
                widget.labelText!,
                textAlign: widget.labelAlign!,
                style: widget.labelStyle,
                overflow: widget.textOverflow,
              ),
            ),
            SizedBox(
              width: widget.width ?? MediaQuery.of(context).size.width * 0.6,
              height: widget.height ?? MediaQuery.of(context).size.height * 0.05,
              child: TextFormField(
                keyboardType: widget.keyBoardType,
                // cursorColor:
                //     dark ? const Color(0xffFFA63E) : const Color(0xff60D4FE),
                focusNode: widget.focusNode,
                cursorRadius: const Radius.circular(10),
                controller: widget.controller,
                maxLength: widget.maximumWordCount,
                style: widget.textStyle ?? TextStyle(color: Colors.white70),
                // style: dark
                //     ? Theme.of(context)
                //         .textTheme
                //         .bodyMedium
                //         ?.copyWith(color: const Color(0xffFFA63E))
                //     : Theme.of(context)
                //         .textTheme
                //         .bodyMedium
                //         ?.copyWith(color: const Color(0xff576064)),
                validator: widget.validatorFunction ??
                    (String? value) {
                      if (widget.validationRules!.isNotEmpty) {
                        final ValidationState validationStatus =
                            Validator.validate(value ?? '',
                                rules: widget.validationRules!);
                        if (widget.validatorCallBack != null) {
                          widget.validatorCallBack!(validationStatus.status);
                        }
                        if (!validationStatus.status) {
                          return validationStatus.error;
                        }
                      }
                      return null;
                    },
                inputFormatters: widget.inputformaters ??
                    [
                      LengthLimitingTextInputFormatter(widget.maximumWordCount),
                    ],
                autocorrect: false,
                // enableInteractiveSelection: widget.isReadOnly!,
                enableSuggestions: false,
                readOnly: widget.isReadOnly!,
                cursorHeight: widget.cursorHeight!,
                cursorWidth: widget.cursorWidth!,
                autovalidateMode: widget.autoValidateMode,
                textAlign: TextAlign.start,
                onEditingComplete: () {
                  if (widget.onEditing != null) {
                    widget.onEditing!(widget.controller.text);
                  }
                },
                enabled: widget.isEnable,
                onChanged: (value) {
                  // widget.onEditing!(widget.controller.text);
                  if (widget.onChanged != null) {
                    widget.onChanged!(widget.controller.text);
                  }
                },
                onTap: () {
                  debugPrint(widget.isReadOnly.toString());
                  debugPrint('onTapped');

                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  //   // Add Your Code here.
                  //   // setState(() {});
                  // });

                  if (widget.isReadOnly! && widget.onTapped != null) {
                    widget.onTapped!();
                  }
                },
                onTapOutside: (value) {
                  // Action
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                onFieldSubmitted: (value) {
                  if (widget.onSubmitted != null) {
                    widget.onSubmitted;
                  }
                  // Action
                },
                obscureText: widget.obscureText!,
                onSaved: (value) {},
                decoration:
                    InputDecoration(
                      enabledBorder: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(),
                      border: UnderlineInputBorder(),
                      disabledBorder: UnderlineInputBorder(),
                      focusedErrorBorder: UnderlineInputBorder(),
                      errorBorder: UnderlineInputBorder(),
                      contentPadding: widget.contentPadding,
                      suffix: widget.suffixWidget,
                      hintText: widget.hintText,
                      hintStyle: widget.hintStyle,
                      // labelText: widget.labelText,
                      prefixIcon: widget.prefixIcon,
                      suffixIcon: widget.suffixWidget,
                    ),
              ),
            ),
          ]),
    );
  }
}
