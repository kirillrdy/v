struct Abc {
	foo int
	bar bool
	str string
}

type ST = int | string | bool | Abc

fn test_int_st_str() {
	a := ST(0)
	assert '$a' == 'ST(0)'
}

fn test_string_st_str() {
	a := ST('test')
	assert '$a' == 'ST(\'test\')'
}

fn test_struct_st_str() {
	a := ST(Abc{})
	assert '$a' == 'ST(Abc {\n    foo: 0\n    bar: false\n    str: \'\'\n})'
}

fn test_bool_st_str() {
	a := ST(false)
	assert '$a' == 'ST(false)'
}

fn test_str() {
	a := ST(false)
	assert a.str() == 'ST(false)'
}

struct Container {
	st ST
}

fn test_in_struct() {
	c := Container{ST(0)}
	assert '$c' == 'Container {\n    st: ST(0)\n}'
}

fn test_unknown_value() {
	c := Container{}
	assert '$c' == 'Container {\n    st: unknown sum type value\n}'
}

fn test_nested_in_struct() {
	abc := Abc{}
	c := Container{ST(abc)}
	assert '$c' == 'Container {\n    st: ST(Abc {\n        foo: 0\n        bar: false\n        str: \'\'\n    })\n}'
}

fn test_pointer() {
	st := ST(0)
	assert '${&st}' == '&ST(0)'
}