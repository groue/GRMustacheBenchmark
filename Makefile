# VERSIONS = v6.2.0 v6.1.4 v6.1.3 v6.1.2 v6.1.1 v6.1.0 v6.0.1 v6.0.0 v5.5.2 v5.5.1 v5.5.0 v5.4.4 v5.4.3 v5.4.2 v5.4.1 v5.4.0 v5.3.0 v5.2.0 v5.1.0 v5.0.1 v5.0.0 v4.3.4 v4.3.3 v4.3.2 v4.3.1 v4.3.0 v4.2.0 v4.1.1 v4.1.0 v4.0.0 v3.0.1 v3.0.0 v2.0.0 v1.13.0 v1.12.2 v1.12.1 v1.12.0 v1.11.2 v1.11.1 v1.11.0 v1.10.3 v1.10.2 v1.10.1 v1.10.0 v1.9.0 v1.8.6 v1.8.5 v1.8.4 v1.8.3 v1.8.2 v1.8.1 v1.8.0 v1.7.4 v1.7.3 v1.7.2 v1.7.1
VERSIONS = v6.4.0 v6.3.0 v6.2.0 v6.1.4 v6.0.1 v5.5.2 v5.4.4 v5.3.0 v5.2.0 v5.1.0 v5.0.1 v4.3.4 v4.2.0 v4.1.1 v4.0.0 v3.0.1 v2.0.0 v1.13.0 v1.12.2 v1.11.2 v1.10.3 v1.9.0 v1.8.6 v1.7.4
LATEST = v6.4.0
COMPLEXITIES = 2 10 100
TASKS = parse render

all: README.md

README.md: $(foreach version,$(VERSIONS),version_samples_$(version))
	Scripts/build_README > README.md

define VERSION_SAMPLES_template
$(foreach complexity,$(COMPLEXITIES),$(eval $(call VERSION_COMPLEXITY_template,$(1),$(complexity))))
version_samples_$(1): $(foreach task,$(TASKS),$(foreach complexity,$(COMPLEXITIES),Product/samples/$(complexity)/$(task)/$(1).samples))
Product/build/$(1)/Release/GRMustacheBenchmark: Product/lib/GRMustache-$(1)/lib/libGRMustache.a Product/lib/GRMustache-$(1)/include/GRMustache.h
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
	mkdir -p Product/lib
	git clone https://github.com/groue/GRMustache.git Product/lib/GRMustache-$(1)
	cd Product/lib/GRMustache-$(1) && git checkout $(1)
Product/lib/GRMustache-$(1)/include/GRMustache.h: Product/lib/GRMustache-$(1)
Product/lib/GRMustache-$(1)/lib/libGRMustache.a: Product/lib/GRMustache-$(1)
	rm -f Product/lib/GRMustache-$(1)/lib/libGRMustache.a
	[ -f Product/lib/GRMustache-$(1)/lib/libGRMustache1-macosx10.6.a ] && ln -s libGRMustache1-macosx10.6.a Product/lib/GRMustache-$(1)/lib/libGRMustache.a || true
	[ -f Product/lib/GRMustache-$(1)/lib/libGRMustache2-MacOS.a ] && ln -s libGRMustache2-MacOS.a Product/lib/GRMustache-$(1)/lib/libGRMustache.a || true
	[ -f Product/lib/GRMustache-$(1)/lib/libGRMustache3-MacOS.a ] && ln -s libGRMustache3-MacOS.a Product/lib/GRMustache-$(1)/lib/libGRMustache.a || true
	[ -f Product/lib/GRMustache-$(1)/lib/libGRMustache4-MacOS.a ] && ln -s libGRMustache4-MacOS.a Product/lib/GRMustache-$(1)/lib/libGRMustache.a || true
	[ -f Product/lib/GRMustache-$(1)/lib/libGRMustache5-MacOS.a ] && ln -s libGRMustache5-MacOS.a Product/lib/GRMustache-$(1)/lib/libGRMustache.a || true
	[ -f Product/lib/GRMustache-$(1)/lib/libGRMustache6-MacOS.a ] && ln -s libGRMustache6-MacOS.a Product/lib/GRMustache-$(1)/lib/libGRMustache.a || true
