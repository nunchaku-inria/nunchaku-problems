
all: update fixed_bugs tests bugs

update:
	@yes | opam install nunchaku
	@yes | opam upgrade nunchaku 

bugs:
	@frogtest run -j 3 $@
fixed_bugs:
	@frogtest run -j 3 $@
tests:
	@frogtest run -j 3 $@

.PHONY: update fixed_bugs bugs tests
