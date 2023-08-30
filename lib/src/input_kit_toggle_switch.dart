import 'package:flutter/material.dart';
import 'input_kit_value.dart';


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

	/// ....
	dynamic onChanged() => 0;

	/// ....
	dynamic onFocusChange() => 0;
		
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
