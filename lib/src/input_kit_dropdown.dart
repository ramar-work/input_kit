import 'package:flutter/material.dart';
import 'input_kit_value.dart';


class InputKitDropdownValue<T> {
	String name;
	T value;
	InputKitDropdownValue( this.name, this.value );	
}



/// TODO: This needs to be limited to scalar types...
abstract class InputKitDropdown<T> extends StatefulWidget {
	
	final List<InputKitDropdownValue<T>> items = [];

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
			//textStyle;
			//inputDecorationTheme;
			//onSelected;
		);
	}
}

