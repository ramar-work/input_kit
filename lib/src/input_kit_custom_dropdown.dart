import 'package:flutter/material.dart';
import 'input_kit_value.dart';
import 'input_kit_decoration.dart';



class InputKitCustomDropdownValue<T> {
	String name;
	T value;
	InputKitCustomDropdownValue( this.name, this.value );	
}



abstract class InputKitCustomDropdown<T> extends StatefulWidget {
	InputKitCustomDropdown({super.key});

	final List<InputKitCustomDropdownValue<T?>> items = [];

	final InputKitCustomDropdownValue<T?>? initialSelection = null;

	final double width = 100.0;

	final Color fillColor = Color( 0xffffffff );

	final InputKitValue<T> value = InputKitValue<T>();

	@override
	State<InputKitCustomDropdown> createState() => _InputKitCustomDropdownState();
}



class _InputKitCustomDropdownState extends State<InputKitCustomDropdown> {

	final FocusNode _buttonFocusNode = FocusNode(debugLabel: "Menu Button");

	final MenuController _controller = MenuController();

	ShortcutRegistryEntry? _shortcutsEntry;

	bool _menuWasEnabled = false;

	InputKitCustomDropdownValue? _selected;

	@override
	void initState() {
		super.initState();
		_selected = widget.initialSelection;	
	}

	@override
	void dispose() {
		super.dispose();
	}

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
    // Dispose of any previously registered shortcuts, since they are about to
    // be replaced.
    _shortcutsEntry?.dispose();
    // Collect the shortcuts from the different menu selections so that they can
    // be registered to apply to the entire app. Menus don't register their
    // shortcuts, they only display the shortcut hint text.
/*
    final Map<ShortcutActivator, Intent> shortcuts =
        <ShortcutActivator, Intent>{
      for (final MenuEntry item in MenuEntry.values)
        if (item.shortcut != null)
          item.shortcut!: VoidCallbackIntent(() => _activate(item)),
    };
    // Register the shortcuts with the ShortcutRegistry so that they are
    // available to the entire application.
    _shortcutsEntry = ShortcutRegistry.of(context).addAll(shortcuts);
*/
	}
	
	void _handleSecondaryTapDown(TapDownDetails details) {
    _controller.open(position: details.localPosition);
  }

  void _handleTapDown(TapDownDetails details) {
		/*
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        // Don't open the menu on these platforms with a Ctrl-tap (or a
        // tap).
        break;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        // Only open the menu on these platforms if the control button is down
        // when the tap occurs.
        if (HardwareKeyboard.instance.logicalKeysPressed
                .contains(LogicalKeyboardKey.controlLeft) ||
            HardwareKeyboard.instance.logicalKeysPressed
                .contains(LogicalKeyboardKey.controlRight)) {
          _controller.open(position: details.localPosition);
        }
		}
		*/
	}

	void _activate( InputKitCustomDropdownValue selection ) {
    setState( () {
			_selected = selection;
			widget.value.value = selection.value;
		} );
  }


	@override
	Widget build( BuildContext ctx ) {

		List<MenuItemButton> items = [];

		for ( int i = 0; i < widget.items.length; i++ ) {
			InputKitCustomDropdownValue v = widget.items[ i ];
			items.add(
				MenuItemButton(
					onPressed: () => _activate( v ),
					child: Container(
						width: widget.width,
						child: Text( v.name )
					),
				)
			);
		}

		return Padding(
			padding: const EdgeInsets.all( 50 ),
			child: GestureDetector(
				onTapDown: _handleTapDown,
				onSecondaryTapDown: _handleSecondaryTapDown,
				onTap: () => _controller.open(),
				child: MenuAnchor(
					controller: _controller,
					anchorTapClosesMenu: true,
					menuChildren: items,
					child: Card(
						color: widget.fillColor,
						clipBehavior: Clip.hardEdge,
						child: InkWell( 
							//splashColor: Colors.blue.withAlpha( 30 ),
							child: Padding(
								padding: EdgeInsets.all( 16.0 ),
								child: Container(
									width: widget.width,
									child: Row(
										children: [ 
											Text( _selected?.name ?? "" ),
											Expanded( child: Container() ),
											Icon( Icons.arrow_drop_down )
										]
									)
								)
							)
						)
					)
				)
			)
		);
	}
}
