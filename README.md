# GRMustache benchmarks

You can here compare the performance of all GRMustache versions since v1.7.1 (the first shipped as a static library).

GRMustache has been tested against the scenarios stored in the [Scenarios](GRMustacheBenchmark/tree/master/Scenarios) directory.

- `medium`: a reasonable Mustache template, that comes straight from a real application.
- `short`: a very very short template.

For each version and scenario, we benchmark three different tasks: parsing, rendering, and combined parsing+rendering.

Numbers below are computed from normal duration samples of those tasks.

## Tasks


### Parsing+Rendering task

	           medium   short
	v1.10.2    556.78   10.74
	v1.10.1    665.27   12.75
	v1.10.0    676.78   12.79
	v1.9.0     718.94   13.63
	v1.8.6     715.95   13.62
	v1.8.5     705.03   13.53
	v1.8.4     703.68   13.49
	v1.8.3     703.57   13.50
	v1.8.2     702.73   13.49
	v1.8.1     704.35   13.47
	v1.8.0     704.97   13.40
	v1.7.4     682.30   12.03
	v1.7.3     684.57   11.98
	v1.7.2     680.77   11.98
	v1.7.1     678.75   11.93

### Parsing task

	           medium   short
	v1.10.2     77.77    7.30
	v1.10.1     75.93    7.25
	v1.10.0     73.10    7.03
	v1.9.0      59.55    6.56
	v1.8.6      59.52    6.59
	v1.8.5      59.62    6.63
	v1.8.4      59.76    6.67
	v1.8.3      59.72    6.64
	v1.8.2      59.63    6.65
	v1.8.1      59.66    6.68
	v1.8.0      59.67    6.62
	v1.7.4      59.90    6.18
	v1.7.3      59.86    6.13
	v1.7.2      59.66    6.15
	v1.7.1      58.89    5.78

### Rendering task

	           medium   short
	v1.10.2    453.30    1.00
	v1.10.1    560.27    2.70
	v1.10.0    575.33    2.95
	v1.9.0     633.14    4.01
	v1.8.6     626.48    3.99
	v1.8.5     616.52    3.87
	v1.8.4     617.47    3.90
	v1.8.3     617.56    3.94
	v1.8.2     616.43    3.91
	v1.8.1     614.94    3.91
	v1.8.0     616.71    3.92
	v1.7.4     594.53    3.32
	v1.7.3     598.09    3.31
	v1.7.2     595.66    3.29
	v1.7.1     593.63    3.31

-----

This README.md file has been generated with the `make` command.

