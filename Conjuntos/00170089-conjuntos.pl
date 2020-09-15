# ********************************************************************************************* #
#                                                                                               #
#                                 Major:    IT Engineering                                      #
#       Name of the specialty professor:    González Ibarra Juan Carlos                         #
#               Name of the institution:    Universidad Politecnica de San Luis Potosí          #
#                     Name & enrollment:    Baltazar Loyola Gabriel Enrique, 170089             #
#                                                                                               #
#                           Description:    Program to perform different set operations         # 
#                                           like in mathematics. Find to similar command        # 
#                                           to other language (Perl)                            #
#                                                                                               #
#       Written:       9/10/2020                                                                #
#       Last updated:  10/10/2020                                                               #
#                                                                                               #
# ********************************************************************************************* #

#Modulos a utilizar

use warnings;

# define three sets
my @A = qw(1 2 3 4 5); 
my @B = qw(3 4 5 6 7);
my @C = qw();

print("The set A is : \t{", @A,"}\n");
print("The set B is : \t{", @B,"}\n");
print("The set C is : \t{", @C,"}\n");

#Remove an item from the set
sub removeOne{   
    splice @_, $i, 1;
    print ("The set after to delete: ", @A);
}

#Remove all items from the set
sub removeAll{
    for (my $i=0; $i < size(@_); $i++) {
        print ("$i Deleted\n");
    }
}

#Copy a set
sub copy{
    @B = @A;        #Copy set A to set B
    print ("Set A = ", @A, " compare set B = ", @B);
}

#Add an item
sub agregar{
    push(@A,qw(6));     #push '6' into the array
    print ("The set A is : ", @A);
}

# ******************** #
#    Set Operations    #
# ******************** #

#Union de A y B
sub union(){
    my @union;
    foreach(@A){ #adds the set A content
        push(@union,$_);
    }
    foreach(@B){ #adds the set A 
        print("\t Buscando... ",$_);    #busca el elemento de B en A
        if(!($_ ~~ @union)){
            print("\tNo encontrado\n"); #De lo contrario, lo agrega a Union
            push(@union,$_);
        }
    }

    print("A = ", @A,"\n");             #Muestra A
    print("B = ", @B,"\n");             #Muestra B
    print("The union = ", @union);      #Muestra AuB
}

#Intersection
sub intereseccion(){
    my @Intersection;
    foreach(@B){                                #RECORRE A
        if($_ ~~ @A){                           #Busca el valor de B en A
            print("\t$_ encontrado!\n");        #Si lo encuentra, lo añade a @Intersection
            push(@Intersection,$_);
        }
    }
    print("A = ", @A,"\n");                             #Muestra A
    print("B = ", @B,"\n");                             #Muestra B
    print("The intersection = ", @Intersection);        #Muestra AnB
}

#Diference
sub diferencia(){
    my @Diference;
    foreach(@A){                                #RECORRE A
        if(!($_ ~~ @B)){                           #Busca el valor de B en A
            print("\t$_ no encontrado! añadiendo\n");        #Si lo encuentra, lo añade a @Intersection
            push(@Diference,$_);
        }
    }
    print("A = ", @A,"\n");                             #Muestra A
    print("B = ", @B,"\n");                             #Muestra B
    print("The diference A - B = ", @Diference);        #Muestra A-B
}

#Symmetric difference
sub difSimetrica(){
    print("A = ", @A,"\n");                             #Muestra A
    print("B = ", @B,"\n");                             #Muestra B
    print("A Δ B = ",buscaDif(@A,@B),"\n");             #Invoca a buscaDif() para mostrar A Δ B
    print("C Δ B = ",buscaDif(@C,@B),"\n");             #Invoca a buscaDif() para mostrar C Δ B
    print("C Δ A = ",buscaDif(@C,@A),"\n");             #Invoca a buscaDif() para mostrar C Δ A
}
sub buscaDif(){
    my @toEvaluate = @_;
    my @toDelete;
    my @diff;
    my @tempDiff;

    #print("A evaluar: ",@toEvaluate,"\n");

    foreach(@toEvaluate){                                               #detecta valores duplicados
        #print("Evaluando ",$_,"...");
        if(!($_ ~~ @tempDiff)){
            #print(" añadiendo...\t");
            push(@tempDiff,$_);
        }else{                                  
            #print(" Ya se esta en tempDiff.\t");
            push(@toDelete,$_);
        }
        #print("tempDiff= ",@tempDiff,"\n");
    }

    foreach(@tempDiff){                                                 #borra balores duplicados
        if(!($_ ~~ @diff) && !($_ ~~ @toDelete)){                       #Busca el valor de B en A
            #print("\t$_ no encontrado en ambos! añadiendo\n");         #Si lo encuentra, lo añade a @Intersection
            push(@diff,$_);
        }
    }
    #print("diff= ",@diff,"\n");
    return @diff;
}

#Subset
sub esSubset {
    my ($setChico, $setGrande) = @_;
    foreach (@{$setChico}) {
        return 0 unless ($_ ~~ @{$setGrande});
    }
    return 1;
}

printf("A %s\n", (esSubset(\@A, \@B) ? "Es subconjunto de B" : "No es subconjunto de B"));
printf("B %s\n", (esSubset(\@A, \@B) ? "Es subconjunto de A" : "No es subconjunto de A"));

#Superset
