import 'package:firebase_authentication/constants.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    Key? key,
    required this.hint,
    required this.obsecureText,
    required this.enableSuggestions,
    required this.autocorrect,
    this.suffixicon,
    this.prefixicon,
    this.onClick,
    this.prefixText,
    required this.onChanged,
    this.validate,
    required this.textEditingController,
  }) : super(key: key);

  final String hint;
  final void Function(String)? onChanged;
  final String? Function(String?)? validate;
  final String? prefixText;
  final bool obsecureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final Widget? suffixicon;
  final IconData? prefixicon;
  final VoidCallback? onClick;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validate,
      onChanged: onChanged,
      obscureText: obsecureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: textFieldColor,
        prefixText: prefixText,
        prefixStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(prefixicon),
        suffixIcon: suffixicon,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
