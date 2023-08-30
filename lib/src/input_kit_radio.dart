import 'package:flutter/material.dart';
import 'input_kit_value.dart';

/// ...
enum InputKitOrientation {
	row,
	column
}



class InputKitRadioValue<T> {
	String name;
	T value;
	InputKitRadioValue( this.name, this.value );	
}



/// Handle the creation and update of a radio group. 
abstract class InputKitRadio<T> extends StatefulWidget {

	// TODO: using a union here would be better than what we have now	
	final List<InputKitRadioValue> items = [];

	final InputKitValue<T> value = InputKitValue<T>();

	/// Define orientation (row or column)
	final InputKitOrientation orientation = InputKitOrientation.column;

	// TODO: This could be named a little better
	// Define how to create the widgets that encapsulate the radio items 
	Widget constructor( String name, T v, void Function(dynamic) chng ) {
		return ListTile(
			title: Text( name ),
			leading: Radio(
				value: v,
				groupValue: value.value,
				onChanged: chng
			)
		);
	}

	@override
	State<InputKitRadio> createState() => _InputKitRadioState();

	InputKitRadio({super.key});
}



/// ...
class _InputKitRadioState extends State<InputKitRadio> {

	List<Widget> _children = [];

	Widget _rGroup() => Row( children: _children );

	Widget _cGroup() => Column( children: _children );

	onChanged( dynamic v ) => setState( () => widget.value.value = v );

	@override
	Widget build( BuildContext ctx ) {

		// Reset this each time
		_children = [];
		
		// Generate some kind of basic something or other
		for ( InputKitRadioValue c in widget.items ) { 
			_children.add( widget.constructor( c.name, c.value, onChanged ) );
		}

		// Return a container
		return Container(
			child: ( widget.orientation == InputKitOrientation.row ) ? _rGroup() : _cGroup()
		);
	}
}
/*
*/
