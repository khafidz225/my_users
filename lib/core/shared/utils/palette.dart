import 'dart:ui';

class Palette {
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String colorToHex(Color color) {
    var colorString = color.toString();
    var convertColorToHex =
        "#${colorString.substring(10, colorString.length - 1)}";
    return convertColorToHex;
  }

  static String sC0 = '#FFF1F1';
  static String sC10 = '#FFD6D6';
  static String sC30 = '#FF8585';
  static String sC40 = '#FF6B6B';
  static String sB0 = '#EBF5FB';
  static String sB10 = '#D5EAF7';
  static String sB30 = '#53AAE0';
  static String sB40 = '#2D98DA';
  static String sB50 = '#2479AE';
  static String sD0 = '#E7F2F7';
  static String sD5 = '#c8e8ff';
  static String sD10 = '#B9DAE9';
  static String sD30 = '#2E90BE';
  static String sD40 = '#0F7AAE';
  static String sD50 = '#006391';
  static String sD60 = '#2db5c9';
  static String sG0 = '#EAF9F1';
  static String sG10 = '#C2EDD6';
  static String sG20 = '#71D6A0';
  static String sG30 = '#48CA85';
  static String sG40 = '#20BF6B';
  static String sG50 = '#adc021';
  static String sM0 = '#F6F2ED';
  static String sM40 = '#A27842';
  static String sN0 = '#FFFFFF';
  static String sN10 = '#F5F7F8';
  static String sN20 = '#EDEEF1';
  static String sN30 = '#C9CED7';
  static String sN40 = '#A5AEBD';
  static String sN50 = '#818DA3';
  static String sN60 = '#5D6D89';
  static String sN70 = '#394D6F';
  static String sO0 = '#FEF3EC';
  static String sO30 = '#FA9856';
  static String sO40 = '#FA8231';
  static String sP0 = '#F3ECF5';
  static String sP5 = '#EFEFFC';
  static String sP10 = '#DDC7E1';
  static String sP20 = '#7A78C6';
  static String sP30 = '#9957A7';
  static String sP40 = '#833294';
  static String sP60 = '#612d7a';
  static String sR0 = '#FDEDF0';
  static String sR40 = '#EB3B5A';
  static String sR50 = '#C1314A';
  static String sV30 = '#D7588D';
  static String sV40 = '#CF3474';
  static String sY0 = '#FEF8EC';
  static String sY40 = '#F7B731';
  static String sY70 = '#c06b21';

  static Color c0 = hexToColor(sC0);
  static Color c10 = hexToColor(sC10);
  static Color c30 = hexToColor(sC30);
  static Color c40 = hexToColor(sC40);
  static Color b0 = hexToColor(sB0);
  static Color b10 = hexToColor(sB10);
  static Color b30 = hexToColor(sB30);
  static Color b40 = hexToColor(sB40);
  static Color b50 = hexToColor(sB50);
  static Color d0 = hexToColor(sD0);
  static Color d5 = hexToColor(sD5);
  static Color d10 = hexToColor(sD10);
  static Color d30 = hexToColor(sD30);
  static Color d40 = hexToColor(sD40);
  static Color d50 = hexToColor(sD50);
  static Color d60 = hexToColor(sD60);
  static Color g0 = hexToColor(sG0);
  static Color g10 = hexToColor(sG10);
  static Color g20 = hexToColor(sG20);
  static Color g30 = hexToColor(sG30);
  static Color g40 = hexToColor(sG40);
  static Color g50 = hexToColor(sG50);
  static Color m0 = hexToColor(sM0);
  static Color m40 = hexToColor(sM40);
  static Color n0 = hexToColor(sN0);
  static Color n10 = hexToColor(sN10);
  static Color n20 = hexToColor(sN20);
  static Color n30 = hexToColor(sN30);
  static Color n40 = hexToColor(sN40);
  static Color n50 = hexToColor(sN50);
  static Color n60 = hexToColor(sN60);
  static Color n70 = hexToColor(sN70);
  static Color o0 = hexToColor(sO0);
  static Color o30 = hexToColor(sO30);
  static Color o40 = hexToColor(sO40);
  static Color p0 = hexToColor(sP0);
  static Color p5 = hexToColor(sP5);
  static Color p10 = hexToColor(sP10);
  static Color p20 = hexToColor(sP20);
  static Color p30 = hexToColor(sP30);
  static Color p40 = hexToColor(sP40);
  static Color p60 = hexToColor(sP60);
  static Color r0 = hexToColor(sR0);
  static Color r40 = hexToColor(sR40);
  static Color r50 = hexToColor(sR50);
  static Color v30 = hexToColor(sV30);
  static Color v40 = hexToColor(sV40);
  static Color y0 = hexToColor(sY0);
  static Color y40 = hexToColor(sY40);
  static Color y70 = hexToColor(sY70);
}

class FontSize {
  static double size6 = 6;
  static double size7 = 7;
  static double size8 = 8;
  static double size9 = 9;
  static double size10 = 10;
  static double size11 = 11;
  static double size12 = 12;
  static double size13 = 13;
  static double size14 = 14;
  static double size15 = 15;
  static double size16 = 16;
  static double size17 = 17;
  static double size18 = 18;
  static double size19 = 19;
  static double size20 = 20;
  static double size21 = 21;
  static double size22 = 22;
  static double size23 = 23;
  static double size24 = 24;
  static double size25 = 25;
  static double size26 = 26;
  static double size27 = 27;
  static double size28 = 28;
  static double size29 = 29;
  static double size30 = 30;
}
