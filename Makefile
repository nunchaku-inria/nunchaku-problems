
FROGTEST_OPTS= 

ifeq ($(NO_CACHING),1)
  FROGTEST_OPTS += --no-caching
endif
ifeq ($(WEB),1)
  FROGTEST_OPTS += --web
endif

all: update should_pass bugs

update:
	@killall nunchaku || true
	@opam install nunchaku --yes
	@opam upgrade nunchaku --yes

J=1

bugs:
	@frogtest run $(FROGTEST_OPTS) -c test.toml --junit bugs.xml -j $J $@

should_pass:
	@frogtest run $(FROGTEST_OPTS) -c test.toml --junit should_pass.xml -j $J

bisect-clean:
	rm -f bisect*.out
	rm -rf bisect.html

bisect:
	./bisect_run.sh

.PHONY: update should_pass bugs bisect bisect-clean
