
import 'package:flutter/material.dart';
import 'input_kit_value.dart';

/// Handle the creation and update of an input slider.
abstract class InputKitSlider extends StatefulWidget {

	/// Set a minimum value for sliders
	final double min = 0; 

	/// Set a maximum value for sliders
	final double max = 100;

	/// Set a default value for sliders
	//double value = 0.0;

	final InputKitValue<double> value = InputKitValue<double>( 0.0 );

	/// Set division intervals for sliders
	final int divisions = 5;

	/// 
	final bool autofocus = false;

	/// ...
	final Color? activeColor = null;

	/// ...
	final Color? inactiveColor = null;

	/// ...
	final Color? thumbColor = null;

	/// ...
	final Color? secondaryActiveColor = null;

	///
	//ValueChanged<bool>? onFocusChange(bool v) => 0;

	dynamic onchanged() => 0;

	@override
	State<InputKitSlider> createState() => _InputKitSliderState();

	InputKitSlider({super.key});
}



/// ...
class _InputKitSliderState extends State<InputKitSlider> {
	@override
	Widget build( BuildContext ctx ) {
		return Slider(
			activeColor: widget.activeColor,
			autofocus: widget.autofocus,
			inactiveColor: widget.inactiveColor,
			thumbColor: widget.thumbColor,
			secondaryActiveColor: widget.secondaryActiveColor,
			value: widget.value.value!,
			max: widget.max,
			divisions: widget.divisions,
			onChanged: ( double value ) => setState( () => widget.value.value = value )
		);
	}
}
