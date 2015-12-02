
all: bugs tests

bugs:
	frogtest run -j 3 bugs

tests:
	frogtest run -j 3 tests

.PHONY: bugs tests
