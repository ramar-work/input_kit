/// input_kit.dart - The top level abstract class
import 'package:flutter/material.dart';
import 'mappable.dart';


/// ...
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
	dynamic defaultSetter = (t, v) => t = v.value;

	// Retrieve a widget matching this definition
	Widget widget( String k ) {
		if ( map[ k ] != null ) {
			return map[ k ].value;
		}
		return Container();
	}

	// NOTE: Even with constructor, you may still need some sort of "pre" setter
	// (a function that sets values before the constructor completes)
	InputKit([ Map<String,dynamic> values = const {} ]) : super( values ) {
		for ( final k in constructors.keys ) {
			if ( constructors[ k ] != null ) {
				map[ k ].value = constructors[ k ]!();
			}
		}
	}
}
