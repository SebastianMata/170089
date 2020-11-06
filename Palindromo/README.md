# Palindrome analyzer
Perl Program to analyze a gven chain and determine if it is a palindrome.

# Introduction
A palindrome is a term or expression that can be read either from left to right or from right to left. Naturally, palindromic phrases suffer in their meaning the longer they are. The complexity increases the longer we increase the length of the sentence

# Source Code
This program analyzes a string given by the user and, by means of a for cycle, makes comparisons at the opposite positions of the word or phrase entered. At the end it prints the result on the screen. 

```perl
print ("Ingrese una cadena a evaluar: ");       #  Requests keyboard input
my $cadena = <STDIN>;                           #  It's assigned to the variable
chomp $cadena;                                  #  Eliminates the line break
my @cadena = split('',$cadena);                 #  Splits the chain without adding separators and stores it in an array for evaluation
my $j=@cadena-1;                                #  Gets the length of the array

for(@cadena){                                                   #  For the given chain 
    print(@cadena[$i]," & ",@cadena[$j]);
    if(@cadena[$i] eq @cadena[$j]){                             #  It is evaluated if the character is equal to its opposite position within the chain
        print(" : Equivalent. \n");
    }else{
        if($i+1 == $j){                                         #  If it is the same, it is printed on screen and continues the evaluation
            print(" End of comparation: ",$i," and",$j);
        }else{                                                  #  If it is not the same, finish the comparison and end the program
            print(" Not Equivalent. \n");
            exit;
        }
    }
    $j-=1;
    $i+=1;
}
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
