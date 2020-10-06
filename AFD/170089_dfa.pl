
# ********************************************************************************************* #
#                                                                                               #
#                                 Major:    IT Engineering                                      #
#       Name of the specialty professor:    González Ibarra Juan Carlos                         #
#                               Subject:    Theory of Computation                               #
#               Name of the institution:    Universidad Politecnica de San Luis Potosí          #
#                     Name & enrollment:    Baltazar Loyola Gabriel Enrique, 170089             #
#                                                                                               #
#                           Description:    Finite Deterministic Automaton that analyzes        #
#                                           a given chain and verifies that, the introduced     #
#                                           expression consists of the following pattern        #
#                                           and string lenght:                                  #
#                                                                                               #
#                                                  ([0-9])( + , - , * , / )([0-9])              #
#                                                                                               #
#       Written:       10/4/2020                                                                #
#       Last updated:  10/6/2020                                                                #
#                                                                                               #
# ********************************************************************************************* #

our $simb = "";    #  Variables must first exist in the global environment  
our $end = "";

#################################################
#                   Subrutinas                  #
#################################################

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

sub contenido{                      #  It prints the content of the valid state that was analyzed.
	my ($estadoSig, $character, $simb, $estadoAct) = @_;
	print ("\n|       ",$_[0],"       |       ",$_[1],"      |   ",$_[2],"  |       ",$_[3],"       | ");
	print ("\n+---------------+--------------+-------------+---------------+");
}


#################################################
#              Inicio del Programa              #
#################################################


my @tablaEstados=([1,"E","E"],["E",2,"E"],[3,"E","E"],["E","E","A"]);   #  AFD Status Table
my $estadoAct=0;                                                        #  Initial status

print ("Ingrese una cadena a evaluar: ");       #  Requests keyboard input
my $cadena = <STDIN>;                           #  Input is assigned to the variable
chomp $cadena;                                  #  Removes the line break that is saved by default when using <STDIN>
my @cadena = split('',$cadena);                 #  Splits the chain without adding separators and stores it in an array for evaluation in the AFD

print("\n+---------------+--------------+-------------+---------------+");      #
print("\n|   Estado Act  |   Caracter   |   Simbolo   |   Estado Sig  |");      #  Table Header
print("\n+---------------+--------------+-------------+---------------+");      #

for my $character (@cadena){
	my $estadoSig = $estadoAct;                             #  Change of current status
	my $charcaracter=caracter($character);                  #  String character
	$estadoAct=$tablaEstados[$estadoAct][$charcaracter];    #  Check the correspondence in the status table

	if($estadoAct eq "E"){
		print("\n|       ",$estadoSig,"       |       ",$character,"      |   ",$simb,"  |       ",$estadoAct,"       |");  #
		print("\n+---------------+--------------+-------------+---------------+");                                          #  Table contents when
        	print("\n|                      Cadena NO Valida                      |");                                          #  the string is not valid
        	print("\n+------------------------------------------------------------+");                                          #
        	exit();
	}
	contenido($estadoSig,$character,$simb,$estadoAct);
}
 
if($estadoAct!=3){      #  In case of non-acceptance by not reaching a final valid status
	print("\n|                      Cadena NO Valida                      |");
    	print("\n+------------------------------------------------------------+");
}

if($estadoAct==3){      #  In case of acceptance and finished chain
    	print("\n|       ",$estadoAct,"       |               Fin de Cadena                |");
    	print("\n+---------------+--------------+-------------+---------------+");
    	print("\n|                        Cadena Valida                       |");
    	print("\n+------------------------------------------------------------+");
}
