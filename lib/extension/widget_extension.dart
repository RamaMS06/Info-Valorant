import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infovalorant/util/colors.dart';

Widget setFontText(String value, Color color, double size, FontWeight weight) =>
    Text(value,
        style: GoogleFonts.openSans(
            color: color, fontSize: size, fontWeight: weight),
        maxLines: 10);

Widget textWhite(String value, double size, FontWeight weight) =>
    setFontText(value, CoreColors.white, size, weight);

Widget textRed(String value, double size, FontWeight weight) =>
    setFontText(value, CoreColors.colorPrimary, size, weight);

Widget textBlack(String value, double size, FontWeight weight) =>
    setFontText(value, CoreColors.black, size, weight);

Widget textSilver(String value, double size, FontWeight weight) =>
    setFontText(value, CoreColors.silver, size, weight);
