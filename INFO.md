Make README.md:

    make

List all make targets:

    make -pn | grep -P "^[^\s#%.(].*:" | grep -v "=" | grep -v "\\$" | grep -v "^Makefile:$" | sed "s/:.*//" | sort

Rerun a sample:

    make clean clean_version_samples_v1.10.2
    make clean version_samples_v1.10.2

Rerun samples for local GRMustache:

    make clean_version_LOCAL
    make version_samples_LOCAL

