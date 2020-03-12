all: eng.test


%.test: %.fomabin %.gold.tsv
	cut -f 1 $*.gold.tsv | uniq | flookup -i -w "" $*.fomabin | sort | diff -y $*.gold.tsv -

%.fomabin: %.foma eng.lexc eng.irregular.lexc
	foma -l $*.foma -e "save stack $*.fomabin" -s


.PHONY: usage *.test

