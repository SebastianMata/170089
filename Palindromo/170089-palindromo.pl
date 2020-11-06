
# ********************************************************************************************* #
#                                                                                               #
#                                 Major:    IT Engineering                                      #
#       Name of the specialty professor:    González Ibarra Juan Carlos                         #
#                               Subject:    Theory of Computation                               #
#               Name of the institution:    Universidad Politecnica de San Luis Potosí          #
#                     Name & enrollment:    Baltazar Loyola Gabriel Enrique, 170089             #
#                                                                                               #
#                           Description:    Perl program that analyzes a given chain and        #
#                                           verifies that, the introduced expression is a       #
#                                           palindrome.                                         #
#                                                                                               #
#       Written:       10/4/2020                                                                #
#       Last updated:  10/6/2020                                                                #
#                                                                                               #
# ********************************************************************************************* #

#################################################
#              Inicio del Programa              #
#################################################


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


