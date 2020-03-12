# English irregular plurals using lexc and priority union

Your task is to correctly implement the English plurals exercise from Chapter 5 of [Finite State Morphology by Kenneth R. Beesley and Lauri Karttunen](https://web.stanford.edu/group/cslipublications/cslipublications/site/1575864347.shtml).


## eng.lexc

Implement a lexicon called ``eng.lexc`` using the following English nouns:

* cat
* dog
* dish
* money
* octopus
* cherub
* fish
* fox
* sheep
* deer
* kibbutz
* automaton

The FST representing this lexicon should contain a singular and a regular plural of each of these nouns. Use ``+Noun+Sg`` to mark singular on the upper side, ``+Noun+Pl`` to mark plural on the upper side, and ``+s`` to mark plural on the lower side.

In addition, the FST representing this lexicon should also contain the following irregular plural pairs:

Upper | Lower
------| -----
cherub+Noun+Pl  | cherubim
fish+Noun+Pl    | fish
money+Noun+Pl   | monies
octopus+Noun+Pl | octopi


## eng.irregular.lexc

Implement a lexicon called ``eng.irregular.lexc``

The FST representing this lexicon should contain only the following irregular plural pairs:

Upper | Lower
------| -----
automaton+Noun+Pl | automata 
deer+Noun+Pl      | deer     
kibbutz+Noun+Pl   | kibbutzim
sheep+Noun+Pl     | sheep    


## eng.foma

Implement a file called ``eng.foma``, which does the following:

* Read the lexicon ``eng.lexc`` and name it using ``define Lexicon``
* Read the lexicon ``eng.irregular.lexc`` and name it using ``define IrregularLexicon``
* Create a rule using ``define PluralAlternation`` that rewrites ``+`` to ``e`` when it immediately follows ``s``, ``sh``, ``x``, or ``s``.
* Create a rule using ``define Cleanup`` that rewrites ``+`` to the empty string.
* Create a regular expression using ``re`` that composes ``IrregularLexicon`` and ``Lexicon`` using priority union, and then composes the result with ``PluralAlternation`` and ``Cleanup``

## Testing

Test your work by running ``make eng.test``
