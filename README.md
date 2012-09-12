# GRMustache benchmarks

You can here compare the performance of all [GRMustache](https://github.com/groue/GRMustache) versions since v1.7.1 (the first shipped as a static library).

GRMustache has been tested against random templates of various complexities, containing an average of 2, 10, or 100 elements (text, `{{variable}}` tags, or `{{#section}}` tags).

For each version and complexity, we benchmark two different tasks: parsing, and rendering.

Those benchmarks are relative, not absolute: numbers have no unit. They are all relative to the time taken by the shortest task, which is given the score 1.


## Rendering task

	                 2       10      100
	v5.0.0     1.0e+00  2.7e+00  1.9e+01
	v4.3.4     1.5e+00  4.0e+00  3.3e+01
	v4.3.3     1.5e+00  4.0e+00  3.2e+01
	v4.3.2     1.5e+00  4.1e+00  3.3e+01
	v4.3.1     1.5e+00  3.9e+00  3.1e+01
	v4.3.0     1.5e+00  3.9e+00  3.2e+01
	v4.2.0     1.4e+00  4.7e+00  4.2e+01
	v4.1.1     1.4e+00  4.6e+00  3.9e+01
	v4.1.0     1.4e+00  4.6e+00  3.9e+01
	v4.0.0     1.4e+00  4.7e+00  4.0e+01
	v3.0.1     1.5e+00  4.8e+00  4.1e+01
	v3.0.0     1.5e+00  4.9e+00  4.1e+01
	v2.0.0     1.5e+00  4.8e+00  4.0e+01
	v1.13.0    1.6e+00  5.2e+00  4.5e+01
	v1.12.2    1.6e+00  5.3e+00  4.6e+01
	v1.12.1    1.6e+00  5.4e+00  4.7e+01
	v1.12.0    1.6e+00  5.4e+00  4.7e+01
	v1.11.2    1.6e+00  5.3e+00  4.7e+01
	v1.11.1    1.6e+00  5.2e+00  4.7e+01
	v1.11.0    1.6e+00  5.3e+00  4.6e+01
	v1.10.3    1.6e+00  5.3e+00  4.7e+01
	v1.10.2    1.6e+00  5.3e+00  4.7e+01
	v1.10.1    3.3e+00  1.3e+01  1.2e+02
	v1.10.0    3.3e+00  1.4e+01  1.3e+02
	v1.9.0     3.1e+00  1.1e+01  1.0e+02
	v1.8.6     3.0e+00  1.1e+01  1.0e+02
	v1.8.5     2.8e+00  1.1e+01  9.7e+01
	v1.8.4     2.8e+00  1.1e+01  9.8e+01
	v1.8.3     2.8e+00  1.1e+01  9.8e+01
	v1.8.2     2.8e+00  1.1e+01  9.7e+01
	v1.8.1     2.8e+00  1.1e+01  9.8e+01
	v1.8.0     2.8e+00  1.1e+01  9.8e+01
	v1.7.4     2.6e+00  1.0e+01  9.3e+01
	v1.7.3     2.6e+00  1.0e+01  9.3e+01
	v1.7.2     2.7e+00  1.0e+01  9.4e+01
	v1.7.1     2.6e+00  1.0e+01  9.3e+01

## Parsing task

	                 2       10      100
	v5.0.0     4.3e+00  1.5e+01  1.4e+02
	v4.3.4     4.2e+00  1.5e+01  1.4e+02
	v4.3.3     4.2e+00  1.5e+01  1.4e+02
	v4.3.2     4.3e+00  1.5e+01  1.4e+02
	v4.3.1     4.2e+00  1.5e+01  1.4e+02
	v4.3.0     4.1e+00  1.5e+01  1.4e+02
	v4.2.0     3.8e+00  1.3e+01  1.1e+02
	v4.1.1     3.7e+00  1.3e+01  1.1e+02
	v4.1.0     3.8e+00  1.3e+01  1.1e+02
	v4.0.0     3.9e+00  1.3e+01  1.1e+02
	v3.0.1     3.8e+00  1.3e+01  1.1e+02
	v3.0.0     3.9e+00  1.3e+01  1.1e+02
	v2.0.0     4.0e+00  1.3e+01  1.1e+02
	v1.13.0    3.9e+00  1.3e+01  1.2e+02
	v1.12.2    3.6e+00  1.2e+01  1.1e+02
	v1.12.1    4.5e+00  1.6e+01  1.5e+02
	v1.12.0    3.6e+00  1.1e+01  1.0e+02
	v1.11.2    3.7e+00  1.1e+01  1.0e+02
	v1.11.1    3.6e+00  1.2e+01  1.0e+02
	v1.11.0    3.6e+00  1.1e+01  1.0e+02
	v1.10.3    3.6e+00  1.1e+01  1.0e+02
	v1.10.2    3.7e+00  1.1e+01  1.0e+02
	v1.10.1    3.6e+00  1.2e+01  1.0e+02
	v1.10.0    3.5e+00  1.1e+01  9.7e+01
	v1.9.0     3.2e+00  8.8e+00  7.2e+01
	v1.8.6     3.2e+00  8.9e+00  7.3e+01
	v1.8.5     3.1e+00  8.8e+00  7.3e+01
	v1.8.4     3.2e+00  8.8e+00  7.3e+01
	v1.8.3     3.1e+00  8.8e+00  7.3e+01
	v1.8.2     3.1e+00  8.8e+00  7.3e+01
	v1.8.1     3.1e+00  8.8e+00  7.3e+01
	v1.8.0     3.2e+00  8.9e+00  7.2e+01
	v1.7.4     3.0e+00  8.8e+00  7.3e+01
	v1.7.3     3.0e+00  8.8e+00  7.3e+01
	v1.7.2     3.0e+00  8.8e+00  7.3e+01
	v1.7.1     3.0e+00  8.5e+00  7.3e+01

-----

<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/2-render.png" alt="Plot for task 'render' and complexity '2'">
</td>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/2-parse.png" alt="Plot for task 'parse' and complexity '2'">
</td>
</tr>
<tr>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/10-render.png" alt="Plot for task 'render' and complexity '10'">
</td>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/10-parse.png" alt="Plot for task 'parse' and complexity '10'">
</td>
</tr>
<tr>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/100-render.png" alt="Plot for task 'render' and complexity '100'">
</td>
<td>
<img src="/groue/GRMustacheBenchmark/raw/master/Plots/100-parse.png" alt="Plot for task 'parse' and complexity '100'">
</td>
</tr>
</table>

-----

This README.md file has been generated with the `make` command.

