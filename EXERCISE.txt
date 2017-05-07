# ENUNCIADO

Desarrollar una gramática en formato BNF para reconocer expresiones aritméticas simples (sumas, restas, multiplicaciones y divisiones) que operan con constantes enteras e identificadores 

# RESOLUCIÓN

### Notación BNF
R =

0)   <assign'>    ::= <assign> 
1)   <assign>     ::= id = <expression>
2)   <expression> ::= <expresion> + <term>
3)   <expression> ::= <expresion> - <term>
4)   <expression> ::= <term>
5)   <term>       ::= <term> * <factor>
6)   <term>       ::= <term> / <factor>
7)   <term>       ::= <factor>
8)   <factor>     ::= int

### Gramática
Ent = {<assign>, <expression>, <term>, <factor>}
Et  = {id, =, +, -, *, /, int}

G = (Ent, Et, <assign'>, R) # Libre de contexto

EJEMPLO
-------

var F = 2 + 2 * 3 / 2 - 2


Tree
----

Step 1
    <assign'>
       |
    <assign>

Step 2
        <assign'>
           |
        <assign>
       /   |    \
     id    =    <expression>

 Step 3
        <assign'>
           |
        <assign>
       /   |    \
     id    =    <expression>
                /    |     \
      <expression>   -    <term>

Step 4
        <assign'>
           |
        <assign>
       /   |    \
     id    =     <expression>
                /     |      \
      <expression>    -      <term>
                               |
                             <factor>

Step 5
        <assign'>
           |
        <assign>
       /   |    \
     id    =     <expression>
                /     |      \
      <expression>    -      <term>
                                |
                             <factor>
                                |
                               int

Step 5
            <assign'>
               |
            <assign>
           /   |    \
         id    =     <expression>
                    /     |      \
          <expression>    -      <term>
         /     |     \              |
 <expression>  +   <term>     <factor>
                                    |
                                   int

Step 7
            <assign'>
               |
            <assign>
           /   |    \
         id    =     <expression>
                    /     |      \
          <expression>    -      <term>
         /     |     \              |
 <expression>  +   <term>     <factor>
                      |             |
                  <factor>         int

Step 8
            <assign'>
               |
            <assign>
           /   |    \
         id    =     <expression>
                    /     |      \
          <expression>    -      <term>
         /     |     \              |
 <expression>  +   <term>     <factor>
                      |             |
                  <factor>         int
                      |
                     int 

Step 8
                            <assign'>
                               |
                            <assign>
                           /   |    \
                         id    =     <expression>
                                    /     |      \
                          <expression>    -      <term>
                         /     |     \              |
                 <expression>  +   <term>        <factor>
                      |              |              |
                    <term>        <factor>         int
                   /  |   \          |                
              <term>  *   <factor>  int            
                                   
 Step 8                                                                                     
                             <assign'>
                                |
                             <assign>
                            /   |    \
                          id    =     <expression>
                                     /     |      \
                           <expression>    -      <term>
                          /     |     \              |
                  <expression>  +   <term>        <factor>
                       |              |              |
                     <term>        <factor>         int
                    /  |   \          |                
               <term>  *   <factor>  int            
                              |
                             int 

Step 8                                                                                     
                            <assign'>
                               |
                            <assign>
                           /   |    \
                         id    =     <expression>
                                    /     |      \
                          <expression>    -      <term>
                         /     |     \              |
                 <expression>  +   <term>        <factor>
                      |              |              |
                    <term>        <factor>         int
                   /  |   \          |                
              <term>  *   <factor>  int            
             /  |   \        |
         <term> / <factor>  int 

Step 8                                                                                     
                            <assign'>
                               |
                            <assign>
                           /   |    \
                         id    =     <expression>
                                    /     |      \
                          <expression>    -      <term>
                         /     |     \              |
                 <expression>  +   <term>        <factor>
                      |              |              |
                    <term>        <factor>         int
                   /  |   \          |                
              <term>  *   <factor>  int            
             /  |   \        |
         <term> / <factor>  int 
                     |
                    int 

Step 8                                                                                     
                            <assign'>
                               |
                            <assign>
                           /   |    \
                         id    =     <expression>
                                    /     |      \
                          <expression>    -      <term>
                         /     |     \              |
                 <expression>  +   <term>        <factor>
                      |              |              |
                    <term>        <factor>         int
                   /  |   \          |                
              <term>  *   <factor>  int            
             /  |   \        |
         <term> / <factor>  int 
            |        |
        <factor>    int 

Step 8                                                                                     
                            <assign'>
                               |
                            <assign>
                           /   |    \
                         id    =     <expression>
                                    /     |      \
                          <expression>    -      <term>
                         /     |     \              |
                 <expression>  +   <term>        <factor>
                      |              |              |
                    <term>        <factor>         int
                   /  |   \          |              |  
              <term>  *   <factor>  int             2
             /  |   \        |       |
         <term> / <factor>  int      2 
            |        |       | 
        <factor>    int      2
            |        |
           int       3 
            |
            2

id = 2 / 3 * 2 + 2 - 2


ESTADO 0
--------
<assign'> ::= *<assign>
<assign>  ::= *id = <expression>

(0, <assign>)
ESTADO 1
----
 <assign'> ::= <assign>*

(0, id)
ESTADO 2
--------
 <assign> ::= id *= <expression>

(2, =)
ESTADO 3
--------
 <assign> ::= id = *<expression>
 <expression> ::= *<expresion> - <term>
 <expression> ::= *<expresion> + <term>
 <expression> ::= *<term>
 <term>       ::= *<term> * <factor>
 <term>       ::= *<term> / <factor>
 <term>       ::= *<factor>
 <factor>     ::= *int

(3, <expresion>)
ESTADO 4
--------
 <assign> ::= id = <expression>*
 <expression> ::= <expresion> *- <term>
 <expression> ::= <expresion> *+ <term>

(3, <term>)
ESTADO 5
--------
 <expression> ::= <term>*
<term>       ::= <term> ** <factor>
<term>       ::= <term> */ <factor>

(3, <factor>) (8, <factor>) (9, <factor>)
ESTADO 6
--------
 <term> ::= <factor>*

(3, int) (8, int) (9, int) (10, int (11, int))
ESTADO 7
--------
 <factor> ::= int*

(4, -)
ESTADO 8
--------
 <expression> ::= <expresion> - *<term>
 <term>       ::= *<term> * <factor>
 <term>       ::= *<term> / <factor>
 <term>       ::= *<factor>
 <factor>     ::= *int

(4, +)
ESTADO 9
--------
 <expression> ::= <expresion> + *<term>
 <term>       ::= *<term> * <factor>
 <term>       ::= *<term> / <factor>
 <term>       ::= *<factor>
 <factor>     ::= *int


(5, *) (12, *) (13, *)
ESTADO 10
---------
 <term>   ::= <term> * *<factor>
 <factor> ::= *int

(5, /) (12, /) (13, /)
ESTADO 11
---------
 <term>   ::= <term> / *<factor>
 <factor> ::= *int

(8, <term>)
ESTADO 12
---------
 <expression> ::= <expresion> - <term>*
 <term>       ::= <term> ** <factor>
 <term>       ::= <term> */ <factor>

(9, <term>)
ESTADO 13
---------
 <expression> ::= <expresion> + <term>*
 <term>       ::= <term> ** <factor>
 <term>       ::= <term> */ <factor>

(10, <factor>)
ESTADO 14
---------
 <term>   ::= <term> * <factor>*

(11, <factor>)
ESTADO 15
---------
 <term>   ::= <term> / <factor>*

GOTOS
----

ESTADO 1 (0, <assign>)
ESTADO 4 (3, <expresion>)
ESTADO 5 (3, <term>)
ESTADO 6 (3, <factor>) (8, <factor>) (9, <factor>)
ESTADO 12 (8, <term>)
ESTADO 13 (9, <term>)
ESTADO 14 (10, <factor>)
ESTADO 15 (11, <factor>)

SHIFTS
-------

ESTADO 2 (0, id)
ESTADO 3 (2, =)
ESTADO 7 (3, int) (8, int) (9, int) (10, int (11, int))
ESTADO 8 (4, -)
ESTADO 9 (4, +)
ESTADO 10 (5, *) (12, *) (13, *)
ESTADO 11 (5, /) (12, /) (13, /)

REDUCES
-------

Sgt(<assign'>) = { $ }  
Sgt(<assign>) = { $ }  
Sgt(<expression>) = { +, -, $ }
Sgt(<term>) = {+, -, *, /, $}
Sgt(<factor>) = {+, -, *, /, $}

ESTADO 1 (0, <assign>) -> R0
ESTADO 4 (3, <expresion>) -> R1 
ESTADO 5 (3, <term>) -> R4
ESTADO 6 (3, <factor>) (8, <factor>) (9, <factor>) -> R7
ESTADO 7 (3, int) (8, int) (9, int) (10, int (11, int) -> R8
ESTADO 12 (8, <term>) -> R3
ESTADO 13 (9, <term>) -> R2
ESTADO 14 (10, <factor>) -> R5
ESTADO 15 (11, <factor>) -> R6

TABLA
-----

| #  | id | =  | +  | -  | *   | /   | int | $   | ASSIGN | EXPRESSION | TERM | FACTOR |
| 0  | S2 |    |    |    |     |     |     |     | 1      |            |      |        |
| 1  |    |    |    |    |     |     |     | OK! |        |            |      |        |
| 2  |    | S3 |    |    |     |     |     |     |        |            |      |        |
| 3  |    |    |    |    |     |     | S7  |     |        | 4          | 5    | 6      |
| 4  |    |    | S9 | S8 |     |     |     | R1  |        |            |      |        |
| 5  |    |    | R4 | R4 | S10 | S11 |     | R4  |        |            |      |        |
| 6  |    |    | R7 | R7 | R7  | R7  |     | R7  |        |            |      |        |
| 7  |    |    | R8 | R8 | R8  | R8  |     | R8  |        |            |      |        |
| 8  |    |    |    |    |     |     | S7  |     |        |            | 12   | 6      |
| 9  |    |    |    |    |     |     | S7  |     |        |            | 13   | 6      |
| 10 |    |    |    |    |     |     | S7  |     |        |            |      | 14     |
| 11 |    |    |    |    |     |     | S7  |     |        |            |      | 15     |
| 12 |    |    | R3 | R3 | S10 | S11 |     | R3  |        |            |      |        |
| 13 |    |    | R2 | R2 | S10 | S11 |     | R2  |        |            |      |        |
| 14 |    |    | R5 | R5 | R5  | R5  |     | R5  |        |            |      |        |
| 15 |    |    | R6 | R6 | R6  | R6  |     | R6  |        |            |      |        |

| PILA                                                     | PRG POR ANALIZAR                        |    |
| 0                                                        | id = int1 + int2 * int3 / int4 - int5 $ |    |
| 0,id,2                                                   | = int1 + int2 * int3 / int4 - int5 $    |    |
| 0,id,2,=,3                                               | int1 + int2 * int3 / int4 - int5 $      |    |
| 0,id,2,=,3,int1,7                                        | + int2 * int3 / int4 - int5 $           |    |
| 0,id,2,=,3,<factor>                                      | + int2 * int3 / int4 - int5 $           | R8 |
| 0,id,2,=,3,<factor>,6                                    | + int2 * int3 / int4 - int5 $           |    |
| 0,id,2,=,3,<term>                                        | + int2 * int3 / int4 - int5 $           | R7 |
| 0,id,2,=,3,<term>,5                                      | + int2 * int3 / int4 - int5 $           |    |
| 0,id,2,=,3,<expression>                                  | + int2 * int3 / int4 - int5 $           | R4 |
| 0,id,2,=,3,<expression>,4                                | + int2 * int3 / int4 - int5 $           |    |
| 0,id,2,=,3,<expression>,4,+,9                            | int2 * int3 / int4 - int5 $             |    |
| 0,id,2,=,3,<expression>,4,+,9,int2,7                     | * int3 / int4 - int5 $                  |    |
| 0,id,2,=,3,<expression>,4,+,9,<factor>                   | * int3 / int4 - int5 $                  | R8 |
| 0,id,2,=,3,<expression>,4,+,9,<factor>,6                 | * int3 / int4 - int5 $                  |    |
| 0,id,2,=,3,<expression>,4,+,9,<term>                     | * int3 / int4 - int5 $                  | R7 |
| 0,id,2,=,3,<expression>,4,+,9,<term>,13                  | * int3 / int4 - int5 $                  |    |
| 0,id,2,=,3,<expression>,4,+,9,<term>,13,*,10             | int3 / int4 - int5 $                    |    |
| 0,id,2,=,3,<expression>,4,+,9,<term>,13,*,10,int3,7      | / int4 - int5 $                         |    |
| 0,id,2,=,3,<expression>,4,+,9,<term>,13,*,10,<factor>,14 | / int4 - int5 $                         |    |
| 0,id,2,=,3,<expression>,4,+,9,<term>                     | / int4 - int5 $                         | R5 |
| 0,id,2,=,3,<expression>,4,+,9,<term>,13                  | / int4 - int5 $                         |    |
| 0,id,2,=,3,<expression>,4,+,9,<term>,13,/,11             | int4 - int5 $                           |    |
| 0,id,2,=,3,<expression>,4,+,9,<term>,13,/,11,int4,7      | - int5 $                                |    |
| 0,id,2,=,3,<expression>,4,+,9,<term>,13,/,11,<factor>    | - int5 $                                | R8 |
| 0,id,2,=,3,<expression>,4,+,9,<term>,13,/,11,<factor>,15 | - int5 $                                |    |
| 0,id,2,=,3,<expression>,4,+,9,<term>                     | - int5 $                                | R6 |
| 0,id,2,=,3,<expression>,4,+,9,<term>,13                  | - int5 $                                |    |
| 0,id,2,=,3,<expression>                                  | - int5 $                                | R2 |
| 0,id,2,=,3,<expression>,4                                | - int5 $                                |    |
| 0,id,2,=,3,<expression>,4,-,8                            | int5 $                                  |    |
| 0,id,2,=,3,<expression>,4,-,8,int5,7                     | $                                       |    |
| 0,id,2,=,3,<expression>,4,-,8,<factor>                   | $                                       | R8 |
| 0,id,2,=,3,<expression>,4,-,8,<factor>,6                 | $                                       |    |
| 0,id,2,=,3,<expression>,4,-,8,<term>                     | $                                       | R7 |
| 0,id,2,=,3,<expression>,4,-,8,<term>,12                  | $                                       |    |
| 0,id,2,=,3,<expression>                                  | $                                       | R3 |
| 0,id,2,=,3,<expression>,4                                | $                                       |    |
| 0,<assign>                                               | $                                       | R1 |
| 0,<assign>,1                                             | $                                       |    |
| COMPILACION EXITOSA!                                     |                                         |    |

LISTA DE REGLAS
---------------
8, 7, 4, 8, 7, 5, 8, 6, 2, 8, 7, 3, 1
