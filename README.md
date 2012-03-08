# GRMustache benchmarks

You can here compare the performance of all [GRMustache](https://github.com/groue/GRMustache) versions since v1.7.1 (the first shipped as a static library).

GRMustache has been tested against the scenarios stored in the [Scenarios](GRMustacheBenchmark/tree/master/Scenarios) directory.

- `medium`: a reasonable Mustache template, that comes straight from a real application.
- `short`: a very very short template.

For each version and scenario, we benchmark three different tasks: parsing, rendering, and combined parsing+rendering.


## Parsing+Rendering task

	            medium    short
	v1.12.1    6.1e+02  1.4e+01
	v1.12.0    5.7e+02  1.1e+01
	v1.11.2    5.7e+02  1.1e+01
	v1.11.1    5.5e+02  1.1e+01
	v1.11.0    5.4e+02  1.1e+01
	v1.10.3    5.5e+02  1.1e+01
	v1.10.2    5.4e+02  1.1e+01
	v1.10.1    6.5e+02  1.3e+01
	v1.10.0    6.7e+02  1.3e+01
	v1.9.0     7.1e+02  1.4e+01
	v1.8.6     7.0e+02  1.4e+01
	v1.8.5     6.9e+02  1.4e+01
	v1.8.4     6.9e+02  1.4e+01
	v1.8.3     6.9e+02  1.4e+01
	v1.8.2     6.9e+02  1.4e+01
	v1.8.1     6.9e+02  1.4e+01
	v1.8.0     6.9e+02  1.4e+01
	v1.7.4     6.7e+02  1.3e+01
	v1.7.3     6.7e+02  1.3e+01
	v1.7.2     6.7e+02  1.3e+01
	v1.7.1     6.7e+02  1.3e+01

## Parsing task

	            medium    short
	v1.12.1    1.0e+02  9.6e+00
	v1.12.0    7.1e+01  7.4e+00
	v1.11.2    7.1e+01  7.4e+00
	v1.11.1    7.2e+01  7.4e+00
	v1.11.0    7.2e+01  7.3e+00
	v1.10.3    7.2e+01  7.4e+00
	v1.10.2    7.1e+01  7.4e+00
	v1.10.1    7.1e+01  7.3e+00
	v1.10.0    6.8e+01  7.1e+00
	v1.9.0     5.8e+01  6.8e+00
	v1.8.6     5.6e+01  6.8e+00
	v1.8.5     5.7e+01  6.8e+00
	v1.8.4     5.7e+01  6.8e+00
	v1.8.3     5.7e+01  6.8e+00
	v1.8.2     5.7e+01  6.8e+00
	v1.8.1     5.7e+01  6.8e+00
	v1.8.0     5.7e+01  6.7e+00
	v1.7.4     5.7e+01  6.4e+00
	v1.7.3     5.7e+01  6.3e+00
	v1.7.2     5.7e+01  6.3e+00
	v1.7.1     5.6e+01  6.0e+00

## Rendering task

	            medium    short
	v1.12.1    4.7e+02  1.0e+00
	v1.12.0    4.7e+02  1.0e+00
	v1.11.2    4.7e+02  1.0e+00
	v1.11.1    4.4e+02  1.0e+00
	v1.11.0    4.4e+02  1.0e+00
	v1.10.3    4.4e+02  1.0e+00
	v1.10.2    4.4e+02  1.0e+00
	v1.10.1    5.5e+02  2.8e+00
	v1.10.0    5.7e+02  3.0e+00
	v1.9.0     6.2e+02  4.4e+00
	v1.8.6     6.2e+02  4.3e+00
	v1.8.5     6.0e+02  4.2e+00
	v1.8.4     6.0e+02  4.2e+00
	v1.8.3     6.0e+02  4.2e+00
	v1.8.2     6.0e+02  4.2e+00
	v1.8.1     6.0e+02  4.2e+00
	v1.8.0     6.0e+02  4.3e+00
	v1.7.4     5.9e+02  3.7e+00
	v1.7.3     5.9e+02  3.7e+00
	v1.7.2     5.8e+02  3.7e+00
	v1.7.1     5.9e+02  3.7e+00

-----

This README.md file has been generated with the `make` command.

