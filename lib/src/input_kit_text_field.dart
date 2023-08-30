import 'package:flutter/material.dart';
import 'input_kit_value.dart';

/// Handle the creation and input of text fields
abstract class InputKitTextField extends StatefulWidget {
	InputKitTextField({ super.key });

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

	/// Maximum lines of a text box 
	final int? maxLines = 10;

	/// Minimum # of lines of a text box
	final int? minLines = null;

	/// Maximum length of the text box
	final int? maxLength = null;

	/// A label to use
	final String? labelText = null;

	/// An event listener
	void onChanged (String text) => value.value = _controller.value.text;

	/// ...
	bool validator() => true; 

	@override	
	State<InputKitTextField> createState() => _InputKitTextFieldState();
}



/// 
class _InputKitTextFieldState extends State<InputKitTextField> {
	@override
	Widget build( BuildContext ctx ) {
		return TextField(
			controller: widget._controller,
			onChanged: widget.onChanged,
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
