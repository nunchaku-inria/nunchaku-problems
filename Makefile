
all: update fixed_bugs tests bugs

update:
	@killall nunchaku || true
	@yes | opam install nunchaku
	@yes | opam upgrade nunchaku 

J=1

bugs:
	@frogtest run -j $J $@
fixed_bugs:
	@frogtest run -j $J $@
tests:
	@frogtest run -j $J $@

.PHONY: update fixed_bugs bugs tests
