import 'package:flutter/material.dart';
import 'input_kit_value.dart';

/*
x final required bool value = null;
x final required ValueChanged<bool>? onChanged = null;
x final ValueChanged<bool>? onFocusChange = null;

final bool autofocus = false;
final bool? applyCupertinoTheme
final Color? activeColor = null;
final Color? activeTrackColor = null;
final Color? inactiveThumbColor = null;
final Color? focusColor = null;
final Color? hoverColor = null;
final Color? inactiveTrackColor = null;
final MaterialStateProperty<Color?>? thumbColor = null;
final MaterialStateProperty<Color?>? trackColor = null;
final MaterialStateProperty<Color?>? trackOutlineColor = null;
final MaterialStateProperty<double?>? trackOutlineWidth = null;
final MaterialStateProperty<Icon?>? thumbIcon = null;
final double? splashRadius = null;

final ImageProvider<Object>? activeThumbImage = null;
final ImageErrorListener? onActiveThumbImageError = null;
final ImageProvider<Object>? inactiveThumbImage = null;
final ImageErrorListener? onInactiveThumbImageError = null;
final MaterialTapTargetSize? materialTapTargetSize = null;
final DragStartBehavior dragStartBehavior = DragStartBehavior.start = null;
final MouseCursor? mouseCursor = null;
final MaterialStateProperty<Color?>? overlayColor = null;
final FocusNode? focusNode = null;
*/



/// Handle the creation and update of toggle switches 
abstract class InputKitToggleSwitch extends StatefulWidget {
	InputKitToggleSwitch( {super.key} );

	/// A default value
	final InputKitValue<bool> value = InputKitValue<bool>( false );

	/// Automatically inherits from the current theme 
	final Color? activeColor = null; // = Colors.red;

	/// ....
	final Color? activeTrackColor = null; //= Colors.pink;

	/// ....
	final Color? focusColor = null;

	/// ....
	final Color? hoverColor = null;

	/// ....
	final Color? inactiveThumbColor = null;

	/// ....
	final Color? inactiveTrackColor = null;

	/// ....
	final Color? overlayColor = null;

	/// ....
	final bool autofocus = false;

	void setValue( bool v ) {
		if ( v is bool ) {
			value.value = v;
		}
		else {
			print( "Value at InputKitToggleSwitch is not of type bool" );
		}
	}

	@override
	State<InputKitToggleSwitch> createState() => _InputKitToggleSwitchState();
}



/// ...
class _InputKitToggleSwitchState extends State<InputKitToggleSwitch> {
	@override
	Widget build( BuildContext ctx ) {
		return Switch(
			value: widget.value.value!,
			activeColor: widget.activeColor,
			activeTrackColor: widget.activeTrackColor,
			autofocus: widget.autofocus,
			focusColor: widget.focusColor,
			hoverColor: widget.hoverColor,
			inactiveThumbColor: widget.inactiveThumbColor,
			inactiveTrackColor: widget.inactiveTrackColor,
			//overlayColor: widget.overlayColor,
			onChanged: ( bool value ) => setState( () => widget.value.value = value )
		);
	}	
}
