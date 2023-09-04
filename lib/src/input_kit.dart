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
	@override
	void defaultSetter( String k, dynamic v ) {
		print( "Would have set key $k to $v" );
	}

	// Retrieve a widget matching this definition
	Widget widget( String k ) {
		if ( map[ k ] != null ) {
			return map[ k ].value;
		}
		return Container();
	}

	void set( String k, dynamic v ) {
		print( "Setting '$k' to '$v' at input_kit with form.set()" );
		if ( map[ k ] != null ) {
		print( "Try it." );
			// You can do the type check here for safety...
			MappableStruct t = map[ k ];

			// This sets the value, but you'll need to update the interface too...
			t.value.value.value = v;

/*
			if ( t.type == String && v is String ) {
				t.value.value.value = v;
			}
			else if ( t.type == bool && v is bool ) {
				t.value.value = v;
			}
			else if ( t.type == int && v is int ) {
				t.value.value = v;
			}
			else if ( t.type == double && v is double  ) {
				t.value.value = v;
			}
			else {
				// WHat if it's a Widget?  Are formtypes all widgets?
				print( "There are no matches for this widget." );
			}
*/
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
					var arg = null;
					arg = values[ k ];
					// The types must match, or you'll throw...
					if ( map[ k ].type == String && arg is String ) {
						map[ k ].value.value.value = arg;
					}
					else if ( map[ k ].type == bool && arg is bool ) {
						map[ k ].value.value.value = arg;
					}
					else if ( map[ k ].type == int && arg is int ) {
						map[ k ].value.value.value = arg;
					}
					else if ( map[ k ].type == double && arg is double  ) {
						map[ k ].value.value.value = arg;
					}
					else {
						// WHat if it's a Widget?  Are formtypes all widgets?
						//print( "There are no matches for this widget." );
					}
					//map[ k ].value.value.value = arg;
				}
				
			}
		}
	}
}
