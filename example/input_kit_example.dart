import 'package:flutter/material.dart';
import 'package:input_kit/input_kit.dart';
//import 'input_kit.dart';



class IKTestCustomDropdown extends InputKitCustomDropdown<String?> {
	final List<InputKitCustomDropdownValue<String?>> items = [
		InputKitCustomDropdownValue<String?>( "Choice A", "choice A" ),
		InputKitCustomDropdownValue<String?>( "Choice B", "choice B" ),
		InputKitCustomDropdownValue<String?>( "Choice C", "choice C" ),
		InputKitCustomDropdownValue<String?>( "Choice D", "choice D" ),
	];

	final InputKitCustomDropdownValue<String?> initialSelection = 
		InputKitCustomDropdownValue<String?>( "Select One", null );

	IKTestCustomDropdown() : super();
}


///
class IKTestSearch extends InputKitTextField {
	//Color? fillColor = Color( 0xff0000ff );
	String? hintText = "Test Search"; 
	IKTestSearch() : super();
}



///
class IKTestToggleSwitch extends InputKitToggleSwitch {
	IKTestToggleSwitch() : super();
}



///
class IKTestSlider extends InputKitSlider {
	IKTestSlider() : super();
}



///
class IKTestCheckbox extends InputKitCheckbox {
	final Color? checkColor = Color( 0xffffffff );	
	final Color? activeColor = Color( 0xff0000ff );	
	IKTestCheckbox({ super.key });
}


///
class IKTestRadio extends InputKitRadio<String> {
	IKTestRadio() : super();

	final InputKitOrientation orientation = InputKitOrientation.column;

	@override
	final List<InputKitRadioValue> items = [
		InputKitRadioValue<String>( "Value A", "Something" ),
		InputKitRadioValue<String>( "Value B", "Something Else" )
	];
}


///
class IKTestDropdown extends InputKitDropdown<String> {
	IKTestDropdown() : super();
	final String initialSelection = "Select One";
	final List<InputKitDropdownValue<String>> items = [ 
		InputKitDropdownValue<String>( "One", "One" ), 
		InputKitDropdownValue<String>( "Two", "Two" ), 
		InputKitDropdownValue<String>( "Three", "Three" ), 
		InputKitDropdownValue<String>( "Four", "Four" ), 
	];
}



class IKTestPassword extends InputKitPassword {
	//Color? fillColor = Color( 0xff0000ff );
	IKTestPassword() : super();
}



///
class InputKitTest extends InputKit {
	@override
	Map<String,dynamic> defs = {
		"textbox": String,
		"password": dynamic,
		"options": dynamic,
		"radio": dynamic,
		"switch": bool,
		"checkbox": bool,
		"slider": bool,
	};

	@override
	Map<String,Function ()> constructors = {
		"textbox": () => IKTestSearch(),
		"password": () => IKTestPassword(),
		"options": () => IKTestCustomDropdown(),
		"radio": () => IKTestRadio(),
		"switch": () => IKTestToggleSwitch(),
		"checkbox": () => IKTestCheckbox(),
		"slider": () => IKTestSlider(),
	};

	InputKitTest([ Map<String,dynamic> values = const {} ]) : super( values ); 
}



///
class InputKitTestRoute extends StatefulWidget {
	const InputKitTestRoute({ super.key });	

	@override
	State<InputKitTestRoute> createState() => _InputKitTestRouteState();
}



/// InputKitTestRoute - ...
class _InputKitTestRouteState extends State<InputKitTestRoute> {


	// This is now the reference to all the values that are encompassed	
	late InputKit form;
	

	@override
	void initState() {
		super.initState();
		// Any previous values would go in here
		form = InputKitTest();
	}

	@override
	Widget build( BuildContext ctx ) {
		return Flex(
			direction: Axis.vertical,
			children: [ 	
				const Text( "Search (textbox)", textAlign: TextAlign.left ),
				form.widget( "textbox" ),

				Container( height: 20.0 ),
				const Text( "Switch (switch)", textAlign: TextAlign.left ), 
				form.widget( "switch" ),	

				Container( height: 20.0 ),
				const Text( "Checkbox (checkbox)", textAlign: TextAlign.left ), 
				form.widget( "checkbox" ),	

				Container( height: 20.0 ),
				const Text( "Slider (slider)", textAlign: TextAlign.left ), 
				form.widget( "slider" ),	

				Container( height: 20.0 ),
				const Text( "Radio (radio)", textAlign: TextAlign.left ), 
				form.widget( "radio" ),	

				Container( height: 20.0 ),
				Container( child: Text( "Dropdowns" ) ),
				form.widget( "options" ), 

				Container( height: 20.0 ),
				ElevatedButton(
					child: const Text( "Submit" ),
					onPressed: () => print( form!.toJson() )
				),
				Container( height: 20.0 ),
			]
		);
	}
}



class TestApp extends StatelessWidget {
	const TestApp({super.key});

	@override
	Widget build( BuildContext context ) {
		return const MaterialApp(
			title: "Input Kit Test",
			home: Scaffold(
				body: InputKitTestRoute()
			)
		);
	}
}



void main() {
	runApp( const TestApp() );
}
