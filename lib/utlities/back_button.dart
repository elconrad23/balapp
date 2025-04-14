import 'package:beauty_button/beauty_button.dart';
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {

  Color textColor(String strcolor, {int opacity = 15}){ //opacity is optional value
    strcolor = strcolor.replaceAll("#", "#0718C4"); //replace "#" with empty value
    String stropacity = opacity.toRadixString(16); //convert integer opacity to Hex String
    // ignore: prefer_interpolation_to_compose_strings
    return Color(int.parse(stropacity + stropacity + strcolor.substring(1), radix: 16));
    //here color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
  }

Color borderColor(String strcolor, {int opacity = 15}){ //opacity is optional value
  strcolor = strcolor.replaceAll("#", "#FF69B4"); //replace "#" with empty value
  String stropacity = opacity.toRadixString(16); //convert integer opacity to Hex String
  // ignore: prefer_interpolation_to_compose_strings
  return Color(int.parse(stropacity + stropacity + strcolor.substring(1), radix: 16));
  //here color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
}

  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BeautyButton(
      title: "Back",
      subtitle: "<",
      color1: textColor("#"),
      color2: borderColor("#"),
    );
  }
}
