
all: update bugs tests

update:
	yes | opam upgrade nunchaku 

bugs:
	frogtest run -j 3 bugs

tests:
	frogtest run -j 3 tests

.PHONY: update bugs tests
