# Push Down Automata: Program Description
Program that validates the expression a*b* converted to context-free language is:

```
    (a^n b^n|n>=0)                         
```
Where the automaton validates n quantities of "a" with n quantities of "b".

### Code implementation:
This table must be represented in our code. The following snipet shows the implementation of the PDA status table

```perl
    my @tablaEstados=([0,1,2],[1,2,2],[2,2,2]);   #  PDA Status Table
```

## Characther identification / comparison.

An important step its to determine if a given character is part of the valid characters. The following snippet shows the implemented subrutine that determines if a given character is valid or not.
### Code implementation:
```perl
    sub caracter {
      my ($character) = @_;		
      $simb = "";			
      $end = "";

      if($_[0] =~/a/){	# If the evaluated character is an 'a'
        $simb = "a";
        $a++;
        return 0;
      }else{
        if($_[0]=~/b/){ # If the evaluated character is a 'b'
          $simb = "b";
          pop @pila;
          $b++;
          return 1;
        }else{	        # Any other value
          $simb = "E";
          return 2;
          exit();
        }
      }
    }
```
When the code finds an invalid character, the comparison of variables that represent 'a' and 'b' will raise a warning (a^n != b^n) because it's not 'defined'. To test if a variable is defined or not, 'defined' is used in the implementation as shown above:
```perl
    if(defined $a and defined $b){  # '$a' and '$b' will raise a warning, when introduced an invalid character (different from 'a' or 'b').

        if($a != $b){      #  In case of non-acceptance by not reaching a final valid status (a^n != b^n) because it's not 'defined'. To test if a variable is defined or not, 'defined' is used.
            print("\n|              Cadena NO Valida (Pila no vacia)              |");
            print("\n+------------------------------------------------------------+");
        }

        if(($estadoAct==1 or $estadoAct==2 or $estadoAct==0) and $a==$b){      #  In case of acceptance and finished chain (a^n == b^n)
            print("\n|       ",$estadoAct,"       |               Fin de Cadena                |");
            print("\n+---------------+--------------+-------------+---------------+");
            print("\n|                        Cadena Valida                       |");
            print("\n+------------------------------------------------------------+");
        }
    }else{
        print("\n|          Cadena Invalida ('E' = Simbolo invalido)          |");                                          #  Table contents when
        print("\n+------------------------------------------------------------+");                                          #  the string is not valid
        exit();
    }

```
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
