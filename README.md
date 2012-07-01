# GRMustache benchmarks

You can here compare the performance of all [GRMustache](https://github.com/groue/GRMustache) versions since v1.7.1 (the first shipped as a static library).

GRMustache has been tested against the scenarios stored in the [Scenarios](GRMustacheBenchmark/tree/master/Scenarios) directory.

- `medium`: a reasonable Mustache template, that comes straight from a real application.
- `short`: a very very short template.

For each version and scenario, we benchmark three different tasks: parsing, rendering, and combined parsing+rendering.


## Rendering task

	            medium    short
	v4.1.1     1.3e+02  1.0e+00
	v4.1.0     1.3e+02  1.0e+00
	v4.0.0     3.2e+01  2.5e+00
	v3.0.1     6.2e+02  1.0e+00
	v3.0.0     6.2e+02  1.0e+00
	v2.0.0     6.2e+02  1.0e+00
	v1.13.0    7.3e+02  1.7e+00
	v1.12.2    7.3e+02  1.6e+00
	v1.12.1    7.3e+02  1.6e+00
	v1.12.0    7.3e+02  1.5e+00
	v1.11.2    7.3e+02  1.6e+00
	v1.11.1    6.9e+02  1.7e+00
	v1.11.0    6.9e+02  1.6e+00
	v1.10.3    6.9e+02  1.6e+00
	v1.10.2    6.9e+02  1.6e+00
	v1.10.1    8.5e+02  4.3e+00
	v1.10.0    8.9e+02  4.8e+00
	v1.9.0     9.7e+02  7.0e+00
	v1.8.6     9.7e+02  7.0e+00
	v1.8.5     9.6e+02  6.8e+00
	v1.8.4     9.5e+02  6.9e+00
	v1.8.3     9.5e+02  6.8e+00
	v1.8.2     9.5e+02  6.9e+00
	v1.8.1     9.5e+02  6.9e+00
	v1.8.0     9.6e+02  6.8e+00
	v1.7.4     9.2e+02  5.9e+00
	v1.7.3     9.2e+02  5.9e+00
	v1.7.2     9.2e+02  5.8e+00
	v1.7.1     9.2e+02  5.8e+00

## Parsing task

	            medium    short
	v4.1.1     1.3e+02  1.3e+01
	v4.1.0     1.3e+02  1.3e+01
	v4.0.0     1.3e+02  1.3e+01
	v3.0.1     1.3e+02  1.3e+01
	v3.0.0     1.3e+02  1.3e+01
	v2.0.0     1.3e+02  1.3e+01
	v1.13.0    1.3e+02  1.3e+01
	v1.12.2    1.1e+02  1.2e+01
	v1.12.1    1.6e+02  1.5e+01
	v1.12.0    1.1e+02  1.2e+01
	v1.11.2    1.1e+02  1.2e+01
	v1.11.1    1.1e+02  1.2e+01
	v1.11.0    1.1e+02  1.1e+01
	v1.10.3    1.1e+02  1.2e+01
	v1.10.2    1.1e+02  1.2e+01
	v1.10.1    1.1e+02  1.2e+01
	v1.10.0    1.1e+02  1.1e+01
	v1.9.0     8.9e+01  1.1e+01
	v1.8.6     8.9e+01  1.1e+01
	v1.8.5     9.0e+01  1.1e+01
	v1.8.4     9.0e+01  1.1e+01
	v1.8.3     9.0e+01  1.1e+01
	v1.8.2     9.1e+01  1.1e+01
	v1.8.1     9.0e+01  1.1e+01
	v1.8.0     9.0e+01  1.1e+01
	v1.7.4     8.9e+01  1.0e+01
	v1.7.3     9.0e+01  1.0e+01
	v1.7.2     8.9e+01  1.0e+01
	v1.7.1     8.8e+01  9.5e+00

## Parsing+Rendering task

	            medium    short
	v4.1.1     2.7e+02  1.7e+01
	v4.1.0     2.8e+02  1.7e+01
	v4.0.0     1.8e+02  1.8e+01
	v3.0.1     7.8e+02  1.7e+01
	v3.0.0     7.8e+02  1.7e+01
	v2.0.0     7.9e+02  1.7e+01
	v1.13.0    9.1e+02  1.9e+01
	v1.12.2    9.0e+02  1.8e+01
	v1.12.1    9.5e+02  2.1e+01
	v1.12.0    8.9e+02  1.8e+01
	v1.11.2    8.9e+02  1.8e+01
	v1.11.1    8.5e+02  1.8e+01
	v1.11.0    8.5e+02  1.8e+01
	v1.10.3    8.5e+02  1.8e+01
	v1.10.2    8.5e+02  1.8e+01
	v1.10.1    1.0e+03  2.1e+01
	v1.10.0    1.1e+03  2.1e+01
	v1.9.0     1.1e+03  2.3e+01
	v1.8.6     1.1e+03  2.2e+01
	v1.8.5     1.1e+03  2.2e+01
	v1.8.4     1.1e+03  2.3e+01
	v1.8.3     1.1e+03  2.2e+01
	v1.8.2     1.1e+03  2.2e+01
	v1.8.1     1.1e+03  2.2e+01
	v1.8.0     1.1e+03  2.2e+01
	v1.7.4     1.1e+03  2.0e+01
	v1.7.3     1.1e+03  2.0e+01
	v1.7.2     1.1e+03  2.0e+01
	v1.7.1     1.1e+03  2.0e+01

-----

<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/medium-render.png" alt="Plot for task 'render' and scenario 'medium'">
</td>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/short-render.png" alt="Plot for task 'render' and scenario 'short'">
</td>
</tr>
<tr>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/medium-parse.png" alt="Plot for task 'parse' and scenario 'medium'">
</td>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/short-parse.png" alt="Plot for task 'parse' and scenario 'short'">
</td>
</tr>
<tr>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/medium-combined.png" alt="Plot for task 'combined' and scenario 'medium'">
</td>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/short-combined.png" alt="Plot for task 'combined' and scenario 'short'">
</td>
</tr>
</table>

-----

This README.md file has been generated with the `make` command.

