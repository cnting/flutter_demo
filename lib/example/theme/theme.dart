import 'package:flutter/material.dart';

import 'colors.dart';

///https://material.io/design/color/#color-theme-creation
///
final ThemeData gpTheme = ThemeData(
  dividerColor: GpColors.divider,
  primarySwatch: GpColors.primary,
  primaryColor: GpColors.primary,
  accentColor: GpColors.primary,
  brightness: Brightness.light,
  scaffoldBackgroundColor: GpColors.backgroundColor,
  backgroundColor: GpColors.backgroundColor,
  //checkbox radio switch 选中颜色
  toggleableActiveColor: GpColors.primary,
  disabledColor: GpColors.disableColor,
  unselectedWidgetColor: GpColors.disableColor,
  cardColor: GpColors.foregroundColor,

  fontFamily: 'notosans',

  colorScheme: ColorScheme(
    primary: GpColors.primary,

    //夜间模式
    primaryVariant: GpColors.primary,
    secondary: GpColors.secondary,
    secondaryVariant: GpColors.secondary,

    //The background color for widgets like [Card].
    surface: GpColors.foregroundColor,
    background: GpColors.backgroundColor,
    error: Color(0xffd32f2f),

    //在primary位置的字的颜色
    onPrimary: GpColors.normalTextColor,
    onSecondary: GpColors.normalTextColor,
    onSurface: GpColors.normalTextColor,
    onBackground: GpColors.normalTextColor,
    onError: GpColors.normalTextColor,
    brightness: Brightness.light,
  ),

  ///appBarTheme
  appBarTheme: AppBarTheme(
      textTheme: TextTheme(
          title: TextStyle(
        color: GpColors.appbarTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      )),
      color: GpColors.foregroundColor,
      actionsIconTheme: IconThemeData(color: GpColors.appbarIconColor),
      iconTheme: IconThemeData(color: GpColors.appbarIconColor)),

  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: GpColors.indicatorSelectColor, width: 2)),
    labelColor: GpColors.normalTextColor,
    unselectedLabelColor: GpColors.normalTextColor,
  ),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    padding: EdgeInsets.only(top: 9, bottom: 9, left: 16.0, right: 16.0),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: GpColors.yellowBtnBgColor,
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(100.0)),
    ),
    alignedDropdown: false,
    buttonColor: GpColors.yellowBtnBgColor,
    disabledColor: GpColors.disableColor,
    highlightColor: GpColors.yellowBtnBgColor,
