
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

bisect-clean:
	rm -f bisect*.out
	rm -rf bisect.html

bisect:
	./bisect_run.sh

.PHONY: update fixed_bugs bugs tests bisect bisect-clean
