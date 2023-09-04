import 'package:flutter/material.dart';
import 'input_kit_value.dart';
import 'input_kit_decoration.dart';

/*
x final TextEditingController? controller = null;
x final required List<DropdownMenuEntry<T>> dropdownMenuEntries;
x final T? initialSelection = null;
x ValueChanged<T?>? onSelected = null;

@final InputDecorationTheme? inputDecorationTheme = null;
@final TextStyle? textStyle = null;

final bool? enabled = true = null;
final double? width = null;
final double? menuHeight = null;
final bool? requestFocusOnTap = null;
final bool enableFilter = false = null;
final bool enableSearch = true = null;
final String? hintText = null;
final String? helperText = null;
final String? errorText = null;
final MenuStyle? menuStyle = null;

final Widget? label = null;
final Widget? leadingIcon = null;
final Widget? selectedTrailingIcon = null;
final Widget? trailingIcon = null;
*/



class InputKitDropdownValue<T> {
	String name;
	T value;
	InputKitDropdownValue( this.name, this.value );	
}



/// TODO: This needs to be limited to scalar types...
abstract class InputKitDropdown<T> extends StatefulWidget with InputKitFieldStyling {
	
	final TextEditingController _controller = TextEditingController();

	final List<DropdownMenuEntry<T>> _list = [];

	final List<InputKitDropdownValue<T>> items = [];

	final InputKitValue<T> value = InputKitValue<T>();

	final T? initialSelection = null; //"Select One";

	final double? width = null;

	final double? menuHeight = null;

	final String? hintText = null;

	final String? helperText = null;

	final bool enableFilter = false;

	final bool enableSearch = true;

	final TextStyle? textStyle = null;

	final MenuStyle? menuStyle = null;

	void setValue( T v ) => value.value = v;

	// Generate a constructor for the menu entries
	DropdownMenuEntry<T> constructor( InputKitDropdownValue v ) => DropdownMenuEntry(
		label: v.name,
		value: v.value
	);

	@override	
	State<InputKitDropdown> createState() => _InputKitDropdownState();

	InputKitDropdown({super.key});
}



/// 
class _InputKitDropdownState extends State<InputKitDropdown> {
	@override
	Widget build( BuildContext ctx ) {
		// Perhaps rewrite this to find the first index
		//widget._list.add( widget.constructor( widget.initialSelection ) );

		// Since this uses this weird InputDecorationTheme, try this?
		//var i = new InputDecorationTheme();
		//InputDecorationTheme theme = i.copyWith( widget.decoration() );

		for ( final InputKitDropdownValue i in widget.items ) {
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
			//inputDecorationTheme: widget.decoration(),
			//textStyle;
			//onSelected;
		);
	}
}

