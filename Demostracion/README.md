# Demostracion: Program Description
Perl Program to Illustrate Different Set Operations

## Boolean Values
The following declaration represents the 2 boolean possibles values (TRUTH=1,FALSE=0) for the operations (AND, OR, NOT, ^) 
```perl
my @booleans=qw(0 1); 
```

## OR Truth table
The OR gate is an electronic circuit that gives a high output (1) if one or more of its inputs are high.  A plus (+) is used to show the OR operation.

A | B | A+B 
--- | --- | --- 
| 0 | 0 | 0 
| 0 | 1 | 1 
| 1 | 0 | 1
| 1 | 1 | 1

### Code implementation:
```perl
for $x (@booleans){                      #OR Table content
	for $y (@booleans){
		print("  ",$x);                  # $x value
		print("\t  ");
		print($y);                       # $y value
		print("\t    ");
		print($x or $y);                 # $x OR $y value
		print("\t  \n");
	}
}  
```
## AND Truth table
The AND gate is an electronic circuit that gives a high output (1) only if all its inputs are high.

A | B | A.B 
--- | --- | --- 
| 0 | 0 | 0 
| 0 | 1 | 0 
| 1 | 0 | 0 
| 1 | 1 | 1

### Code implementation:
```perl
for $x (@booleans){                      #AND Table content
	for $y (@booleans){
		print("  ",$x);                  # $x value
		print("\t  ");
		print($y);                       # $y value
		print("\t    ");
		print($x and $y);                # $x AND $y value
		print("\t  \n");
	}
} 
```

## NOT Truth table
The NOT gate is an electronic circuit that produces an inverted version of the input at its output.  It is also known as an inverter.  If the input variable is A, the inverted output is known as NOT A.

A | NOT A 
--- | ---
| 0 | 1 
| 1 | 0

### Code implementation:
```perl
$x=0  ;                     #NOT Table content
print("  ",$x,"\t   ");
print(not $x,"\n");         #  NOT $x value
```

## ^ Truth table
The 'Exclusive-OR' gate is a circuit which will give a high output if either, but not both, of its two inputs are high.
A | B | A^B 
--- | --- | --- 
| 0 | 0 | 1 
| 0 | 1 | 0 
| 1 | 0 | 0
| 1 | 1 | 1

### Code implementation:
```perl
for $x (@booleans){
    for $y (@booleans){
	print("  ",$x,"\t ",$y,"\t  ");				  #prints $x and $y values for table columns
        if(!$x != !$y){						  #prints $x ^ $y value (because prints nothing if its not equal to 1)
            print("1 \n");
        }else{
            print("0 \n");
        }
    }
}
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
