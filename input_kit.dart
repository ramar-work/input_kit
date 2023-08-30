/// 
/// input_kit.dart
/// 
/// A set of (somewhat) useful utilities for solving input related problems.
/// 
///


import 'package:flutter/material.dart';
import 'mappable.dart';



// The base value getter since all fields are final
class InputKitValue<T> {
	T? _value;

	T? get value => _value;

	set value( T? val ) => _value = val;

	InputKitValue( [ this._value ] );
}


/*
/// Handle the creation and update of checkboxes 
class InputKitCheckbox2 extends Checkbox {

	/// Default value
	final InputKitValue<bool> val = InputKitValue<bool>( false );

	/// 
	Color pressedColor = Color( 0xffeeeeee );
	Color unpressedColor = Color( 0xff111111 );
	Color activeColor = Color( 0xffeeeeee );
	Color? checkColor = Color( 0xffeeeeee );
	Color? focusColor = Color( 0xffeeeeee );
	Color? hoverColor = Color( 0xffeeeeee );
	double splashRadius = 2.0;

	/// 

	final Set<MaterialState> states = <MaterialState>{
		MaterialState.pressed,
		MaterialState.hovered,
		MaterialState.focused,
	};

	/// Can override tons of stuff with this
	Color _color( Set<MaterialState> ustates ) {
		return ( ustates.any( states.contains ) ) ? pressedColor : unpressedColor;
	}

	@override
	//Widget build( BuildContext ctx ) {
	InputKitCheckbox({
		//fillColor: MaterialStateProperty.resolveWith( _color ), 
		//overlayColor: MaterialStateProperty.resolveWith( _color ), 
		//value: this.value.value,
		this.activeColor = const Color( 0xffeeeeee ),
		this.checkColor,
		this.focusColor,
		this.hoverColor,
		this.splashRadius = 2.0,
		//onChanged: ( bool? value ) => setState( () => this.value.value = value! ) 
	}) : super( this.value );
}
*/



abstract class InputKitCheckbox extends StatefulWidget {

	/// ...
	final InputKitValue<bool> value = InputKitValue<bool>( false );

	/// ...
	final bool? autofocus = false;

	/// ...
	final Color? activeColor = null;

	/// ...
	final Color? checkColor = null;

	/// ...
	final Color? focusColor = null;

	/// ...
	final Color? hoverColor = null;

	///
	final Color? pressedColor = const Color( 0xff000000 );

	///
	final Color? unpressedColor = const Color( 0xffefefef );

	/// ...
	final VisualDensity? visualDensity = null;

	/// ...
	final OutlinedBorder? shape = null;

	/// ...
	final BorderSide? side = null;

	/// ...
	final double? splashRadius = null;

	//MaterialStateProperty<Color?>? fillColor;

	//MaterialStateProperty<Color?>? overlayColor;

	//MaterialTapTargetSize? materialTapTargetSize
	/// An onchanged listener

	@override
	State<InputKitCheckbox> createState() => _InputKitCheckboxState();

	InputKitCheckbox({super.key});
}



/// ...
class _InputKitCheckboxState extends State<InputKitCheckbox> {
	final Set<MaterialState> states = <MaterialState>{
		MaterialState.pressed,
		MaterialState.hovered,
		MaterialState.focused,
	};

	/// Can override tons of stuff with this
	Color? _color( Set<MaterialState> ustates ) {
		return ( ustates.any( states.contains ) ) ? widget.pressedColor : widget.unpressedColor;
	}

	@override
	Widget build( BuildContext ctx ) {
		return Checkbox(
			fillColor: MaterialStateProperty.resolveWith( _color ), 
			//overlayColor: MaterialStateProperty.resolveWith( _color ), 
			value: widget.value.value,
			activeColor: widget.activeColor,
			checkColor: widget.checkColor,
			focusColor: widget.focusColor,
			hoverColor: widget.hoverColor,
			splashRadius: widget.splashRadius,
			onChanged: ( bool? value ) => setState( () => widget.value.value = value! ) 
		);
	}	
}


/*
/// InputKitPassword - Handles passwords
abstract class InputKitPassword extends InputKitTextField {
	InputKitPassword({ super.key });

	/// For password fields
	String obscuringCharacter = '•';

	/// Obscure by default 
	bool obscureText = true;

	/// Maximum length of the text box
	int maxLines = 1;

	/// Maximum length of the text box
	final int? maxLength = 124;

	/// Hint text of the input field
	final String? hintText = null; 

	/// An event listener
	void onChanged (String text) => value = _controller.value.text;

	/// ...
	bool validator() => true; 

	/// A label to use
	String? labelText = null;

	@override	
	State<InputKitPassword> createState() => _InputKitPasswordState();
}



/// 
class _InputKitPasswordState extends State<InputKitPassword> {
	@override
	Widget build( BuildContext ctx ) {
		return TextField(
			controller: widget._controller,
			obscureText: widget.obscureText,
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
*/



