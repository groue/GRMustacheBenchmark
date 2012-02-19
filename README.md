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
	v1.10.2.sample    590.31   11.59
	v1.10.1.sample    703.05   13.38
	v1.10.0.sample    725.10   13.46
	v1.9.0.sample     768.79   14.42
	v1.8.6.sample     759.56   14.49
	v1.8.5.sample     751.41   14.23
	v1.8.4.sample     752.71   14.32
	v1.8.3.sample     753.26   14.37
	v1.8.2.sample     750.61   14.35
	v1.8.1.sample     753.61   14.25
	v1.8.0.sample     752.71   14.20
	v1.7.4.sample     729.17   12.89
	v1.7.3.sample     731.47   12.92
	v1.7.2.sample     737.34   15.39
	v1.7.1.sample     726.44   12.78

### Parsing task

	                  medium   short
	v1.10.2.sample     78.47    7.37
	v1.10.1.sample     78.22    7.39
	v1.10.0.sample     76.18    7.28
	v1.9.0.sample      63.50    6.79
	v1.8.6.sample      61.93    6.80
	v1.8.5.sample      63.25    6.86
	v1.8.4.sample      62.79    6.91
	v1.8.3.sample      62.88    6.83
	v1.8.2.sample      62.55    6.83
	v1.8.1.sample      63.10    6.86
	v1.8.0.sample      62.08    6.87
	v1.7.4.sample      63.61    6.53
	v1.7.3.sample      63.37    6.39
	v1.7.2.sample      62.02    6.44
	v1.7.1.sample      62.17    6.18

### Rendering task

	                  medium   short
	v1.10.2.sample    475.42    1.00
	v1.10.1.sample    590.50    2.82
	v1.10.0.sample    617.50    3.10
	v1.9.0.sample     678.40    4.28
	v1.8.6.sample     667.98    4.29
	v1.8.5.sample     657.39    4.10
	v1.8.4.sample     656.87    4.12
	v1.8.3.sample     659.39    4.14
	v1.8.2.sample     657.28    4.15
	v1.8.1.sample     660.45    4.13
	v1.8.0.sample     660.44    4.16
	v1.7.4.sample     639.20    3.56
	v1.7.3.sample     638.83    3.75
	v1.7.2.sample     638.45    3.85
	v1.7.1.sample     631.06    3.52

-----

This README.md file has been generated with the `make` command.

