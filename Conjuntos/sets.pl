#
# Hello World Program in Perl
#

#Sub es un grupo de declaraciones que realizan una tarea específica. Se le conoce como subrutina

sub size{   #Esta función obliga a que la evaluación de EXPR se realice en un contexto escalar, incluso si normalmente funcionaría en un contexto de lista.
    return scalar @_; #Hace referencia a lo pasado por parametro. 
}

#En programación informática, un conjunto es una colección de elementos distintos. Los elementos únicos se pueden agrupar en un conjunto. Los conjuntos se representan en figuras como diagramas de Venn y cada uno se representa como un círculo que contiene muchos elementos. Los conjuntos son una estructura de datos de uso frecuente en la programación del mundo real.

#La función qw() es una forma rápida de especificar un montón de pequeñas palabras entre comillas. Por ejemplo, qw (foo bar baz) es equivalente a ('foo', 'bar', 'baz')

my @A = qw(A B C); 
print "\nSET A = ",@A;
print "\nElementos en A = ",size(@A),"\n";

my @B = qw(A B C D);
print "\nSET B = ",@B;
print "\nElementos en B = ",scalar(@B),"\n"; #tambien puede hacerse sin usar una subrutina, al usar scalar() directamente

my @C = qw(A B C D E);
print "\nSET C = ",@C;
print "\nElementos en C = ",size(@C),"\n";