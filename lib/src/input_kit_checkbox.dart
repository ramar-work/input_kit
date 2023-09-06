import 'package:flutter/material.dart';
import 'input_kit_value.dart';

/*
x final bool autofocus = false = null;
x final required bool? value = null;
x final required ValueChanged<bool?>? onChanged = null;

final bool adaptive = false;
final bool tristate = false;
final bool isError = false;
final String? semanticLabel = null;
final Color? activeColor = null;
final MaterialStateProperty<Color?>? fillColor = null;
final Color? checkColor = null;
final Color? focusColor = null;
final Color? hoverColor = null;
final MaterialStateProperty<Color?>? overlayColor = null;
final double? splashRadius = null;

final MaterialTapTargetSize? materialTapTargetSize = null;
final VisualDensity? visualDensity = null;
final MouseCursor? mouseCursor = null;
final FocusNode? focusNode = null;
final OutlinedBorder? shape = null;
final BorderSide? side = null;
*/

abstract class InputKitCheckbox extends StatefulWidget {

	/// ...
	final InputKitValue<bool> value = InputKitValue<bool>( false );

	/// ...
	final bool? autofocus = false;

	/// ...
	final Color? activeColor = null;

	/// ...
	final Color? checkColor = null;

	/// ...
	final Color? focusColor = null;

	/// ...
	final Color? hoverColor = null;

	///
	final Color? pressedColor = const Color( 0xff000000 );

	///
	final Color? unpressedColor = const Color( 0xffefefef );

	/// ...
	final VisualDensity? visualDensity = null;

	/// ...
	final OutlinedBorder? shape = null;

	/// ...
	final BorderSide? side = null;

	/// ...
	final double? splashRadius = null;

	/// A default setter could run here
	void setValue ( dynamic b ) {
		if ( b is bool )
			value.value = b;
		else if ( b is int ) {
			if ( b == 0 )
				value.value = false;
			else if ( b == 1 )
				value.value = true;
			else {
				// NOTE: Should throw an exception here...
				print( "Value at InputKitCheckbox is not a bool or int" );
				return;
			}
		}
	}

	//MaterialStateProperty<Color?>? fillColor;

	//MaterialStateProperty<Color?>? overlayColor;

	//MaterialTapTargetSize? materialTapTargetSize
	/// An onchanged listener

	@override
	State<InputKitCheckbox> createState() => _InputKitCheckboxState();

	InputKitCheckbox({super.key});
}



/// ...
class _InputKitCheckboxState extends State<InputKitCheckbox> {
	final Set<MaterialState> states = <MaterialState>{
		MaterialState.pressed,
		MaterialState.hovered,
		MaterialState.focused,
	};

	/// Can override tons of stuff with this
	Color? _color( Set<MaterialState> ustates ) {
		return ( ustates.any( states.contains ) ) ? widget.pressedColor : widget.unpressedColor;
	}

	@override
	Widget build( BuildContext ctx ) {
			

		return Checkbox(
			fillColor: MaterialStateProperty.resolveWith( _color ), 
			//overlayColor: MaterialStateProperty.resolveWith( _color ), 
			value: widget.value.value,
			activeColor: widget.activeColor,
			checkColor: widget.checkColor,
			focusColor: widget.focusColor,
			hoverColor: widget.hoverColor,
			splashRadius: widget.splashRadius,
			onChanged: ( bool? value ) => setState( () => widget.value.value = value! ) 
		);
	}	
}
