/**
input_kit.dart

A set of (somewhat) useful utilities for
solving input related problems.

**/


import 'package:flutter/material.dart';
import 'mappable.dart';



/// Handle the creation and input of text fields
class InputKitTextField extends StatefulWidget {
	InputKitTextField( {super.key} );

	TextEditingController _controller = TextEditingController();

	String value() => _controller.value.text;

	/// Analyze _controller.value here...
	bool validator() => true; 

	@override	
	State<InputKitTextField> createState() => _InputKitTextFieldState();
}


class _InputKitTextFieldState extends State<InputKitTextField> {
	@override
	Widget build( BuildContext ctx ) {
		return TextField(
			controller: widget._controller,
			decoration: InputDecoration(
				border: OutlineInputBorder(),
				fillColor: Color( 0xffffffff ),
				filled: true,
				hintText: "Search stuff..."	
			)
		);
	}
}






/// Handle the creation and update of toggle switches 
class InputKitToggleSwitch extends StatefulWidget {
	InputKitToggleSwitch({super.key});

	bool value = false;

	@override
	State<InputKitToggleSwitch> createState() => _InputKitToggleSwitchState();
}



class _InputKitToggleSwitchState extends State<InputKitToggleSwitch> {
	@override
	Widget build( BuildContext ctx ) {
		return Switch(
			value: widget.value,
			activeColor: Colors.red,
			onChanged: ( bool value ) => setState( () => widget.value = value )
		);
	}	
}



/// Handle the creation and update of checkboxes 
class InputKitCheckbox extends StatefulWidget {
	InputKitCheckbox({super.key});

	bool value = false;
	
	@override
	State<InputKitCheckbox> createState() => _InputKitCheckboxState();
}



class _InputKitCheckboxState extends State<InputKitCheckbox> {
	bool checked = false;

	final Set<MaterialState> states = <MaterialState>{
		MaterialState.pressed,
		MaterialState.hovered,
		MaterialState.focused,
	};

	/// Can override tons of stuff with this
	Color _color( Set<MaterialState> ustates ) {
		return ( ustates.any( states.contains ) ) ? Colors.blue : Colors.red;
	}

	@override
	Widget build( BuildContext ctx ) {
		return Checkbox(
			checkColor: Colors.white,
			fillColor: MaterialStateProperty.resolveWith( _color ), 
			value: widget.value,
			activeColor: Colors.red,
			onChanged: ( bool? value ) => setState( () => widget.value = value! ) 
		);
	}	
}




/// Handle the creation and update of an input slider.
class InputKitSlider extends StatefulWidget {

	/// Set a minimum value for sliders
	double min = 0; 

	/// Set a maximum value for sliders
	double max = 100;

	/// Set a default value for sliders
	double value = 0.0;

	/// Set division intervals for sliders
	int divisions = 5;

	@override
	State<InputKitSlider> createState() => _InputKitSliderState();

	InputKitSlider({super.key});
}



class _InputKitSliderState extends State<InputKitSlider> {
	@override
	Widget build( BuildContext ctx ) {
		return Slider(
			value: widget.value,
			max: widget.max,
			divisions: widget.divisions,
			onChanged: ( double value ) => setState( () => widget.value = value )
		);
	}
}



// 
enum InputKitOrientation {
	Row,
	Column
}



/// Handle the creation and update of a radio group. 
class InputKitRadio extends StatefulWidget {
	dynamic? value;

	// TODO: Should be list t
	List<({String name, dynamic value})> choices = [
		( name: "Value A", value: "Something" ),
		( name: "Value B", value: "Something Else" ),
	];

	/// Define orientation (row or column)
	InputKitOrientation orientation = InputKitOrientation.Column;

	// TODO: This could be named a little better
	// Define how to create the widgets that encapsulate the radio items 
	Widget constructor( _InputKitRadioState state, ({String name, dynamic value}) c ) {
		return ListTile(
			title: Text( c.name ),
			leading: Radio(
				value: c.value,
				groupValue: value,
				onChanged: (dynamic v) => state.setState( () => value = v )
			)
		);
	}	

	@override
	State<InputKitRadio> createState() => _InputKitRadioState();

	InputKitRadio({super.key});
}



class _InputKitRadioState extends State<InputKitRadio> {
	List<Widget> children = [];

	Widget _rGroup() => Row( children: children );

	Widget _cGroup() => Column( children: children );

	@override
	Widget build( BuildContext ctx ) {

		// Reset this each time
		children = [];
		
		// Generate some kind of basic something or other
		for ( final c in widget.choices ) { 
			children.add( widget.constructor( this, c ) );
		}

		// Return a container
		return Container(
			child: ( widget.orientation == InputKitOrientation.Row ) ? _rGroup() : _cGroup()
		);
	}
}


class InputKitParent extends Mappable {
	Map<String,dynamic> defs = {
		"textbox": String,
		"radio": dynamic,
		"switch": bool,
		"checkbox": bool,
		"slider": bool,
	};

	// NOTE: You can probably set one "global" getter as well
	Map<String,Function (dynamic v)> getters = {
		"textbox": (v) => v.value(),
		"radio": (v) => v.value,
		"switch": (v) => v.value,
		"checkbox": (v) => v.value,
		"slider": (v) => v.value,
	};

	// NOTE: You can probably set one "global" setter
	Map<String,Function (dynamic t, dynamic v)> setters = {
		"textbox": (t, v) => t.value = v,
		"radio": (t, v) => t.value = v,
		"switch": (t, v) => t.value = v,
		"checkbox": (t, v) => t.value = v,
		"slider": (t, v) => t.value = v,
	};

	// InputKit would need to create different widgets to control field entry 
	Map<String,Function ()> constructors = {
		"textbox": () => InputKitTextField(),
		"radio": () => InputKitRadio(),
		"switch": () => InputKitToggleSwitch(),
		"checkbox": () => InputKitCheckbox(),
		"slider": () => InputKitSlider(),
	};

	// InputKit will need to return references to widgets that control field entry
	Map<String,Function (dynamic v)> presenters = {
		"textbox": (v) => v,
		"radio": (v) => v,
		"switch": (v) => v,
		"checkbox": (v) => v,
		"slider": (v) => v,
	};

	// Retrieve a widget matching this definition
	Widget? widget( String k ) {
		if ( this.map[ k ] != null ) {
			return this.map[ k ].value;
		}
		return null;
	}

	// NOTE: Even with constructor, you may still need some sort of "pre" setter
	// (a function that sets values before the constructor completes)
	InputKitParent([ Map<String,dynamic> values = const {} ]) : super( values ) {
		for ( final k in constructors.keys ) {
			if ( constructors[ k ] != null ) this.map[ k ].value = constructors[ k ]!();
		}	
	}
}