//    splashColor: Color(0x1f000000),
  ),

  ///icon
  iconTheme: IconThemeData(
    color: GpColors.appbarIconColor,
    opacity: 1.0,
    size: 24.0,
  ),
  primaryIconTheme: IconThemeData(
    color: GpColors.appbarIconColor,
    opacity: 1.0,
    size: 24.0,
  ),
  accentIconTheme: IconThemeData(
    color: GpColors.appbarIconColor,
    opacity: 1.0,
    size: 24.0,
  ),
  dialogTheme: DialogTheme(
      backgroundColor: GpColors.foregroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xff000000),
          width: 0.0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      )),


  canvasColor: Color(0xfffafafa),
  bottomAppBarColor: Color(0xffffffff),

  highlightColor: Color(0x66bcbcbc),
  splashColor: Color(0x66c8c8c8),
  selectedRowColor: Color(0xfff5f5f5),
  secondaryHeaderColor: Color(0xffe3f2fd),
  textSelectionColor: Color(0xff90caf9),
  textSelectionHandleColor: Color(0xff64b5f6),
  hintColor: GpColors.hintTextColor,
  errorColor: GpColors.hintErrorTextColor,

  textTheme: TextTheme(
    display4: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    ),
    display3: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    ),
    display2: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    display1: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    title: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subhead: TextStyle(
      color: GpColors.normalSubTextColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    body2: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    body1: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    caption: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: GpColors.yellowBtnTextColor,
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subtitle: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
    overline: TextStyle(
      color: GpColors.normalTextColor,
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
//  primaryTextTheme: TextTheme(
//    display4: TextStyle(
//      color: GpColors.primaryTextColor,
//      fontSize: 96.0,
//      fontWeight: FontWeight.w300,
//      fontStyle: FontStyle.normal,
//    ),
//    display3: TextStyle(
//      color: Color(0xb3ffffff),
//      fontSize: 60.0,
//      fontWeight: FontWeight.w300,
//      fontStyle: FontStyle.normal,
//    ),
//    display2: TextStyle(
//      color: Color(0xb3ffffff),
//      fontSize: 48.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    display1: TextStyle(
//      color: Color(0xb3ffffff),
//      fontSize: 34.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    headline: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 24.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    title: TextStyle(
//      color: GpColors.appbarTextColor,
//      fontSize: 20.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    subhead: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 16.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    body2: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 14.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    body1: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 16.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    caption: TextStyle(
//      color: Color(0xb3ffffff),
//      fontSize: 12.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    button: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 14.0,
//      fontWeight: FontWeight.w500,
//      fontStyle: FontStyle.normal,
//    ),
//    subtitle: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 14.0,
//      fontWeight: FontWeight.w500,
//      fontStyle: FontStyle.normal,
//    ),
//    overline: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 10.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//  ),
//  accentTextTheme: TextTheme(
//    display4: TextStyle(
//      color: Color(0xb3ffffff),
//      fontSize: 96.0,
//      fontWeight: FontWeight.w300,
//      fontStyle: FontStyle.normal,
//    ),
//    display3: TextStyle(
//      color: Color(0xb3ffffff),
//      fontSize: 60.0,
//      fontWeight: FontWeight.w300,
//      fontStyle: FontStyle.normal,
//    ),
//    display2: TextStyle(
//      color: Color(0xb3ffffff),
//      fontSize: 48.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    display1: TextStyle(
//      color: Color(0xb3ffffff),
//      fontSize: 34.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    headline: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 24.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    title: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 20.0,
//      fontWeight: FontWeight.w500,
//      fontStyle: FontStyle.normal,
//    ),
//    subhead: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 16.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    body2: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 14.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    body1: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 16.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    caption: TextStyle(
//      color: Color(0xb3ffffff),
//      fontSize: 12.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    button: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 14.0,
//      fontWeight: FontWeight.w500,
//      fontStyle: FontStyle.normal,
//    ),
//    subtitle: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 14.0,
//      fontWeight: FontWeight.w500,
//      fontStyle: FontStyle.normal,
//    ),
//    overline: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 10.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//  ),

///slider
//  sliderTheme: SliderThemeData(
//    activeTrackColor: Color(0xff2196f3),
//    inactiveTrackColor: Color(0x3d2196f3),
//    disabledActiveTrackColor: Color(0x521976d2),
//    disabledInactiveTrackColor: Color(0x1f1976d2),
//    activeTickMarkColor: Color(0x8abbdefb),
//    inactiveTickMarkColor: Color(0x8a2196f3),
//    disabledActiveTickMarkColor: Color(0x1fbbdefb),
//    disabledInactiveTickMarkColor: Color(0x1f1976d2),
//    thumbColor: Color(0xff2196f3),
//    disabledThumbColor: Color(0x521976d2),
//    thumbShape: RoundSliderThumbShape(),
//    overlayColor: Color(0x292196f3),
//    valueIndicatorColor: Color(0xff2196f3),
//    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
//    showValueIndicator: ShowValueIndicator.onlyForDiscrete,
//    valueIndicatorTextStyle: TextStyle(
//      color: Color(0xffffffff),
//      fontSize: 14.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//  ),
///chip
//  chipTheme: ChipThemeData(
//    backgroundColor: Color(0x1f000000),
//    brightness: Brightness.light,
//    deleteIconColor: Color(0xde000000),
//    disabledColor: Color(0x0c000000),
//    labelPadding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 8.0, right: 8.0),
//    labelStyle: TextStyle(
//      color: Color(0xde000000),
//      fontSize: 14.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0, right: 4.0),
//    secondaryLabelStyle: TextStyle(
//      color: Color(0x3d000000),
//      fontSize: 14.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    secondarySelectedColor: Color(0x3d2196f3),
//    selectedColor: Color(0x3d000000),
//    shape: StadiumBorder(
//        side: BorderSide(
//      color: Color(0xff000000),
//      width: 0.0,
//      style: BorderStyle.none,
//    )),
//  ),

);
///input
//  inputDecorationTheme: InputDecorationTheme(
//    labelStyle: TextStyle(
//      color: Color(0xdd000000),
//      fontSize: 16.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    helperStyle: TextStyle(
//      color: Color(0xdd000000),
//      fontSize: 16.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    hintStyle: TextStyle(
//      color: Color(0xdd000000),
//      fontSize: 16.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    errorStyle: TextStyle(
//      color: Color(0xdd000000),
//      fontSize: 16.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    errorMaxLines: null,
//    hasFloatingPlaceholder: true,
//    isDense: false,
//    contentPadding:
//    EdgeInsets.only(top: 12.0, bottom: 12.0, left: 0.0, right: 0.0),
//    isCollapsed: false,
//    prefixStyle: TextStyle(
//      color: Color(0xdd000000),
//      fontSize: 16.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    suffixStyle: TextStyle(
//      color: Color(0xdd000000),
//      fontSize: 16.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    counterStyle: TextStyle(
//      color: Color(0xdd000000),
//      fontSize: 16.0,
//      fontWeight: FontWeight.w400,
//      fontStyle: FontStyle.normal,
//    ),
//    filled: false,
//    fillColor: Color(0x00000000),
//    errorBorder: UnderlineInputBorder(
//      borderSide: BorderSide(
//        color: Color(0xff000000),
//        width: 1.0,
//        style: BorderStyle.solid,
//      ),
//      borderRadius: BorderRadius.all(Radius.circular(4.0)),
//    ),
//    focusedBorder: UnderlineInputBorder(
//      borderSide: BorderSide(
//        color: Color(0xff000000),
//        width: 1.0,
//        style: BorderStyle.solid,
//      ),
//      borderRadius: BorderRadius.all(Radius.circular(4.0)),
//    ),
//    focusedErrorBorder: UnderlineInputBorder(
//      borderSide: BorderSide(
//        color: Color(0xff000000),
//        width: 1.0,
//        style: BorderStyle.solid,
//      ),
//      borderRadius: BorderRadius.all(Radius.circular(4.0)),
//    ),
//    disabledBorder: UnderlineInputBorder(
//      borderSide: BorderSide(
//        color: Color(0xff000000),
//        width: 1.0,
//        style: BorderStyle.solid,
//      ),
//      borderRadius: BorderRadius.all(Radius.circular(4.0)),
//    ),
//    enabledBorder: UnderlineInputBorder(
//      borderSide: BorderSide(
//        color: Color(0xff000000),
//        width: 1.0,
//        style: BorderStyle.solid,
//      ),
//      borderRadius: BorderRadius.all(Radius.circular(4.0)),
//    ),
//    border: UnderlineInputBorder(
//      borderSide: BorderSide(
//        color: Color(0xff000000),
//        width: 1.0,
//        style: BorderStyle.solid,
//      ),
//      borderRadius: BorderRadius.all(Radius.circular(4.0)),
//    ),
//  ),
