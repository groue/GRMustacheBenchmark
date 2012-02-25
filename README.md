# GRMustache benchmarks

You can here compare the performance of all [GRMustache](https://github.com/groue/GRMustache) versions since v1.7.1 (the first shipped as a static library).

GRMustache has been tested against the scenarios stored in the [Scenarios](GRMustacheBenchmark/tree/master/Scenarios) directory.

- `medium`: a reasonable Mustache template, that comes straight from a real application.
- `short`: a very very short template.

For each version and scenario, we benchmark three different tasks: parsing, rendering, and combined parsing+rendering.

Numbers below are computed from normal duration samples of those tasks.

## Tasks


### Parsing+Rendering task

	           medium   short
	v1.11.1     605.3    11.5
	v1.11.0     608.2    11.5
	v1.10.3     605.5    11.5
	v1.10.2     600.2    11.5
	v1.10.1     719.5    13.6
	v1.10.0     738.9    13.9
	v1.9.0      781.0    14.7
	v1.8.6      774.8    14.7
	v1.8.5      767.3    14.6
	v1.8.4      766.6    14.6
	v1.8.3      768.3    14.8
	v1.8.2      764.6    14.6
	v1.8.1      765.6    14.6
	v1.8.0      767.0    14.5
	v1.7.4      745.4    13.1
	v1.7.3      741.9    13.1
	v1.7.2      743.0    13.1
	v1.7.1      741.7    13.3

### Parsing task

	           medium   short
	v1.11.1      81.0     7.6
	v1.11.0      81.0     7.6
	v1.10.3      81.1     7.6
	v1.10.2      80.4     7.6
	v1.10.1      80.8     7.6
	v1.10.0      78.0     7.5
	v1.9.0       65.3     6.9
	v1.8.6       63.9     6.9
	v1.8.5       64.7     7.0
	v1.8.4       64.5     6.9
	v1.8.3       64.5     7.0
	v1.8.2       64.4     7.0
	v1.8.1       64.8     7.0
	v1.8.0       64.3     6.9
	v1.7.4       64.1     6.6
	v1.7.3       63.7     6.5
	v1.7.2       63.9     6.6
	v1.7.1       63.5     6.3

### Rendering task

	           medium   short
	v1.11.1     490.3     1.0
	v1.11.0     490.4     1.0
	v1.10.3     489.3     1.0
	v1.10.2     486.9     1.0
	v1.10.1     605.8     2.9
	v1.10.0     627.6     3.2
	v1.9.0      683.2     4.4
	v1.8.6      678.7     4.4
	v1.8.5      669.6     4.3
	v1.8.4      669.2     4.3
	v1.8.3      666.8     4.3
	v1.8.2      667.6     4.3
	v1.8.1      668.6     4.3
	v1.8.0      668.2     4.3
	v1.7.4      649.4     3.7
	v1.7.3      648.4     3.6
	v1.7.2      649.2     3.6
	v1.7.1      646.1     3.6

-----

This README.md file has been generated with the `make` command.

