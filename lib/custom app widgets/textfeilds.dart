import 'package:downloader/constant/app_theme.dart';
import 'package:downloader/custom%20app%20widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Custom_Text_Feild
class CustomTextFeild extends StatefulWidget {
  const CustomTextFeild(
      {Key? key,
      required this.textEditingController,
      this.hintText,
      this.inputType,
      this.intialValue,
      this.prefixIcon})
      : super(key: key);
  final TextEditingController textEditingController;
  final String? hintText;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final String? intialValue;
  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  void initState() {
    widget.textEditingController.text = widget.intialValue ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          Get.width * 0.07, Get.height * 0.025, Get.width * 0.07, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextFormField(
          controller: widget.textEditingController,
          validator: (value) {
            if (value!.isEmpty) {
              return ("This field cannot be empty");
            } else if (widget.inputType == TextInputType.emailAddress &&
                !value.isEmail) {
              return ("Please enter a valid email");
            } else if (widget.inputType == TextInputType.phone &&
                !value.isPhoneNumber) {
              return ("Please enter a valid phone number");
            }
            return null;
          },
          onSaved: (value) {
            widget.textEditingController.text = value!;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: widget.inputType ?? TextInputType.text,
          style: const TextStyle(color: AppTheme.textfeildText),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Colors.grey, width: 0.5)),
            fillColor: AppTheme.textFeildColor,
            filled: true,
            focusedErrorBorder: AppTheme.errorBorder,
            errorBorder: AppTheme.errorBorder,
            focusedBorder: AppTheme.focusBorder,
            prefixIcon: widget.prefixIcon ??
                const Icon(
                  Icons.person_outlined,
                ),
            border: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.textfeildBoarder, width: 12.0)),
            hintText: widget.hintText ?? '',
            hintStyle: const TextStyle(
                color: AppTheme.hintTextColor, fontWeight: FontWeight.w300),
          )),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////

class EnterPasssword extends StatefulWidget {
  const EnterPasssword({
    Key? key,
    required this.passwordController,
  }) : super(key: key);
  final TextEditingController passwordController;

  @override
  State<EnterPasssword> createState() => _EnterPassswordState();
}

class _EnterPassswordState extends State<EnterPasssword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          Get.width * 0.07, Get.height * 0.03, Get.width * 0.07, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextFormField(
          controller: widget.passwordController,
          obscureText: _obscureText,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Password cannot be empty");
            }
            return null;
          },
          onSaved: (value) {
            widget.passwordController.text = value!;
          },

          //////////////////
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(color: AppTheme.textfeildText),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                    color: AppTheme.textfeildBoarder, width: 0.5)),
            fillColor: AppTheme.textFeildColor,
            filled: true,
            focusedErrorBorder: AppTheme.errorBorder,
            errorBorder: AppTheme.errorBorder,
            focusedBorder: AppTheme.focusBorder,
            prefixIcon: const Icon(
              Icons.lock_outlined,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            border: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.textfeildBoarder, width: 12.0)),
            hintText: 'Password',
            hintStyle: const TextStyle(
                color: AppTheme.hintTextColor, fontWeight: FontWeight.w300),
          )),
    );
  }
}

class ConfirmPasssword extends StatefulWidget {
  const ConfirmPasssword({
    Key? key,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  @override
  State<ConfirmPasssword> createState() => _ConfirmPassswordState();
}

class _ConfirmPassswordState extends State<ConfirmPasssword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          Get.width * 0.07, Get.height * 0.03, Get.width * 0.07, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextFormField(
          controller: widget.confirmPasswordController,
          obscureText: _obscureText,
          validator: (value) {
            if (value!.isEmpty) {
              return (" Confirm password cannot be empty");
            } else if (widget.passwordController.text != value) {
              return ("Passwords do not match");
            }

            return null;
          },
          onSaved: (value) {
            widget.passwordController.text = value!;
          },

          //////////////////
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(color: AppTheme.textfeildText),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                    color: AppTheme.textfeildBoarder, width: 0.5)),
            fillColor: AppTheme.textFeildColor,
            filled: true,
            focusedErrorBorder: AppTheme.errorBorder,
            errorBorder: AppTheme.errorBorder,
            focusedBorder: AppTheme.focusBorder,
            prefixIcon: const Icon(
              Icons.lock_outlined,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            border: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.textfeildBoarder, width: 12.0)),
            hintText: 'Confirm Password',
            hintStyle: const TextStyle(
                color: AppTheme.hintTextColor, fontWeight: FontWeight.w300),
          )),
    );
  }
}