/// Handle the creation and input of text fields
abstract class InputKitTextField extends StatefulWidget {
	InputKitTextField({ super.key });

	/// *TextEditingController 
	final TextEditingController _controller = TextEditingController();

	/// *Grab a value from the controller
	//abstract final String? value;
	final InputKitValue<String> value = InputKitValue<String>( "" );
 
	/// ...
	//bool validator() => true;

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
	void onChanged (String text) {
		value.value = _controller.value.text;
	}

	// Another way to do this for those who know the InputDecoration class well
	// InputDecoration? decoration = const InputDecoration();

	/*
	/// ?
	bool? alignLabelWithHint;
	Widget? label;
	TextStyle? labelStyle;
	TextStyle? floatingLabelStyle;
	*/

	/*
	// Widget? icon;
	// Color? iconColor;
	// Widget? prefixIcon;
	// BoxConstraints? prefixIconConstraints;
	// Widget? prefix;
	// String? prefixText;
	// TextStyle? prefixStyle;
	// Color? prefixIconColor;
	*/

	/*
	// Widget? suffixIcon;
	// Widget? suffix;
	// String? suffixText;
	// TextStyle? suffixStyle;
	// Color? suffixIconColor;
	// BoxConstraints? suffixIconConstraints;
	*/

	/// Modify the cursor style
	//double cursorWidth = 2.0;
	//double? cursorHeight;
	//Radius? cursorRadius;
	//bool? cursorOpacityAnimates;
	//Color? cursorColor;

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



/// ...
enum InputKitOrientation {
	row,
	column
}



/// Handle the creation and update of a radio group. 
abstract class InputKitRadio extends StatefulWidget {
	// ...
	final InputKitValue<dynamic> value = InputKitValue<dynamic>( 0.0 );

	// TODO: Should be list t
	final List<({String name, dynamic value})> choices = [];

	/// Define orientation (row or column)
	final InputKitOrientation orientation = InputKitOrientation.column;

	// TODO: This could be named a little better
	// Define how to create the widgets that encapsulate the radio items 
	Widget constructor( ({String name, dynamic value}) c, void Function(dynamic) chng ) {
		return ListTile(
			title: Text( c.name ),
			leading: Radio(
				value: c.value,
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
		for ( final c in widget.choices ) { 
			_children.add( widget.constructor( c, onChanged ) );
		}

		// Return a container
		return Container(
			child: ( widget.orientation == InputKitOrientation.row ) ? _rGroup() : _cGroup()
		);
	}
}




///
/// TODO: This needs to be limited to scalar types...
abstract class InputKitDropdown<T> extends StatefulWidget {
	
	final List<T> items = [];

	final List<DropdownMenuEntry<T>> _list = [];

	final InputKitValue<T> value = InputKitValue<T>();

	final TextEditingController _controller = TextEditingController();

	final T? initialSelection = null; //"Select One";

	final double? width = null;

	final double? menuHeight = null;

	final String? hintText = null;

	final String? helperText = null;

	final bool enableFilter = false;

	final bool enableSearch = true;

	// You'll always need to do this, since htere's no way to do it
	String setLabel( T v ); 

	void setValue( T v ) => value.value = v;

	// Generate a constructor for the menu entries
	DropdownMenuEntry<T> constructor( T v ) => DropdownMenuEntry(
		value: v,
		label: setLabel( v )
	);	

	//bool xx() => enableSearch;
	//final TextStyle? textStyle;
	//final InputDecorationTheme? inputDecorationTheme;
	//ValueChanged<T?>? onSelected;
	//String? errorText;
	//bool? requestFocusOnTap;
	//MenuStyle? menuStyle;
	//Widget? leadingIcon;
	//Widget? trailingIcon;
	//Widget? label;
	//Widget? selectedTrailingIcon;
	
	@override	
	State<InputKitDropdown> createState() => _InputKitDropdownState();

	InputKitDropdown({super.key});
}



/// 
class _InputKitDropdownState extends State<InputKitDropdown> {
	@override
	Widget build( BuildContext ctx ) {
		// Perhaps rewrite this to find the first index
		widget._list.add( widget.constructor( widget.initialSelection ) );

		for ( final i in widget.items ) {
			widget._list.add( widget.constructor( i ) );
		}

		return DropdownMenu(
			dropdownMenuEntries: widget._list,
			controller: widget._controller,
			initialSelection: widget._list[ 0 ],
			width: widget.width,
			menuHeight: widget.menuHeight,
			hintText: widget.hintText,
			helperText: widget.helperText,
			enableFilter: widget.enableFilter,
			enableSearch: widget.enableSearch,
			onSelected: widget.setValue,
			//textStyle;
			//inputDecorationTheme;
			//onSelected;
		);
	}
}



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
