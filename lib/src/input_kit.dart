/// input_kit.dart - The top level abstract class
import 'package:flutter/material.dart';
import 'mappable.dart';


/// ...

/// Defining base styles from here is pretty useful
abstract class InputKit extends Mappable {
	// Default definitions
	@override
	abstract Map<String,dynamic> defs; 

	// InputKit would need to create different widgets to control field entry 
	abstract Map<String,Function ()> constructors; 

	// Erase, Validate, Submit, etc, all can be done with one click...
	Map<String,Function ()> validators = {};

	// Default getter for pretty much everything
	@override
	dynamic defaultGetter = (v) => v.value.value;

	// Default setter for pretty much everything
	@override
	void defaultSetter( String k, dynamic v ) {
		print( "Would have set key $k to $v" );
	}

	// ?
	BoxDecoration? boxDecoration;

	// Default decoration
	InputDecoration? inputDecoration;

	// Default text styling
	TextStyle? textStyle;

	// Retrieve a widget matching this definition
	Widget widget( String k ) {
		if ( map[ k ] != null ) {
			return map[ k ].value;
		}
		return Container();
	}

	void set( String k, dynamic v ) {
		//print( "Setting '$k' to '$v' at input_kit with form.set()" );
		if ( map[ k ] != null ) {
			// Since all are stateless, it is possible to call
			// setState from whatever widget is using this to update
			// the value after the fact
			map[ k ].value.setValue( v );
		}
		else {
			// May need to throw an exception or just simply log what happened
		}
	}

	// NOTE: Even with constructor, you may still need some sort of "pre" setter
	// (a function that sets values before the constructor completes)
	InputKit([ Map<String,dynamic> values = const {} ]) : super( values ) {
		for ( final k in constructors.keys ) {
			if ( constructors[ k ] != null ) {
				// This can be used to set defaults too
				map[ k ].value = constructors[ k ]!();

				// If there is a value, try to set it
				if ( values != null && values[ k ] != null ) {
					map[ k ].value.setValue( values[ k ] );
				}
				
			}
		}
	}
}
