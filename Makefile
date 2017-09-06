
TEST_OPTS= -j 2
TEST_TOOL=logitest

all: should_pass bugs

# cold start
cold: update all

update: $(TEST_TOOL)
	@killall nunchaku || true
	@opam install nunchaku --yes
	@opam upgrade nunchaku --yes

bugs:
	@$(TEST_TOOL) run $(TEST_OPTS) -c test.toml --junit bugs.xml $@

SHOULD_PASS_PROVERS=nunchaku-cvc4,nunchaku-paradox,nunchaku-kodkod,nunchaku-smbc

quick:
	@$(TEST_TOOL) run $(TEST_OPTS) -c test.toml -p nunchaku --junit quick.xml

should_pass:
	@mkdir -p snapshots
	$(TEST_TOOL) run $(TEST_OPTS) -c test.toml -p $(SHOULD_PASS_PROVERS) \
	  --junit should_pass.xml --summary snapshots/`date -Im`.txt

smbc:
	@$(TEST_TOOL) run $(TEST_OPTS) -c test.toml -p nunchaku-smbc --junit smbc.xml

logitest:
	@if !(which $(TEST_TOOL) > /dev/null) ; then echo "please install $(TEST_TOOL)"; exit 1; fi

bisect-clean:
	rm -f bisect*.out
	rm -rf bisect.html

bisect:
	./bisect_run.sh

.PHONY: update should_pass bugs bisect bisect-clean
