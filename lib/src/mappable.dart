// A subclass
class _Struct {
	//Map<String,dynamic> _this;

	dynamic type;

	dynamic value;

	dynamic get = (dynamic v) => v;

	dynamic set = (dynamic t, dynamic v) {
/*
		if ( v.type == bool ) {
print( "what I'm looking at is a bool." );
		}
		else if ( v.type == String ) {
print( "what I'm looking at is a string." );
		}
		else if ( v.type == int ) {
print( "what I'm looking at is a int." );
		}
		else if ( v.type == double ) {
print( "what I'm looking at is a double." );
		}
*/
	};
	
	@override
	String toString() {
		return "{ type: $type, value: $value, get: $get, set: $set }";
	}

	_Struct(
		//this._this,
		this.type, 
		/*{
		this.value = null,
		//this.get = (v) => v,
		//this.set = (t, v) => t[v],  
		}*/
		//[ this.getter = (v) => v, this.setter = (t, v) => t[v] ]
	);
}




// Wrap a map with some extra functionality
class Mappable {

	// How should booleans render themselves with JSON?
	bool hideempty = false; 

	// ...
	dynamic defaultGetter;

	// Define a list of strings to use as keys
	Map<String,dynamic> defs = {};

	// Define a list of (optional) getters
	Map<String,Function (dynamic v)> getters = {};

	// Define a list of (optional) setters
	Map<String,Function (dynamic t, dynamic v)> setters = {};

	// The values specified in defs will go here
	Map<String,dynamic> map = {};

	// Set a key if it's in keys
	void set( String k, dynamic v ) {
		if ( map[ k ] ) {
			_Struct t = map[ k ];
			if ( t.type == bool && v is bool ) {
				t.value = v;
			}
			else if ( t.type == String && v is String ) {
				t.value = v;
			}
			else if ( t.type == int && v is int ) {
				t.value = v;
			}
			else if ( t.type == double && v is double  ) {
				t.value = v;
			}
			else {
				// WHat if it's a Widget?  Are formtypes all widgets?
			}
		}
	}

	// toJson
	Map<String,dynamic> toJson() {
		Map<String, dynamic> res = {};
		for ( final k in map.keys ) {
			_Struct t = map[ k ];
			dynamic v = t.get( t.value );
			if ( t.type == String && v is String )
				res.addAll( { k: v } );
			else if ( t.type == bool && v is bool )
				res.addAll( { k: ( v ) ? "on" : "off" } );	
			else if ( t.type == int && v is int )
				res.addAll( { k: v } );
			else if ( t.type == double && v is double )
				res.addAll( { k: v } );
			else {
				// If the value is null, you can either add null or just not add
				res.addAll( { k: v } );
			}
		}	
		return res;
	}


	dynamic get( String key ) {
		if ( map[ key ] != null ) {
			_Struct t = map[ key ];
			return t.get( t.value );
		}
		return null; 
	}


	Mappable( [ Map<String,dynamic> values = const {} ] ) {
		// Move through all the default keys and types
		for ( final key in defs.keys ) {
			// Dereference the record
			// TODO: Use a map instead b/c you can still maintain type safety
			// and be backward compatible.
			// var (key, t) = v;
			var t = defs[ key ];
			
			// Create an instance of the struct on the other end
			_Struct struct = _Struct( t ); //(v) => v, (t,v) => t[v] ); 

			// If the user gave a non blank map, pull the values from it and set
			if ( values[ key ] != null ) {
				print( "Key ${key} exists in values, so preset it" );
				struct.value = values[ key ];	
			}

			//print( "${values} initialized" );
			
			// Define a custom getter if specified at instantiation
			if ( getters[ key ] != null ) {
			print( "setting ${key} w/ corresponding getters property" );
				struct.get = getters[ key ];
			}
			else if ( defaultGetter != null ) {
			print( "setting ${key} w/ defaultGetter " );
				struct.get = defaultGetter;
			}	

			// Define a getter setter if specified at instantiation
			// struct.set = 

			// Set the other side 
			map[ key ] = struct;
		}
	}
}
