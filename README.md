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
	v1.11.2     576.0    11.6
	v1.11.1     555.6    11.4
	v1.11.0     550.1    11.4
	v1.10.3     552.4    11.3
	v1.10.2     548.4    11.3
	v1.10.1     658.3    13.4
	v1.10.0     677.1    13.6
	v1.9.0      713.8    14.4
	v1.8.6      712.3    14.5
	v1.8.5      698.5    14.2
	v1.8.4      698.2    14.2
	v1.8.3      697.1    14.2
	v1.8.2      699.6    14.2
	v1.8.1      699.2    14.2
	v1.8.0      701.3    14.2
	v1.7.4      681.4    12.9
	v1.7.3      678.0    12.9
	v1.7.2      680.8    12.8
	v1.7.1      677.4    12.9

### Parsing task

	           medium   short
	v1.11.2      73.2     7.6
	v1.11.1      72.7     7.4
	v1.11.0      72.5     7.8
	v1.10.3      72.5     7.4
	v1.10.2      71.9     7.4
	v1.10.1      72.7     7.5
	v1.10.0      69.3     7.2
	v1.9.0       58.8     6.8
	v1.8.6       57.4     6.8
	v1.8.5       57.8     6.8
	v1.8.4       57.5     6.8
	v1.8.3       57.7     6.8
	v1.8.2       57.7     6.8
	v1.8.1       57.9     6.8
	v1.8.0       57.7     6.8
	v1.7.4       57.2     6.4
	v1.7.3       57.4     6.3
	v1.7.2       57.9     6.4
	v1.7.1       57.0     6.1

### Rendering task

	           medium   short
	v1.11.2     472.7     1.0
	v1.11.1     445.0     1.0
	v1.11.0     447.5     1.0
	v1.10.3     445.9     1.0
	v1.10.2     444.4     1.0
	v1.10.1     554.5     2.8
	v1.10.0     574.1     3.1
	v1.9.0      626.0     4.4
	v1.8.6      621.6     4.4
	v1.8.5      609.5     4.3
	v1.8.4      609.3     4.3
	v1.8.3      609.0     4.3
	v1.8.2      608.7     4.3
	v1.8.1      610.1     4.4
	v1.8.0      611.3     4.3
	v1.7.4      593.3     3.8
	v1.7.3      592.0     3.8
	v1.7.2      591.9     3.8
	v1.7.1      591.7     3.8

-----

This README.md file has been generated with the `make` command.

