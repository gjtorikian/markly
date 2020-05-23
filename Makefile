C_SOURCES = $(wildcard ext/markly/*.[ch])

update-c-sources: build-upstream $(C_SOURCES)

.PHONY: build-upstream

build-upstream:
	cd ext/markly/cmark-upstream && make

ext/markly/%: ext/markly/cmark-upstream/src/%
	cp $< $@

ext/markly/%: ext/markly/cmark-upstream/extensions/%
	cp $< $@

ext/markly/config.h: ext/markly/cmark-upstream/build/src/config.h
	cp $< $@

ext/markly/cmark-gfm_export.h: ext/markly/cmark-upstream/build/src/cmark-gfm_export.h
	cp $< $@

ext/markly/cmark-gfm_version.h: ext/markly/cmark-upstream/build/src/cmark-gfm_version.h
	cp $< $@

ext/markly/cmark-gfm-extensions_export.h: ext/markly/cmark-upstream/build/extensions/cmark-gfm-extensions_export.h
	cp $< $@
