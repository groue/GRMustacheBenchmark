VERSIONS = v1.11.1 v1.11.0 v1.10.3 v1.10.2 v1.10.1 v1.10.0 v1.9.0 v1.8.6 v1.8.5 v1.8.4 v1.8.3 v1.8.2 v1.8.1 v1.8.0 v1.7.4 v1.7.3 v1.7.2 v1.7.1
SCENARIOS = short medium
TASKS = parse render combined
SAMPLE_COUNT_short_parse = 50000
SAMPLE_COUNT_short_render = 300000
SAMPLE_COUNT_short_combined = 25000
SAMPLE_COUNT_medium_parse = 4000
SAMPLE_COUNT_medium_render = 1000
SAMPLE_COUNT_medium_combined = 500

all: README.md

README.md: $(foreach version,$(VERSIONS),version_samples_$(version))
	Scripts/build_README > README.md

define VERSION_SAMPLES_template
$(foreach scenario,$(SCENARIOS),$(eval $(call VERSION_SCENARIO_template,$(1),$(scenario))))
version_samples_$(1): $(foreach task,$(TASKS),$(foreach scenario,$(SCENARIOS),Product/samples/$(scenario)/$(task)/$(1).sample))
Product/build/$(1)/Release/GRMustacheBenchmark: Product/lib/GRMustache-$(1)/lib/libGRMustache1-macosx10.6.a Product/lib/GRMustache-$(1)/include/GRMustache.h
	rm -f Product/lib/GRMustache
	ln -s GRMustache-$(1) Product/lib/GRMustache
	xcodebuild -project GRMustacheBenchmark.xcodeproj -configuration Release build SYMROOT=Product/build/$(1)
clean_version_samples_$(1):
	if [ -d Product/samples ]; then find Product/samples -name "$1*" -exec rm -- {} \; ; fi
clean_version_build_$(1):
	rm -rf Product/build/$(1)
clean_version_$(1): clean_version_samples_$(1) clean_version_lib_$(1) clean_version_build_$(1)
endef

define VERSION_LIB_template
Product/lib/GRMustache-$(1):
	mkdir -p Libs
	git clone https://github.com/groue/GRMustache.git Product/lib/GRMustache-$(1)
	cd Product/lib/GRMustache-$(1) && git checkout $(1)
Product/lib/GRMustache-$(1)/include/GRMustache.h: Product/lib/GRMustache-$(1)
Product/lib/GRMustache-$(1)/lib/libGRMustache1-macosx10.6.a: Product/lib/GRMustache-$(1)
clean_version_lib_$(1):
	rm -rf Product/lib/GRMustache-$(1)
endef

define VERSION_SCENARIO_template
$(foreach task,$(TASKS),$(eval $(call VERSION_SCENARIO_TASK_template,$(1),$(2),$(task))))
endef

define VERSION_SCENARIO_TASK_template
Product/samples/$(2)/$(3)/$(1).sample: Product/samples/$(2)/$(3)/$(1).stripped
	Scripts/average < Product/samples/$(2)/$(3)/$(1).stripped > Product/samples/$(2)/$(3)/$(1).sample
Product/samples/$(2)/$(3)/$(1).stripped: Product/samples/$(2)/$(3)/$(1).raw
	cat Product/samples/$(2)/$(3)/$(1).raw | Scripts/strip_normal 0.5 | sort -n | head -10 > Product/samples/$(2)/$(3)/$(1).stripped
Product/samples/$(2)/$(3)/$(1).raw: Product/build/$(1)/Release/GRMustacheBenchmark Product/samples/$(2)/$(3)/$(1).sample_count
	mkdir -p Product/samples/$(2)/$(3)
	Scripts/repeat 20 Product/build/$(1)/Release/GRMustacheBenchmark `cat Product/samples/$(2)/$(3)/$(1).sample_count` $(3) Scenarios/$(2) | tee Product/samples/$(2)/$(3)/$(1).raw
Product/samples/$(2)/$(3)/$(1).sample_count:
	mkdir -p Product/samples/$(2)/$(3)
	echo $(SAMPLE_COUNT_$(2)_$(3)) > Product/samples/$(2)/$(3)/$(1).sample_count
endef

$(foreach version,$(VERSIONS),$(eval $(call VERSION_SAMPLES_template,$(version))))
$(foreach version,$(VERSIONS),$(eval $(call VERSION_LIB_template,$(version))))
$(eval $(call VERSION_SAMPLES_template,LOCAL))
Product/lib/GRMustache-LOCAL:
	mkdir -p Libs
	[ -e Product/lib/GRMustache-LOCAL ] || ln -s ../../../GRMustache Product/lib/GRMustache-LOCAL
Product/lib/GRMustache-LOCAL/include/GRMustache.h: Product/lib/GRMustache-LOCAL
	cd Product/lib/GRMustache-LOCAL; make include/GRMustache.h
Product/lib/GRMustache-LOCAL/lib/libGRMustache1-macosx10.6.a: Product/lib/GRMustache-LOCAL
	cd Product/lib/GRMustache-LOCAL; make lib/libGRMustache1-macosx10.6.a
clean_version_lib_LOCAL: 
	mkdir -p Libs
	[ -e Product/lib/GRMustache-LOCAL ] || ln -s ../../../GRMustache Product/lib/GRMustache-LOCAL
	cd Product/lib/GRMustache-LOCAL; make clean

.PHONY : clean_lib
clean_lib :
	rm -rf Libs

.PHONY : clean_build
clean_build :
	rm -rf Product/build

.PHONY : clean_samples
clean_samples :
	rm -rf Products/samples

.PHONY : clean
clean: clean_lib clean_build clean_samples
