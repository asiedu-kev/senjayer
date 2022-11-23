import 'package:flutter/material.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

class PinEntryTextField extends StatefulWidget {
  const PinEntryTextField({
    super.key,
  });

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {
  List<String?> _pin = [];
  List<FocusNode?> _focusNodes = [];
  List<TextEditingController?> _textControllers = [];

  Widget textfields = Container();

  @override
  void initState() {
    super.initState();
    _pin = List<String?>.filled(4, null, growable: false);
    _focusNodes = List<FocusNode?>.filled(4, null, growable: false);
    _textControllers =
        List<TextEditingController?>.filled(4, null, growable: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        textfields = generateTextFields(context);
      });
    });
  }

  @override
  void dispose() {
    for (var t in _textControllers) {
      t!.dispose();
    }
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(4, (int i) {
      return buildTextField(i, context);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    for (var tEditController in _textControllers) {
      tEditController!.clear();
    }
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] = FocusNode();
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
    }

    _focusNodes[i]!.addListener(() {
      if (_focusNodes[i]!.hasFocus) {}
    });

    return Container(
      alignment: Alignment.center,
      height: 17.5.w,
      width: 17.5.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppConstants().purple),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(
          fontSize: 44.sp,
          color: Colors.black,
        ),
        focusNode: _focusNodes[i],
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (String str) {
          setState(() {
            _pin[i] = str;
          });
          if (i + 1 != 4) {
            _focusNodes[i]!.unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            } else {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            }
          } else {
            _focusNodes[i]!.unfocus();
            if (_pin[i] == '') {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }
          if (_pin.every((String? digit) => digit != null && digit != '')) {
          }
        },
        onSubmitted: (String str) {
          if (_pin.every((String? digit) => digit != null && digit != '')) {
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textfields;
  }
}