class SearchFeild extends StatelessWidget {
  const SearchFeild({
    Key? key,
    required this.textEditingController,
    this.padding,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding ??
          EdgeInsets.only(
              top: Get.height * 0.025,
              left: Get.width * 0.04,
              right: Get.width * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextFormField(
        controller: textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 15, color: AppTheme.textfeildText),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(
                  color: AppTheme.textfeildBoarder, width: 0.5)),
          fillColor: AppTheme.textFeildColor,
          filled: true,
          focusedErrorBorder: AppTheme.errorBorder,
          errorBorder: AppTheme.errorBorder,
          focusedBorder: AppTheme.focusBorder,
          suffixIcon: const Icon(
            Icons.search,
          ),
          border: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppTheme.textfeildBoarder, width: 12.0)),
          hintText: 'Search',
          hintStyle: const TextStyle(
              color: AppTheme.hintTextColor, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

//** ///////////////////////////////
class CustomTextFeild2 extends StatefulWidget {
  const CustomTextFeild2(
      {Key? key,
      required this.textEditingController,
      this.hintText,
      required this.title,
      this.inputType,
      this.isreadOnly = false,
      this.maxLine = 1,
      this.intialValue = '',
      this.ispreFix = true,
      this.padding,
      this.onChanged,
      this.isLeftEmpty = true,
      this.prefixIcon})
      : super(key: key);
  final TextEditingController textEditingController;
  final String? hintText;
  final int maxLine;
  final bool isLeftEmpty;
  final bool ispreFix;
  final String intialValue;
  final bool isreadOnly;
  final String title;
  final EdgeInsetsGeometry? padding;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final void Function()? onChanged;
  @override
  State<CustomTextFeild2> createState() => _CustomTextFeild2State();
}

class _CustomTextFeild2State extends State<CustomTextFeild2> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.textEditingController.text = widget.intialValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.only(),
      child: Column(
        children: [
          CustomText(
            text: widget.title,
            fontWeight: FontWeight.w600,
            fontSize: 0.016,
            padding: EdgeInsets.only(
                left: Get.width * 0.005,
                top: Get.height * 0.015,
                bottom: Get.height * 0.01),
          ),
          //text feild
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(9),
              boxShadow: [
                BoxShadow(
                    blurRadius: 1.7,
                    color: AppTheme.appTextColor.withOpacity(0.15),
                    spreadRadius: 2)
              ],
            ),
            child: TextFormField(
                autofocus: false,
                readOnly: widget.isreadOnly,
                controller: widget.textEditingController,
                validator: widget.isLeftEmpty
                    ? null
                    : (value) {
                        if (value!.isEmpty) {
                          return ("Field cannot be empty");
                        }
                        return null;
                      },
                onChanged: (value) {
                  if (widget.onChanged == null) return;
                  widget.onChanged!();
                },
                maxLines: widget.maxLine,
                keyboardType: widget.inputType ?? TextInputType.text,
                style: const TextStyle(color: AppTheme.appTextColor),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0.5)),
                  fillColor: AppTheme.backgroundScreenColor,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: 0.5)),
                  prefixIcon: const Icon(Icons.attach_file),
                  suffixIcon: widget.ispreFix
                      ? GestureDetector(
                          onTap: () {
                            widget.textEditingController.clear();
                          },
                          child: Icon(
                            Icons.close,
                            color: AppTheme.hintTextColor.withOpacity(0.8),
                          ),
                        )
                      : null,
                  border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 12.0)),
                  hintText: widget.hintText ?? 'Paste Your URL Here',
                  hintStyle: const TextStyle(
                      color: AppTheme.hintTextColor,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w300),
                )),
          ),
        ],
      ),
    );
  }
}
