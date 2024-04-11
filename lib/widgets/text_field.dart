import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jammybread/utilities/colors.dart';
import 'package:jammybread/utilities/textstyles.dart';

class InputField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final String? validationMessage;
  final TextEditingController? controller;
  final Widget? prefix;
  final bool? suffixIcon;
  final bool readOnly;
  final bool autoFocus;
  final bool hasValidationMessage;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  //final VoidCallback onChanged;

  const InputField({
    super.key,
    required this.labelText,
    this.hintText,
    this.validationMessage,
    this.controller,
    this.prefix,
    this.suffixIcon,
    this.readOnly = false,
    this.autoFocus = false,
    this.hasValidationMessage = false,
    this.validator,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: blackWeight400size14()),
        const SizedBox(height: 8),
        Container(
          decoration: const BoxDecoration(
              color: light80,
              borderRadius: BorderRadius.all(Radius.circular(14))),
          child: TextFormField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            controller: widget.controller,
            autofocus: widget.autoFocus,
            readOnly: widget.readOnly,
            obscureText: passwordVisibility,
            keyboardType: TextInputType.text,
            inputFormatters: widget.inputFormatters,
            onTap: widget.onTap,
            style: blackWeight400size14(),
            validator: widget.validator ??
                (value) {
                  if (value!.isEmpty) {
                    return 'Invalid input';
                  } else {
                    return null;
                  }
                },
            decoration: InputDecoration(
              fillColor: light80,
              prefix: widget.prefix,
              suffix: widget.suffixIcon == true
                  ? InkWell(
                      onTap: () => setState(
                        () => passwordVisibility = !passwordVisibility,
                      ),
                      child: Container(
                        transform: Matrix4.translationValues(0.0, 2.0, 0.0),
                        child: Icon(
                          passwordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: dark80,
                          size: 18,
                        ),
                      ),
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: darkWeight500size12(),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: dark100, width: 1.2),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 2.0),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 2.0),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        // Text(
        //   widget.validationMessage ?? '',
        //   style: kValidationTextStyle,
        // ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class BuildInputBox extends StatefulWidget {
  const BuildInputBox({super.key});

  @override
  State<BuildInputBox> createState() => _BuildInputBoxState();
}

class _BuildInputBoxState extends State<BuildInputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: dark60),
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: const TextField(
          // controller: Controllers.index,
          ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  const EmailTextField(
      {super.key, required this.labelText, this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: controller,
        labelText: labelText,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Invalid input';
          } else if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
          ).hasMatch(value)) {
            return 'Invalid email address';
          }
          return null;
        });
  }
}

// class AmountTextField extends StatelessWidget {
//   final String labelText;
//   final String? hintText;
//   final TextEditingController? controller;
//   final bool? readOnly;
//   const AmountTextField(
//       {super.key,
//       required this.labelText,
//       this.hintText,
//       this.controller,
//       this.readOnly});

//   @override
//   Widget build(BuildContext context) {
//     return InputField(
//         labelText: labelText,
//         hintText: hintText,
//         controller: controller,
//         inputFormatters: [CurrencyInputFormatter()],
//         prefix: const NairaSign(),
//         readOnly: readOnly ?? false,
//         validator: (value) {
//           final RegExp decimalRegExp = RegExp(r'^\d*\.?\d+$');
//           if (value!.isEmpty) {
//             return 'Invalid input';
//           } else if (!decimalRegExp.hasMatch(value.replaceAll(',', ''))) {
//             return 'Please enter a valid amount';
//           }
//           return null;
//         });
//   }
// }

// class CurrencyInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.text.isEmpty) {
//       return newValue.copyWith(text: '');
//     }

//     // Remove non-numeric characters from the input value
//     String cleanedText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

//     // Insert commas every three characters from the right
//     String formattedValue = '';
//     for (int i = cleanedText.length - 1; i >= 0; i--) {
//       formattedValue = cleanedText[i] + formattedValue;
//       if ((cleanedText.length - i) % 3 == 0 && i != 0) {
//         formattedValue = ',' + formattedValue;
//       }
//     }

//     return TextEditingValue(
//       text: formattedValue,
//       selection: TextSelection.collapsed(offset: formattedValue.length),
//     );
//   }
// }
