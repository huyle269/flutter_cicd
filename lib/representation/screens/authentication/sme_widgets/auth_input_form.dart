import 'package:crm_app/core/app_assets/AppAssets.dart';
import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AuthInputForm extends StatefulWidget {
  const AuthInputForm({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.validator,
    required this.suffix,
    this.obscureText = false,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final String hintText;
  final List<FieldValidator<dynamic>>? validator;
  final Widget suffix;
  final bool obscureText;
  @override
  _AuthInputFormState createState() => _AuthInputFormState();
}

class _AuthInputFormState extends State<AuthInputForm> {
  late String label = '';
  late bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.toScreenSize,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.white),
              height: 56.toScreenSize,
            ),
          ),
          TextFormField(
              controller: widget.textEditingController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLines: 1,
              obscureText: _obscure,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                labelText: label,
                labelStyle: TextStyle(color: Color(0xff00B74F), fontSize: 12),
                hintText: widget.hintText,
                alignLabelWithHint: true,
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Color(0xff999999),
                ),
                suffix: GestureDetector(
                  onTap: widget.obscureText
                      ? () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        }
                      : () {
                          setState(() {
                            widget.textEditingController.clear();
                          });
                        },
                  child: widget.obscureText
                      ? Image.asset(
                          _obscure ? AppAssets.unsee : AppAssets.see,
                          width: 20.toScreenSize,
                          height: 20.toScreenSize,
                        )
                      : widget.suffix,
                ),
              ),
              validator: MultiValidator(widget.validator ?? []),
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    label = widget.hintText;
                  } else {
                    label = '';
                  }
                });
              }),
        ],
      ),
    );
  }
}
