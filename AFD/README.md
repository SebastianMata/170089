# AFD: Program Description
Perl Program to Illustrate the functionality of a Finite Deterministic Automaton. This program evaluates if a given expression consists of the following pattern and string lenght:                                  

```
([0-9])( + , - , * , / )([0-9]) 
```

## State table.
The following table shows the valid states posibles 

Estate | Digit | Operator | String end
--- | --- | --- | ---
q0|q1	|Error	|Error
q1|Error|q2	|Error
q2|qf	|Error	|Error
qf|error|Error	|Aceptacion


### Code implementation:
This table must be represented in our code. The following snipet shows the implementation of the FDA status table

```perl
my @tablaEstados=([1,"E","E"],["E",2,"E"],[3,"E","E"],["E","E","A"]);   #  AFD Status Table
```


## Characther identification / comparison.

An important step its to determine if a given character is part of the valid characters. The following snippet determines if a given character is valid or not.
### Code implementation:
```perl
sub caracter{
	$simb = "";
	my ($charac)=@_;	
	if($_[0] =~ m/^[0-9]*$/){       #  If it coincides with any number from 1 to 9, assign "Digito" to the symbol that will be printed in the table.
		$simb = " Digito ";     
		return 0;
	}else{
	    if($_[0]=~/\+|\-|\*\|\//){
			$simb = "Operador";     #  If it matches any arithmetic operator, assign "Operador" to the symbol that will be printed in the table.
			return 1;
		}else{
			if($charac eq $end){
				return 2;
			}else{
                return 1;
            }
		}
	}
}
```
