import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ComponentTextFormField extends StatefulWidget {

  final TextEditingController controller;
  final TextInputType keyboard;
  final IconData icon;
  final String? text;
  final int? maxLength;
  final MaskTextInputFormatter? formatter;
  final Function(String)? onChanged;

  const ComponentTextFormField({
    Key? key,
    required this.controller,
    required this.keyboard,
    required this.icon,
    this.text,
    this.maxLength,
    this.formatter,
    this.onChanged,
  }) : super(key: key);

  @override
  _ComponentTextFormField createState() => _ComponentTextFormField();
}

class _ComponentTextFormField extends State<ComponentTextFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboard,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Theme.of(context).primaryColor,),
        ),
        prefixIcon: Icon(widget.icon, color: Theme.of(context).primaryColor,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Theme.of(context).primaryColor,),
        ),
        labelText: widget.text,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),),
      maxLength: widget.maxLength,
      textInputAction: TextInputAction.next,
      inputFormatters: widget.formatter != null ? [widget.formatter!] : null,
      cursorColor: Theme.of(context).primaryColor,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Insira um valor válido';
        }
        return null;
      },
    );
  }
}