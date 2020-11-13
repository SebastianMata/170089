# ********************************************************************************************* #
#                                                                                               #
#                                 Major:    IT Engineering                                      #
#       Name of the specialty professor:    González Ibarra Juan Carlos                         #
#                               Subject:    Theory of Computation                               #
#               Name of the institution:    Universidad Politecnica de San Luis Potosí          #
#                     Name & enrollment:    Baltazar Loyola Gabriel Enrique, 170089             #
#                                                                                               #
#                           Description:    Program that validates the expression a*b*          #
#                                           converted to context-free language is               #
#                                           ( a^n b^n | n>=0 ) where the automaton validates    #
#                                           n quantities of "a" with n quantities of "b"        #
#                                                                                               #
#       Written:       11/13/2020                                                               #
#       Last updated:  11/13/2020                                                               #
#                                                                                               #
# ********************************************************************************************* #
use strict;                     
use warnings;

our $simb = undef;  #  Variables must first exist in the global environment 
our $end = undef;	
our $a;             # No. of times an 'a' appears in the string  (equivalent to 'n' in a^n)
our $b;             # No. of times a 'b' appears in the string   (equivalent to 'n' in b^n)
our @pila=" ";      # Stack used for simulating validation by emptying


#################################################
#                   Subrutinas                  #
#################################################

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

sub contenido{                      #  Prints the content of the valid state that was analyzed.
	my ($estadoSig, $character, $simb, $estadoAct) = @_;
	print ("\n|       ",$_[0],"       |       ",$_[1],"      |      ",$_[2],"      |       ",$_[3],"       | ");
	print ("\n+---------------+--------------+-------------+---------------+");
    print ("  Stack: ",@pila);
}


#################################################
#              Inicio del Programa              #
#################################################


my @tablaEstados=([0,1,2],[1,2,2],[2,2,2]);   #  AFD Status Table
my $estadoAct=0;                              #  Initial status

print ("Ingrese una cadena a evaluar: ");       #  Requests keyboard input
my $cadena = <STDIN>;                           #  Input is assigned to the variable
chomp $cadena;                                  #  Removes the line break that is saved by default when using <STDIN>
my @cadena = split('',$cadena);                 #  Splits the chain without adding separators and stores it in an array for evaluation in the AFD

print("\n+---------------+--------------+-------------+---------------+");      #
print("\n|   Estado Act  |   Caracter   |   Simbolo   |   Estado Sig  |");      #  Table Header
print("\n+---------------+--------------+-------------+---------------+");      #

for my $character (@cadena){
	my $estadoSig = $estadoAct;
  push(@pila,"+");         # Push a char into the stack for validation by emptying 
	my $charcaracter = caracter($character);
	$estadoAct = $tablaEstados[$estadoAct][$charcaracter];
	if ($estadoAct eq "E"){
		print("\n|       ",$estadoSig,"       |       ",$character,"      |   ",$simb,"  |       ",$estadoAct,"       |");  #
		print("\n+---------------+--------------+-------------+---------------+");                                          #  Table contents when
    print("\n|                      Cadena NO Valida                      |");                                          #  the string is not valid
    print("\n+------------------------------------------------------------+");                                          #
    exit();
	}

	if($charcaracter==1){   # 'b' pops an element from the stack (epsilon) 
		pop @pila;
	}

	contenido($estadoSig, $character, $simb, $estadoAct);
}

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

