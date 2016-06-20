
FROGTEST_OPTS= -c test.toml

ifeq ($(NO_CACHING),1)
  FROGTEST_OPTS += --no-caching
endif
ifeq ($(WEB),1)
  FROGTEST_OPTS += --web
endif

all: update fixed_bugs tests bugs

update:
	@killall nunchaku || true
	@opam install nunchaku --yes
	@opam upgrade nunchaku --yes

J=1

bugs:
	@frogtest run $(FROGTEST_OPTS) -j $J $@
fixed_bugs:
	@frogtest run $(FROGTEST_OPTS) -j $J $@
tests:
	@frogtest run $(FROGTEST_OPTS) -j $J $@

should_pass:
	@frogtest run $(FROGTEST_OPTS) -j $J

bisect-clean:
	rm -f bisect*.out
	rm -rf bisect.html

bisect:
	./bisect_run.sh

.PHONY: update fixed_bugs bugs tests bisect bisect-clean
