BENCHES = v1.10.2 v1.10.1 v1.10.0 v1.9.0 v1.8.6 v1.8.5 v1.8.4 v1.8.3 v1.8.2 v1.8.1 v1.8.0 v1.7.4 v1.7.3 v1.7.2 v1.7.1

all: README.md

README.md: $(BENCHES)
	Scripts/build_README > README.md

define BENCH_template
$(1): Product/Scenarios/short/parse/$(1) Product/Scenarios/short/render/$(1) Product/Scenarios/short/combined/$(1) Product/Scenarios/medium/parse/$(1) Product/Scenarios/medium/render/$(1) Product/Scenarios/medium/combined/$(1)
Product/Scenarios/short/parse/$(1): Product/bin/GRMustacheBenchmark-$(1)
	mkdir -p Product/Scenarios/short/parse
	Scripts/repeat 10 Product/bin/GRMustacheBenchmark-$(1) 250000 parse Scenarios/short | tee Product/Scenarios/short/parse/$(1).raw
	Scripts/strip_normal_68 < Product/Scenarios/short/parse/$(1).raw > Product/Scenarios/short/parse/$(1).stripped
	Scripts/average < Product/Scenarios/short/parse/$(1).stripped > Product/Scenarios/short/parse/$(1)
Product/Scenarios/short/render/$(1): Product/bin/GRMustacheBenchmark-$(1)
	mkdir -p Product/Scenarios/short/render
	Scripts/repeat 10 Product/bin/GRMustacheBenchmark-$(1) 1250000 render Scenarios/short | tee Product/Scenarios/short/render/$(1).raw
	Scripts/strip_normal_68 < Product/Scenarios/short/render/$(1).raw > Product/Scenarios/short/render/$(1).stripped
	Scripts/average < Product/Scenarios/short/render/$(1).stripped > Product/Scenarios/short/render/$(1)
Product/Scenarios/short/combined/$(1): Product/bin/GRMustacheBenchmark-$(1)
	mkdir -p Product/Scenarios/short/combined
	Scripts/repeat 10 Product/bin/GRMustacheBenchmark-$(1) 250000 combined Scenarios/short | tee Product/Scenarios/short/combined/$(1).raw
	Scripts/strip_normal_68 < Product/Scenarios/short/combined/$(1).raw > Product/Scenarios/short/combined/$(1).stripped
	Scripts/average < Product/Scenarios/short/combined/$(1).stripped > Product/Scenarios/short/combined/$(1)
Product/Scenarios/medium/parse/$(1): Product/bin/GRMustacheBenchmark-$(1)
	mkdir -p Product/Scenarios/medium/parse
	Scripts/repeat 10 Product/bin/GRMustacheBenchmark-$(1) 30000 parse Scenarios/medium | tee Product/Scenarios/medium/parse/$(1).raw
	Scripts/strip_normal_68 < Product/Scenarios/medium/parse/$(1).raw > Product/Scenarios/medium/parse/$(1).stripped
	Scripts/average < Product/Scenarios/medium/parse/$(1).stripped > Product/Scenarios/medium/parse/$(1)
Product/Scenarios/medium/render/$(1): Product/bin/GRMustacheBenchmark-$(1)
	mkdir -p Product/Scenarios/medium/render
	Scripts/repeat 10 Product/bin/GRMustacheBenchmark-$(1) 5000 render Scenarios/medium | tee Product/Scenarios/medium/render/$(1).raw
	Scripts/strip_normal_68 < Product/Scenarios/medium/render/$(1).raw > Product/Scenarios/medium/render/$(1).stripped
	Scripts/average < Product/Scenarios/medium/render/$(1).stripped > Product/Scenarios/medium/render/$(1)
Product/Scenarios/medium/combined/$(1): Product/bin/GRMustacheBenchmark-$(1)
	mkdir -p Product/Scenarios/medium/combined
	Scripts/repeat 10 Product/bin/GRMustacheBenchmark-$(1) 5000 combined Scenarios/medium | tee Product/Scenarios/medium/combined/$(1).raw
	Scripts/strip_normal_68 < Product/Scenarios/medium/combined/$(1).raw > Product/Scenarios/medium/combined/$(1).stripped
	Scripts/average < Product/Scenarios/medium/combined/$(1).stripped > Product/Scenarios/medium/combined/$(1)
Product/bin/GRMustacheBenchmark-$(1): Product/build/$(1)/Release/GRMustacheBenchmark
	mkdir -p Product/bin
	cp Product/build/$(1)/Release/GRMustacheBenchmark Product/bin/GRMustacheBenchmark-$(1)
Product/build/$(1)/Release/GRMustacheBenchmark: Libs/GRMustache-$(1)
	rm -f Libs/GRMustache
	ln -s GRMustache-$(1) Libs/GRMustache
	xcodebuild -project GRMustacheBenchmark.xcodeproj -configuration Release build SYMROOT=Product/build/$(1)
Libs/GRMustache-$(1):
	mkdir -p Libs
	git clone https://github.com/groue/GRMustache.git Libs/GRMustache-$(1)
	cd Libs/GRMustache-$(1) && git checkout $(1)
endef

$(foreach bench,$(BENCHES),$(eval $(call BENCH_template,$(bench))))

.PHONY : clean_lib
clean_lib :
	rm -rf Libs

.PHONY : clean_bin
clean_bin :
	rm -rf Product/build
	rm -rf Product/bin

.PHONY : clean_benchmarks
clean_benchmarks :
	rm -rf Products/Scenario

.PHONY : clean
clean: clean_lib clean_bin clean_benchmarks
