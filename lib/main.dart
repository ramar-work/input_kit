import 'package:flutter/material.dart';
import '../../lib/mappable.dart';
import '../../lib/input_kit.dart';


class IKTestSearch extends InputKitTextField {
	//Color? fillColor = Color( 0xff0000ff );
	String? hintText = "Test Search"; 
	IKTestSearch() : super();
}

class IKTestPassword extends InputKitPassword {
	//Color? fillColor = Color( 0xff0000ff );
	IKTestPassword() : super();
}


class IKTestDropdown extends InputKitDropdown {
	IKTestDropdown() : super();
	List<String> items = [
		"One",
		"Two",
		"Three",
		"Four"
	];
}


///
class IKTestRadio extends InputKitRadio {
	IKTestRadio() : super();
	InputKitOrientation orientation = InputKitOrientation.Column;
	List<({String name, dynamic value})> choices = [
		( name: "Value A", value: "Something" ),
		( name: "Value B", value: "Something Else" ),
	];
}

///
class IKTestToggleSwitch extends InputKitToggleSwitch {
	IKTestToggleSwitch() : super();
}

///
class IKTestCheckbox extends InputKitCheckbox {
	IKTestCheckbox() : super();
}

///
class IKTestSlider extends InputKitSlider {
	IKTestSlider() : super();
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
		"options": () => IKTestDropdown(),
		"radio": () => IKTestRadio(),
		"switch": () => IKTestToggleSwitch(),
		"checkbox": () => IKTestCheckbox(),
		"slider": () => IKTestSlider(),
	};

	InputKitTest([ Map<String,dynamic> values = const {} ]) : super( values ); 
}



///
class InputKitTestRoute extends StatefulWidget {
	InputKitTestRoute({ super.key });	

	@override
	State<InputKitTestRoute> createState() => _InputKitTestRouteState();
}



/// InputKitTestRoute - ...
class _InputKitTestRouteState extends State<InputKitTestRoute> {


	// This is now the reference to all the values that are encompassed	
	InputKit? form;
	

	@override
	void initState() {
		super.initState();
		// Any previous values would go in here
	}


	Widget build( BuildContext ctx ) {
		form = new InputKitTest();
		print( form ) ;
		print( form?.widget( "textbox" ) ) ;

		return Flex(
			direction: Axis.vertical,
			children: [ 	
				Container( height: 20.0 ),
				Container(
					child: Text( "Search (textbox)", textAlign: TextAlign.left )
				),
				form?.widget( "textbox" ) ?? Container(),

				Container( height: 20.0 ),
				Container( child: Text( "Dropdowns" ) ),
				form?.widget( "options" ) ?? Container(),

				Container( height: 20.0 ),
				Container( child: Text( "Switch (switch)", textAlign: TextAlign.left ) ), 
				form?.widget( "switch" ) ?? Container(),	

				Container( height: 20.0 ),
				Container( child: 
					Text( "Checkbox (checkbox)", textAlign: TextAlign.left ) ), 
				form?.widget( "checkbox" ) ?? Container(),	

				Container( height: 20.0 ),
				Container( child: 
					Text( "Slider (slider)", textAlign: TextAlign.left ) ), 
				form?.widget( "slider" ) ?? Container(),	

				Container( height: 20.0 ),
				Container( child: 
					Text( "Radio (radio)", textAlign: TextAlign.left ) ), 
				form?.widget( "radio" ) ?? Container(),	

				Container( height: 20.0 ),
				Container( child:
					ElevatedButton( 
						child: Text( "Submit" ),
						onPressed: () {
							print( form!.toJson() );							
						}
					)
				),
				Container( height: 20.0 ),
			]
		);
	}
}



class TestApp extends StatelessWidget {
	const TestApp({super.key});

	@override
	Widget build( BuildContext ctx ) {
		return MaterialApp(
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
