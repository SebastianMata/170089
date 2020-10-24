# Simple lexical analyzer (LEXER)
Perl Program to Illustrate the functionality and implementation of a lexer.

# Introduction
A lexical analyzer or lexicographical analyzer is the first phase of a compiler, consisting of a program that receives as input the source code of another program (sequence of characters) and produces an output composed of tokens (lexical components) or symbols. These tokens are used for a later stage of the translation process, being the input for the parser.

# Source Code
We created an empty list called tokens. This will be used to store all the tokens we create.
```perl
  my @tokens;  
```
Then we divide our source code, which is a string into a list of words where each word in the string separated by a space is an element of the list. Then we store them in a variable called source_code .
```perl
  my @source_code = split(' ',$inputText);
```
Once it's done, we go through our source_code list word by word. 
```perl
 foreach my $word (@source_code){                            # Loop through each source code word
      #...
 }
```
In the foreach loop we evaluate our DATATYPE, IDENTIFIER, OPERATOR, the VALUE and the END STATEMENT as shown below:
```perl
foreach my $word (@source_code){                            # Loop through each source code word
    
    if ($word =~ m/str|int|bool/){                          # This will check if a token has datatype decleration
		push(@tokens, "['DATATYPE', '$word']");

    }elsif($word =~ m/[a-z|A-Z]/){		       
		push(@tokens, "['IDENTIFIER', '$word']");           # This will look for an identifier which would be just a word

    }elsif($word =~ m/[\+\-\/\*\=\%]/){                     # This will look for an operator
		push(@tokens, "['OPERATOR', '$word']");

    }elsif ($word =~ m/[0-9]/){	                            # This will look for integer items and cast them as a number
		my @wordArr = $word; 	
		if(@wordArr[length(@wordArr)-1] =~ /;/){
			my $intFromWord = substr($word,0,-1);
			push(@tokens, "['INTEGER', '$intFromWord']");
			push(@tokens, "['END STATEMENT', ';']");

		}else{			   
		   push(@tokens, "['INTEGER', '$word']");         

		}	

	}
}
```
Then we output the original "Source code" included in the inputText variable, and the generated tokens.
```perl
print("\nInput text : ",$inputText,"\n");
print("Tokens     : [@tokens]\n");  
```
At the end of the code we have the variablePROLOG subroutine. The Prolog system recognizes the type of an object in the program by its syntactic form. This is possible because the syntax of Prolog specifies different forms for each type of data. In our program, this is the used impliementation:
```perl
sub variablePROLOG{
	my @w =@_;
	if((@w[0]=~ m/[A-Z]/ and @w[0]=~/[A-Z]/) or @w[0]=="_"){            # The first character is a capital letter or an underline. In other words, True if "w" is a correct variable name.
    @w =shift(@w);                                                      # 'shift' extracts the first element by removing it from the array.
		
		while(@w and (@w[0]=~ /[A-za-z0-9_]/ or @w[0]=="_")){
			@w =shift(@w);                                              # As long as there are characters left in "w" and the first current character is an alphanumeric or an underline, everything is fine
			if(@w == " "){                                              # If there are no more elements to check, it is a PROLOG variable
				return 1;       
			}
		}
	}
    return 0;
}

```
## Testing
To test the LEXER functionality, the following variable declarations and asigantions are included commented in the program. This variables are created in base of what the lexer is programmed to identify as datatyoes, variable names, etc.
```perl
my $inputText = 'bool pruebaBool = true;';                 # "bool" test     
my $inputText = 'int pruebaInt = 11;';                     # "int" test 
my $inputText = 'str pruebaStr = \'hola\';';               # "str" test
my $inputText = 'bool _pruebaBool = true;';                # "_bool" test     
my $inputText = 'int _pruebaInt = 11;';                    # "_int" test 
my $inputText = 'str _pruebaStr = \'hola\';';              # "_str" test
my $inputText = 'asd ad asdsa';                            # "invalid test"
```
To test one, it needs to be uncommented first, then the other ones ,ust be commented again and finally run the program with the command ``` perl 170089-regularexpression.pl``` in the command line.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
