# SMAP Language Reference Manual

```
 ,-.    .                   .   ,                     .     .            
(   `   |       o           |\ /|           o         |     |   o        
 `-.    |-  ;-. . ;-. ,-:   | V |   ,-: ;-. . ;-. . . | ,-: |-  . ,-. ;-.
.   )   |   |   | | | | |   |   |   | | | | | | | | | | | | |   | | | | |
 `-'  o `-' '   ' ' ' `-|   '   ' o `-` ' ' ' |-' `-` ' `-` `-' ' `-' ' '
                      `-'                     '                         
         ,.          .   ;-.            .       .     .   .      
        /  \         |   |  )           |       |   o | o |      
        |--|   ;-. ,-|   |-'    ;-. ,-. |-. ,-: |-. . | . |-  . .
        |  |   | | | |   |      |   | | | | | | | | | | | |   | |
        '  ' o ' ' `-'   '    o '   `-' `-' `-` `-' ' ' ' `-' `-|
                                                              `-'
```

## Introduction

This manual describes the SMAP language that was introduced by the team during the proposal milestone. The manual describes the concrete standards of the language and its syntax that is being used to implement this probabilistic language, along with the other numerous features that can be implemented using the language. 

## Lexical Conventions

### Tokens

There are five classes of tokens: identifiers, keywords, string literals, operators and other separators. Other tokens are ignored because they act as separators, i.e. they separate the tokens. Blanks, horizontal and vertical tabs, newlines, formfeeds and comments are part of the group of tokens that are ignored while parsing the program.

### Comments

Single-line comments are denoted by the characters `//` which ignore all text following them until a newline is met. Multi-line comments are denoted by the characters `/*` and `*/` which introduce and terminate the multi-line comment, respectively. Everything between the paired multi-line comment characters is ignored. Comments do not nest and do not occur in literals.

### Identifiers

Identifiers are a sequence of letters and digits. SMAP is case-sensitive since lowercase and uppercase letters are distinguished to allow for camel case, and the underscore` _` is included to allow for snake case. Identifiers must begin with an underscore or letter.

```
okayToUseCamelCase 																						 ✓
okay_to_use_snake_case																				 ✓
OkayToStartWithCapital																				 ✓
_alsoOkay																											 ✓
9_not_okay_to_start_with_number&not_okay_non_alphanumeric-=@#% ✗
&not_okay_non_alphanumeric-=@#%																 ✗
```

### Keywords

The following identifiers are reserved for use as keywords:

```
bool break case char default elif else float for fn if int list null prob return string switch true false void while
```

### Primitive Types and their Constants

####  Integer Constants

A sequence of digits in decimal format. Cannot start with a 0.

####  Bool Constants

Either `true` or `false`, implemented as integers 0 or 1.

#### Float Constants

A sequence of digits in decimal format containing a single `.` for the decimal point.

#### Character Constants

A text character in single quotes, for example `'a'`. Escape characters `'\n'`, `\\`, `'\''`, `'\"'`, represent new line, regular slash, single quote, and double quote, respectively. 

#### String Constants

A sequence of characters in double quotes, for example, `"hello"`. String constants are implemented as lists of `char`s. See section 7 for details on implementation.

### Lists

A list is a collection of a homogenous and mutable type of data, i.e. all of the objects inside the list would be of the same type. A list is also dynamically sized, i.e. the list size is mutable. 

There are multiple ways to initialize a list. Lists are defined by the `list` keyword followed by the singular type that the list will contain. Lists can be created with an initial set of data which is Lists can be created with an initial set of data or be empty and can have elements added to them dynamically. 

```
// Creating a list
list int myints = [3, 2, 5];
list int myints = [3, 2, 5];
list int emptylist; 

//Indexing a list using positional notation:
myints[0] == 3; //evaluates to true
myints[0] = 1; 
myints[0] == 1; //evaluates to true
```

Oftentimes, we need to append a value at the end or beginning of the list. This is easily done with the `>` and `<` symbol within list indexing.

```
myints[>] = 42;
myints[<] = 37;
// myints is now: [37, 3, 2, 5, 42]
```

Getting the length of the list is possible by using the `.length` operator which returns the length as an integer.

```
myints.length == 5; //evaluates to true
```

We allow the `+` operator on the `list` type to concatenate two lists of the same type together. 

```
list int numsToAdd = [100];
list int concatResult = myints + numsToAdd;
// concatResult == [37, 3, 2, 5, 42, 100]
```

### Strings

A string is syntactic sugar for a `list` of type `char`. Since strings are of type `list char` under-the-hood, strings can be defined either as a `string` type or as a `list char` as there is no difference. 

String literals are defined as any ASCII character between a pair of double quotes (ex. `"this is a string"`). Literals are cast to their respective string representations at compilation time which allows for incredibly easy string manipulation and string building. 

#### String Initialization

Strings can be initialized to string literals or variables of type `list char` or `string`. 

```
string stringFromLit = “apple”; 																  	//"apple"
string stringFromLit2 = “ banana”; 																  //"banana"
list char listFromString = stringFromLit; 												  //"apple"
list char listFromStringLit = “apple”;  													  //"apple"
```

#### String Promotion

Any literal of type `int`, `float`, `char`, or `bool` can be promoted into a string when being assigned to a variable of type `string`. 

```
string number = 5;							//"5"
string floatingNum = 5.0;				//"5.0"
string charStr = 'a';						//"a"
string boolStr = true;					//"true"
```

#### String Concatenation

Because lists already have a concatenation operator `+`, concatenating strings is conceptually the same. 

```
string concatString = stringFromLit + stringFromLit2;							 //”apple banana”
list char anotherConcat = concatString + stringFromLit2 + “ “ + 5; //"apple banana banana 5"
```

### Probability Type

Probability types are initialized with a pair of lists separated by a colon. The left hand `list` must be of type `list float`, and the right hand list of the colon is a `list` of a type chosen by the programmer. The type of elements in the `list` of the right hand side must match the type declared after the `prob` type qualifier in the declaration.



Consider creating a game that requires enemies to be spawned of some difficulty. We need a way of picking 

```
// prob <type> myprob = list float : list <type>
// the two type-identifiers must match!

prob int randDifficulty = [0.5, 0.25, 0.25] : [1, 2, 3];
```

### Accessing Fields
