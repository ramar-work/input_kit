import 'package:flutter/material.dart';
import 'input_kit_value.dart';

/// InputKitPassword - Handles passwords
abstract class InputKitPassword extends StatefulWidget {
	InputKitPassword({ super.key });

	/// *TextEditingController 
	final TextEditingController _controller = TextEditingController();

	/// *Grab a value from the controller
	final InputKitValue<String> value = InputKitValue<String>( "" );

	/// Fill color of the input decoration field
	final Color? fillColor = const Color( 0x00ffffff );

	/// Focused color of the input field
	final Color? focusColor = null;

	/// Hover color of the input field
	final Color? hoverColor = null;

	/// Choose a border on the input field
	final dynamic border = const OutlineInputBorder();

	/// Hint text of the input field
	final String? hintText = null; 

	/// Maximum length of the text box
	final int maxLines = 1;

	/// Maximum length of the text box
	final int? maxLength = 124;

	/// A label to use
	final String? labelText = null;

	/// For password fields
	final String obscuringCharacter = '•';

	/// Define a minimum set of characters
	final int minChars = 8;

	/// TODO: Define sequences that must exist
	// final int minChars = 8;

	/// An event listener
	void onChanged (String text) => value.value = _controller.value.text;

	/// ...
	bool validator() => true; 

	@override	
	State<InputKitPassword> createState() => _InputKitPasswordState();
}



/// 
class _InputKitPasswordState extends State<InputKitPassword> {

	// Change this with an optional button
	bool obscured = true;

	@override
	Widget build( BuildContext ctx ) {
		return TextField(
			controller: widget._controller,
			obscureText: obscured,
			obscuringCharacter: widget.obscuringCharacter,
			onChanged: widget.onChanged,
			maxLength: widget.maxLength,
			decoration: InputDecoration(
				border: widget.border,
				labelText: widget.labelText,
				fillColor: widget.fillColor,
				focusColor: widget.focusColor,
				hoverColor: widget.hoverColor,
				filled: ( widget.fillColor != null ) ? true : false ,
				hintText: widget.hintText 
			)
		);
	}
}
