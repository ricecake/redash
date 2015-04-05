REBAR=		./rebar
DIALYZER=	dialyzer


.PHONY: all deps compile get-deps clean

all: compile release

deps: clean get-deps

package: clean get-deps compile release bundle

get-deps:
	@$(REBAR) get-deps

compile:
	@$(REBAR) compile

clean:
	@$(REBAR) clean

repl:
	erl -pz deps/*/ebin -pa ebin

release:
	@$(REBAR) generate

bundle:
	mkdir -p packages;
	tar czf packages/redash.tar.gz -C rel redash
