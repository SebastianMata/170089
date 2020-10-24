# Analizador léxico simple
Perl Program to Illustrate the functionality and implementation of a lexer.

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

First, we evaluate our data type:

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
