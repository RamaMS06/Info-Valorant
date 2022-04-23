import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget setFontText(String value, Color color, double size, FontWeight weight) =>
    Text(value,
        style: GoogleFonts.openSans(
            color: color, fontSize: size, fontWeight: weight),
        maxLines: 10);

Widget textWhite(String value, double size, FontWeight weight) =>
    setFontText(value, const Color(0xffFFFFFF), size, weight);

Widget textRed(String value, double size, FontWeight weight) =>
    setFontText(value, const Color(0xffFF4655), size, weight);

Widget textBlack(String value, double size, FontWeight weight) =>
    setFontText(value, const Color(0xff000000), size, weight);
