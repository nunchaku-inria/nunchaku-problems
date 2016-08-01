
FROGTEST_OPTS= 

ifeq ($(NO_CACHING),1)
  FROGTEST_OPTS += --no-caching
endif
ifeq ($(WEB),1)
  FROGTEST_OPTS += --web
endif

all: update should_pass should_pass_paradox should_pass_kodkod bugs bugs_paradox bugs_kodkod

update:
	@killall nunchaku || true
	@opam install nunchaku --yes
	@opam upgrade nunchaku --yes

J=1

bugs:
	@frogtest run $(FROGTEST_OPTS) -c test.toml --junit bugs.xml -j $J $@

bugs_paradox:
	@frogtest run $(FROGTEST_OPTS) -c test-paradox.toml --junit bugs.xml -j $J $@

bugs_kodkod:
	@frogtest run $(FROGTEST_OPTS) -c test-kodkod.toml --junit bugs.xml -j $J $@

should_pass:
	@frogtest run $(FROGTEST_OPTS) -c test.toml --junit should_pass.xml -j $J

should_pass_paradox:
	@frogtest run $(FROGTEST_OPTS) -c test-paradox.toml --junit should_pass.xml -j $J

should_pass_kodkod:
	@frogtest run $(FROGTEST_OPTS) -c test-kodkod.toml --junit should_pass.xml -j $J

bisect-clean:
	rm -f bisect*.out
	rm -rf bisect.html

bisect:
	./bisect_run.sh

.PHONY: update should_pass bugs bisect bisect-clean
