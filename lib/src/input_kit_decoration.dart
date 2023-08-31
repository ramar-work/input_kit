// This is just an example of how this could work with inputKit in general 
import 'package:flutter/material.dart';
/*

InputDecoration follows something like this...
By default, all the boxes should be white...

// InputDecoration 
final Color? fillColor = Color( 0xffffffff );
final Color? focusColor;
final Color? hoverColor;
final Color? iconColor;
final Color? prefixIconColor;
final Color? suffixIconColor;

final bool? alignLabelWithHint;
final bool enabled = true;
final bool? filled;
final bool isCollapsed = false;
final bool? isDense;
final EdgeInsetsGeometry? contentPadding;
final BoxConstraints? constraints
final String? counterText;
final int? errorMaxLines;
final String? errorText;
final FloatingLabelBehavior? floatingLabelBehavior;
final FloatingLabelAlignment? floatingLabelAlignment;
final String? labelText;
final int? helperMaxLines;
final String? helperText;
final int? hintMaxLines;
final String? hintText;
final TextDirection? hintTextDirection;
final BoxConstraints? prefixIconConstraints;
final String? prefixText;
final String? semanticCounterText;
final BoxConstraints? suffixIconConstraints;
final String? suffixText;

final InputBorder? errorBorder;
final InputBorder? focusedBorder;
final InputBorder? focusedErrorBorder;
final InputBorder? disabledBorder;
final InputBorder? enabledBorder;
final InputBorder? border;

final TextStyle? counterStyle;
final TextStyle? errorStyle;
final TextStyle? floatingLabelStyle;
final TextStyle? helperStyle;
final TextStyle? hintStyle;
final TextStyle? labelStyle;
final TextStyle? prefixStyle;
final TextStyle? suffixStyle;

final Widget? prefix;
final Widget? counter;
final Widget? prefixIcon;
final Widget? suffixIcon;
final Widget? suffix;
final Widget? error;
final Widget? icon;
final Widget? label;
*/



/*
// TextStyle
bool inherit = true;
Color? color;
Color? backgroundColor;
double? fontSize;
FontWeight? fontWeight;
FontStyle? fontStyle;
double? letterSpacing;
double? wordSpacing;
TextBaseline? textBaseline;
double? height;
TextLeadingDistribution? leadingDistribution;
Locale? locale;
Paint? foreground;
Paint? background;
List<Shadow>? shadows;
List<FontFeature>? fontFeatures;
List<FontVariation>? fontVariations;
TextDecoration? decoration;
Color? decorationColor;
TextDecorationStyle? decorationStyle;
double? decorationThickness;
String? debugLabel;
String? fontFamily;
List<String>? fontFamilyFallback;
String? package;
TextOverflow? overflow;
*/



// These are reused in a lot of places
mixin InputKitFieldStyling {
	/// Fill color of the input decoration field
	Color? fillColor = Color( 0xffffffff );

	/// Focused color of the input field
	Color? focusColor;

	/// Hover color of the input field
	Color? hoverColor;

	///
	Color? iconColor;

	///
	Color? prefixIconColor;

	///
	Color? suffixIconColor;

	///
	bool enabled = true;

	///
	bool filled = true;

	///
	bool isCollapsed = false;

	///
	BoxConstraints? constraints;

	/// Allows the user to overwrite with an InputDecoration instance
	InputDecoration? decorator;

	InputDecoration decoration() {
		return decorator ?? InputDecoration(
			fillColor: this.fillColor,
			focusColor: this.focusColor,
			hoverColor: this.hoverColor,
			iconColor: this.iconColor,
			prefixIconColor: this.prefixIconColor,
			suffixIconColor: this.suffixIconColor,
		);
	} 
}



mixin TextStyling {
	bool inherit = true;

	Color? color;

	Color? backgroundColor;

	double? fontSize;

	FontWeight? fontWeight;

	FontStyle? fontStyle;

	double? letterSpacing;

	double? wordSpacing;

	TextBaseline? textBaseline;

	double? height;

	TextLeadingDistribution? leadingDistribution;

	Locale? locale;

	Paint? foreground;

	Paint? background;

	List<Shadow>? shadows;

	TextDecoration? decoration;

	Color? decorationColor;

	TextDecorationStyle? decorationStyle;

	double? decorationThickness;

	String? debugLabel;

	String? fontFamily;

	List<String>? fontFamilyFallback;

	String? package;

	TextOverflow? overflow;

	TextStyle? textStyling;

	//List<FontFeature>? fontFeatures;
	//List<FontVariation>? fontVariations;

	TextStyle textStyle() {
		return TextStyle(
			inherit: inherit,
			color: color,
			backgroundColor: backgroundColor,
			fontSize: fontSize,
			fontWeight: fontWeight,
			fontStyle: fontStyle,
			letterSpacing: letterSpacing,
			wordSpacing: wordSpacing,
			textBaseline: textBaseline,
			height: height,
			leadingDistribution: leadingDistribution,
			locale: locale,
			foreground: foreground,
			background: background,
			shadows: shadows,
			decoration: decoration,
			decorationColor: decorationColor,
			decorationStyle: decorationStyle,
			decorationThickness: decorationThickness,
			debugLabel: debugLabel,
			fontFamily: fontFamily,
			fontFamilyFallback: fontFamilyFallback,
			package: package,
			overflow: overflow,
		);
	}
}
