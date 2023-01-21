import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Comment {
  static textFeild(
    {
      required Function(String)? validator,
      required double height, 
      required double width, 
      required String label, 
      required Icon sufIcon,
      required double fontsize, 
      required FontWeight fontweight, 
      required Color color,
      required TextEditingController? controller,
      required Function(String)? onSave
      }
      ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: height,
      width: width,
      child: TextFormField(
        validator: validator as String? Function(String?),
        onSaved: onSave as String? Function(String?),
        controller: controller,
        style: TextStyle(color: Color(0xffFBFBFB)),
          decoration: InputDecoration(
            
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none
            ),
              fillColor: Color(0xff0F0F11),
              filled: true,
              hintText: label,
                hintStyle: TextStyle(
                  fontSize: fontsize,
                  fontWeight: fontweight,
                  color: color,
              ),
              contentPadding: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
              labelStyle: TextStyle(color: Color(0xffFBFBFB)),
              suffixIcon: sufIcon,

              )),
    );
  }
}

class IconButtons {
  static iconButton(
      {
      required double borderWidth,
      required Color borderColor,
      required double height,
      required double width,
      required Color containerColor,
      required double radius,
      required IconData icon,
      required Color iconcolor,
      required double iconSize,
      required Function() onPressed
      }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            width: borderWidth,
            color: borderColor
          ),
            color: containerColor, borderRadius: BorderRadius.circular(radius)),
        child: Icon(icon, color: iconcolor, size: iconSize,),
      ),
    );
  }
}

class SvgIcon {
  static svgIcon(
      {required String iconUrl,
      required double height,
      required double width,
      }) {
    return SvgPicture.asset(
      iconUrl,
      height: height,
      width: width,
    );
  }
}
