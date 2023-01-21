import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTextFeild {
  bool isObsecure = false;
  static textfeild({
    required Function(String)? onSave,
    required Function(String)? validator,
    required TextEditingController? controller,
    required String label,
    required Icon icon,
    required Function() visibility,
    required Icon sufIcon,
    required double height,
    required double width,
    required double radius,
    required double labelFont,
    required FontWeight labelFontWeight,
    required Color labelColor,
    required bool obsecureText,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextFormField(
        textDirection: TextDirection.ltr,
        autofocus: false,
        onSaved: onSave as String? Function(String?),
        validator: validator as String? Function(String?),
        controller: controller,
        obscureText: obsecureText,
        style: TextStyle(color: Color(0xffFBFBFB)),
        decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 10),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1,
                  color: Color(0xffFBFBFB).withOpacity(0.7),
                  strokeAlign: StrokeAlign.inside),
              borderRadius: BorderRadius.circular(radius),
            ),
            fillColor: Color(0xff0F0F11),
            filled: true,
            hintStyle: TextStyle(
              fontSize: labelFont,
              fontWeight: labelFontWeight,
              color: labelColor,
            ),
            hintText: label,
            // helperText: "",
            labelStyle: TextStyle(color: Color(0xffFBFBFB)),
            suffixIcon: GestureDetector(
              onTap: visibility,
              child: sufIcon,
            ),
            prefixIcon: icon,
            contentPadding: EdgeInsets.only(top: 20),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1,
                  color: Color(0xffFBFBFB).withOpacity(0.7),
                  strokeAlign: StrokeAlign.inside),
              borderRadius: BorderRadius.circular(radius),
            )),
      ),
    );
  }

  static dropDownTextFeild({
   required Function(String)? onSave,
    required Function(String)? validator,
    required TextEditingController? controller,
    required List<String> label,
    required Icon icon,
    required Function() visibility,
    required Icon sufIcon,
    required double height,
    required double width,
    required double radius,
    required double labelFont,
    required FontWeight labelFontWeight,
    required Color labelColor,
    required bool obsecureText,
    required String hintText

  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextFormField(
        readOnly: true,
        textDirection: TextDirection.ltr,
        autofocus: false,
        onSaved: onSave as String? Function(String?),
        validator: validator as String? Function(String?),
        controller: controller,
        obscureText: obsecureText,
        style: TextStyle(color: Color(0xffFBFBFB)),
        decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 10),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1,
                  color: Color(0xffFBFBFB).withOpacity(0.7),
                  strokeAlign: StrokeAlign.inside),
              borderRadius: BorderRadius.circular(radius),
            ),
            fillColor: Color(0xff0F0F11),
            filled: true,
            hintStyle: TextStyle(
              fontSize: labelFont,
              fontWeight: labelFontWeight,
              color: labelColor,
            ),
            hintText: hintText,
            // helperText: "",
            labelStyle: TextStyle(color: Color(0xffFBFBFB)),
            suffixIcon: PopupMenuButton<String>(
            icon: sufIcon,
            onSelected: (String value) {
              controller!.text = value;
            },
            
            color: Color(0xffFFFFFF).withOpacity(0.7),
            itemBuilder: (BuildContext context) {
              return label.map<PopupMenuItem<String>>((String value) {
                return new PopupMenuItem(child: new Text(value), value: value);
              }).toList();
            },
          ),
            prefixIcon: icon,
            contentPadding: EdgeInsets.only(top: 20),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1,
                  color: Color(0xffFBFBFB).withOpacity(0.7),
                  strokeAlign: StrokeAlign.inside),
              borderRadius: BorderRadius.circular(radius),
            )),
      ),
    );
}
}