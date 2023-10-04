/// input_kit_custom_dropdown.dart
///
/// Creates a custom dropdown that is a bit more flexible
/// than what we've gotten so far with DropdownMenu.
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

	final int initialIndex = 0;

	final double width = 100.0;

	final double outerPadding = 0.0;

	final double innerPadding = 0.0;

	final Color fillColor = Color( 0xffffffff );

	final InputKitValue<T> value = InputKitValue<T>();

	void setValue( T v ) {
		print( "Trying to preset a value at InputKitCustomDropdown..." );
		if ( v is T ) {
			value.value = v;
		}
		else {
			print( "Value at InputKitDropdown is not of type ${T}" );
		}
	}

	@override
	State<InputKitCustomDropdown> createState() => _InputKitCustomDropdownState();
}



class _InputKitCustomDropdownState extends State<InputKitCustomDropdown> {

	final FocusNode _buttonFocusNode = FocusNode(debugLabel: "Menu Button");

	final MenuController _controller = MenuController();

	bool _orientationChanged = false;

	bool _resized = false;

	Size? size;

	ShortcutRegistryEntry? _shortcutsEntry;

	InputKitCustomDropdownValue? _selected;

	GlobalKey wkey = GlobalKey();

	double screenWidth = 0.0;

	double screenHeight = 0.0;

	// We have to be careful, because this can ONLY RUN ONCE
	void getActualWidth( _ ) {
		if ( !_resized ) {
			var c = wkey.currentContext;
			if ( c != null ) {
				setState( () {
					double width = c.size?.width ??	0;
					if ( width > 0 ) {
						size = Size.fromWidth( width - 15 ); 
					}
				} );
			}
			_resized = true;
		}
	}

	@override
	void initState() {
		super.initState();
		if ( widget.initialSelection != null ) {
			_selected = widget.initialSelection;
		}
		else if ( widget.items.isNotEmpty ) {
			_selected = widget.items[ widget.initialSelection ];
		}
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
		// Define a list of items that will be used to populate options
		List<MenuItemButton> items = [];

		// Define a callback to resize the options after call
		SchedulerBinding.instance.addPostFrameCallback( getActualWidth );

print( widget.value.value );

		// If the screen width changes, this is a pretty good indicator that 
		// we're probably going to need to update the width
		if ( MediaQuery.of( ctx ).size.width != screenWidth ) {
			screenWidth = MediaQuery.of( ctx ).size.width;
			_resized = false;
		}

		for ( int i = 0; i < widget.items.length; i++ ) {
			InputKitCustomDropdownValue v = widget.items[ i ];

			// If the item is selected
			if ( v.value == widget.value.value ) {
				//print( "We were preselected." );
				_selected = v;
			}

			items.add(
				MenuItemButton(
					onPressed: () => _activate( v ),
					child: Container(
						width: size?.width,
						child: Text( v.name )
					),
				)
			);
		}

		return GestureDetector(
			onTapDown: _handleTapDown,
			onSecondaryTapDown: _handleSecondaryTapDown,
			onTap: () {
				_controller.open();
			},
			child: MenuAnchor(
				key: wkey,
				controller: _controller,
				anchorTapClosesMenu: true,
				menuChildren: items,
				child: Container(
					padding: EdgeInsets.all( 15.0 ),
					width: double.infinity,
					decoration: BoxDecoration(
						border: Border.all( width: 1.0, color: const Color(0xff000000) ),
						color: widget.fillColor, 
					),
					child: Row(
						children: [ 
							Text( _selected?.name ?? "" ),
							Expanded( child: Container() ),
							Icon( Icons.arrow_drop_down )
						]
					)
				)
			)
		);
	}
}
