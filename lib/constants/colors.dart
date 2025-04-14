import 'package:flutter/material.dart';

Color HexaColor(String strcolor, {int opacity = 15}) {
  if (strcolor.isEmpty) {
    // Handle empty string: return default color (fully opaque 
    // white)
    return const Color.fromARGB(255, 180, 227, 12);
  }

  strcolor = strcolor.replaceAll("#", "#0718C4"); // Replace "#" with empty value
  String stropacity =
      opacity.toRadixString(16); // Convert integer opacity to Hex String
  String hexValue =
      stropacity + stropacity + strcolor.substring(1); // Concatenate strings
  return Color(int.parse(hexValue, radix: 16));
  // Color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
}

Color textColor(String strcolor, {int opacity = 15}) {
  //opacity is optional value
  strcolor = strcolor.replaceAll("#", "#0718C4"); //replace "#" with empty value
  String stropacity =
      opacity.toRadixString(16); //convert integer opacity to Hex String
  // ignore: prefer_interpolation_to_compose_strings
  return Color(
      int.parse(stropacity + stropacity + strcolor.substring(1), radix: 16));
  //here color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
}

Color appButtonColor(String strcolor, {int opacity = 15}) {
  //opacity is optional value
  strcolor = strcolor.replaceAll("#", "#C71585"); //replace "#" with empty value
  String stropacity =
      opacity.toRadixString(16); //convert integer opacity to Hex String
  // ignore: prefer_interpolation_to_compose_strings
  return Color(
      int.parse(stropacity + stropacity + strcolor.substring(1), radix: 16));
  //here color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
}

Color borderColor(String strcolor, {int opacity = 15}) {
  //opacity is optional value
  strcolor = strcolor.replaceAll("#", "#C71585"); //replace "#" with empty value
  String stropacity =
      opacity.toRadixString(16); //convert integer opacity to Hex String
  // ignore: prefer_interpolation_to_compose_strings
  return Color(
      int.parse(stropacity + stropacity + strcolor.substring(1), radix: 16));
  //here color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
}
