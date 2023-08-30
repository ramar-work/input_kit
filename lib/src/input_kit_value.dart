// A base type that can be used to safely handle values of different types

class InputKitValue<T> {
	T? _value;

	T? get value => _value;

	set value( T? val ) => _value = val;

	InputKitValue( [ this._value ] );
}


