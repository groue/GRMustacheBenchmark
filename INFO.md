### Add a new version to README.md:

Edit Makefile, add a GRMustache git tag to the VERSIONS variable, update LATEST variable if necessary, and run:

    make clean_version_samples_LOCAL    # make sure local samples do not enter the README.md
    make clean_samples                  # if you want to recompute all samples
    make

### Rerun a sample:

    make clean_version_samples_v1.10.2
    make version_samples_v1.10.2

### After a GRMustacheBenchmark implementation change

	make clean_build
	make clean_samples
	make
	
### Compare LOCAL GRMustache to LATEST version

Local GRMustache is the GRMustache repository located in the same folder as this GRMustacheBenchmark repository.

    make clean_version_samples_LATEST
    make version_samples_LATEST
    make clean_version_LOCAL    # cleans samples, bin, and lib, so that local GRMustache is rebuilt
    make version_samples_LOCAL
    Scripts/build_README

### List all make targets:

    make -pn | grep "^[^\s#%.(].*:" | grep -v "=" | grep -v "\\$" | grep -v "^Makefile:$" | sed "s/:.*//" | sort

