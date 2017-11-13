# From web to pdf

## USAGE

```
./fromwebtopdf.sh --input [list] [options]
```

## LIST

The list is a file containing entries with the source url and the target pdf name.
Example:

```
https://fr.wikipedia.org/wiki/Paris paris.pdf
https://fr.wikipedia.org/wiki/France france.pdf
```

## OPTIONS

### Clean

`-c` or `--clean` : delete log and fail files.

### Rebuild

`-r` or `--rebuild` : do not use cache for the container build.

### Input

`-i` or `--input` : specify the list to take input from.

### Log

`-l` or `--log` : log the activity of the container build and the pdf generation.

### Help

`-h` or `--help` : display this help.

## Example

```
./fromwebtopdf.sh --input ./list.txt --clean --rebuild --log
```