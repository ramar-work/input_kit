import 'package:flutter/material.dart';
import 'input_kit_value.dart';
import 'input_kit_decoration.dart';

/*
x final TextEditingController? controller;
x ValueChanged<String>? onChanged;
x VoidCallback? onEditingComplete;
x ValueChanged<String>? onSubmitted;
x AppPrivateCommandCallback? onAppPrivateCommand;
x GestureTapCallback? onTap;
x TapRegionCallback? onTapOutside;

@final InputDecoration? decoration = const InputDecoration();
@final TextStyle? style;

final bool autocorrect = true;
final bool autofocus = false;
final bool canRequestFocus = true;
final Color? cursorColor;
final double? cursorHeight;
final double cursorWidth = 2.0;
final Radius? cursorRadius;
final bool? cursorOpacityAnimates;
final DragStartBehavior dragStartBehavior = DragStartBehavior.start;
final bool? enableInteractiveSelection;
final bool enableSuggestions = true;
final bool? enabled;
final bool obscureText = false;
final bool enableIMEPersonalizedLearning = true;
final bool expands = false;
final List<TextInputFormatter>? inputFormatters;
final int? maxLines = 1;
final int? minLines;
final int? maxLength;
final MaxLengthEnforcement? maxLengthEnforcement;
final String obscuringCharacter = '•';
final bool readOnly = false;
final bool scribbleEnabled = true;
final EdgeInsets scrollPadding = const EdgeInsets.all(20.0);
final BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight;
final BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight;
final bool? showCursor;
final TextAlign textAlign = TextAlign.start;
final TextCapitalization textCapitalization = TextCapitalization.none;
final TextDirection? textDirection;
final TextAlignVertical? textAlignVertical;

final Iterable<String>? autofillHints = const <String>[];


final Brightness? keyboardAppearance;
final TextSelectionControls? selectionControls;
final MouseCursor? mouseCursor;
final InputCounterWidgetBuilder? buildCounter;
final ScrollController? scrollController;
final ScrollPhysics? scrollPhysics;
final ContentInsertionConfiguration? contentInsertionConfiguration;
final Clip clipBehavior = Clip.hardEdge;
final String? restorationId;
final EditableTextContextMenuBuilder? contextMenuBuilder = _defaultContextMenuBuilder;
final SpellCheckConfiguration? spellCheckConfiguration;
final TextMagnifierConfiguration? magnifierConfiguration

final FocusNode? focusNode;
final UndoHistoryController? undoController;
final TextInputType? keyboardType;
final TextInputAction? textInputAction;
final StrutStyle? strutStyle;
final SmartDashesType? smartDashesType;
final SmartQuotesType? smartQuotesType;

*/




/// Handle the creation and input of text fields
abstract class InputKitTextField extends StatefulWidget with InputKitFieldStyling {
	InputKitTextField({ super.key, this.initial = null }) {
		if ( initial != null ) {
			print( "Setting this to a value." );
			value.value = initial;
		}
	}

	final initial;

	void update() {
		// Call set state after an update from a setter...	
	}

	/// *Grab a value from the controller
	final InputKitValue<String> value = InputKitValue<String>( "" );

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
	//void onChanged (String text) => value.value = _controller.value.text;

	/// ...
	bool validator() => true; 

	@override	
	State<InputKitTextField> createState() => _InputKitTextFieldState();
}



/// 
class _InputKitTextFieldState extends State<InputKitTextField> {
	/// *TextEditingController 
	TextEditingController? _controller;

	@override
	Widget build( BuildContext ctx ) {
	
		//InputDecoration decorator = widget.decoration();

		//widget._controller.value.text = "Something";
		_controller = TextEditingController( text: widget.value.value ); 

		return TextField(
			controller: _controller,
			onChanged: (String text) => widget.value.value = _controller?.value.text ?? "",
			//decoration: widget.decoration()
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
