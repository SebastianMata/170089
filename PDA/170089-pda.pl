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
#                                           (a^n b^n|n>=0) where the automaton validates        #
#                                           n quantities of "a" with n quantities of "b"        #
#                                                                                               #
#       Written:       10/4/2020                                                                #
#       Last updated:  10/6/2020                                                                #
#                                                                                               #
# ********************************************************************************************* #
use strict;                     
use warnings;

our $simb = undef;	#  Variables must first exist in the global environment 
our $end = undef;	
our $a;
our $b;
our @pila=" ";  
