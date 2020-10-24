# ********************************************************************************************* #
#                                                                                               #
#                                 Major:    IT Engineering                                      #
#       Name of the specialty professor:    González Ibarra Juan Carlos                         #
#                               Subject:    Theory of Computation                               #
#               Name of the institution:    Universidad Politecnica de San Luis Potosí          #
#                     Name & enrollment:    Baltazar Loyola Gabriel Enrique, 170089             #
#                                                                                               #
#                           Description:    Perl program for the evaluation of a string         #
#                                           using regular expressions and simulating            #
#                                           a compiler.                                         #
#                                                                                               #
#       Written:       22/10/2020                                                               #
#       Last updated:  23/10/2020                                                               #
#                                                                                               #
# ********************************************************************************************* #

my @tokens;                                                 # for string tokens

# ************************************************* #
#   remove the "#" to test different input texts    #
# ************************************************* #

my $inputText = 'bool pruebaBool = true;';                 # "bool" test     
#my $inputText = 'int pruebaInt = 11;';                     # "int" test 
#my $inputText = 'str pruebaStr = \'hola\';';               # "str" test
#my $inputText = 'bool _pruebaBool = true;';                # "_bool" test     
#my $inputText = 'int _pruebaInt = 11;';                    # "_int" test 
#my $inputText = 'str _pruebaStr = \'hola\';';              # "_str" test
#my $inputText = 'asd ad asdsa';                            # "invalid test"

my @source_code = split(' ',$inputText);

foreach my $word (@source_code){                            # Loop through each source code word
    
    if ($word =~ m/str|int|bool/){                          # This will check if a token has datatype decleration
		push(@tokens,"['DATATYPE', '$word']");

    }elsif($word =~ m/[a-z|A-Z]/){		       
		push(@tokens,"['IDENTIFIER', '$word']");    # This will look for an identifier which would be just a word

    }elsif($word =~ m/[\+\-\/\*\=\%]/){                     # This will look for an operator
		push(@tokens,"['OPERATOR', '$word']");

    }elsif ($word =~ m/[0-9]/){	                            # This will look for integer items and cast them as a number
		my @wordArr = $word; 	
		if(@wordArr[length(@wordArr)-1] =~ /;/){
			my $intFromWord = substr($word,0,-1);
			push(@tokens,"['INTEGER', '$intFromWord']");
			push(@tokens,"['END STATEMENT', ';']");

		}else{			   
		   push(@tokens,"['INTEGER', '$word']");         

		}	

	}
}

print("\nInput text : ",$inputText,"\n");
print("Tokens     : [@tokens]\n");                                          # Outputs the token array

sub variablePROLOG{
	my @w =@_;
	if((@w[0]=~ m/[A-Z]/ and @w[0]=~/[A-Z]/) or @w[0]=="_"){            # The first character is a capital letter or an underline. In other words, True if "w" is a correct variable name.
    @w =shift(@w);                                                          # 'shift' extracts the first element by removing it from the array.
		
		while(@w and (@w[0]=~ /[A-za-z0-9_]/ or @w[0]=="_")){
			@w =shift(@w);                                      # As long as there are characters left in "w" and the first current character is an alphanumeric or an underline, everything is fine
			if(@w == " "){                                      # If there are no more elements to check, it is a PROLOG variable
				return 1;       
			}
		}
	}
    return 0;
}