clean_version_lib_$(1):
	rm -rf Product/lib/GRMustache-$(1)
endef

define VERSION_COMPLEXITY_template
$(foreach task,$(TASKS),$(eval $(call VERSION_COMPLEXITY_TASK_template,$(1),$(2),$(task))))
endef

define VERSION_COMPLEXITY_TASK_template
Product/samples/$(2)/$(3)/$(1).samples: Product/build/$(1)/Release/GRMustacheBenchmark
	mkdir -p Product/samples/$(2)/$(3)
	Scripts/repeat 20 Product/build/$(1)/Release/GRMustacheBenchmark 1000 $(3) $(2) | tee Product/samples/$(2)/$(3)/$(1).samples
endef

$(foreach version,$(VERSIONS),$(eval $(call VERSION_SAMPLES_template,$(version))))
$(foreach version,$(VERSIONS),$(eval $(call VERSION_LIB_template,$(version))))
$(eval $(call VERSION_SAMPLES_template,LOCAL))
Product/lib/GRMustache-LOCAL:
	mkdir -p Product/lib
	[ -e Product/lib/GRMustache-LOCAL ] || ln -s ../../../GRMustache Product/lib/GRMustache-LOCAL
Product/lib/GRMustache-LOCAL/include/GRMustache.h: Product/lib/GRMustache-LOCAL/lib/libGRMustache.a
Product/lib/GRMustache-LOCAL/lib/libGRMustache.a: Product/lib/GRMustache-LOCAL
	cd Product/lib/GRMustache-LOCAL; make
	rm -f Product/lib/GRMustache-LOCAL/lib/libGRMustache.a
	[ -f Product/lib/GRMustache-LOCAL/lib/libGRMustache1-macosx10.6.a ] && ln -s libGRMustache1-macosx10.6.a Product/lib/GRMustache-LOCAL/lib/libGRMustache.a || true
	[ -f Product/lib/GRMustache-LOCAL/lib/libGRMustache2-MacOS.a ] && ln -s libGRMustache2-MacOS.a Product/lib/GRMustache-LOCAL/lib/libGRMustache.a || true
	[ -f Product/lib/GRMustache-LOCAL/lib/libGRMustache3-MacOS.a ] && ln -s libGRMustache3-MacOS.a Product/lib/GRMustache-LOCAL/lib/libGRMustache.a || true
	[ -f Product/lib/GRMustache-LOCAL/lib/libGRMustache4-MacOS.a ] && ln -s libGRMustache4-MacOS.a Product/lib/GRMustache-LOCAL/lib/libGRMustache.a || true
	[ -f Product/lib/GRMustache-LOCAL/lib/libGRMustache5-MacOS.a ] && ln -s libGRMustache5-MacOS.a Product/lib/GRMustache-LOCAL/lib/libGRMustache.a || true
	[ -f Product/lib/GRMustache-LOCAL/lib/libGRMustache6-MacOS.a ] && ln -s libGRMustache6-MacOS.a Product/lib/GRMustache-LOCAL/lib/libGRMustache.a || true
clean_version_lib_LOCAL: 
	mkdir -p Product/lib
	[ -e Product/lib/GRMustache-LOCAL ] || ln -s ../../../GRMustache Product/lib/GRMustache-LOCAL
	cd Product/lib/GRMustache-LOCAL; make clean

version_samples_LATEST: version_samples_$(LATEST)
clean_version_samples_LATEST: clean_version_samples_$(LATEST)
clean_version_build_LATEST: clean_version_build_$(LATEST)
clean_version_LATEST: clean_version_$(LATEST)
clean_version_lib_LATEST: clean_version_lib_$(LATEST)

.PHONY : clean_lib
clean_lib :
	rm -rf Product/libs

.PHONY : clean_build
clean_build :
	rm -rf Product/build

.PHONY : clean_samples
clean_samples :
	rm -rf Product/samples

.PHONY : clean
clean:
	rm -rf Product
