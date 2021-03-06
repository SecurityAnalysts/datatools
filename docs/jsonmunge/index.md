
# USAGE

	jsonmunge [OPTIONS] TEMPLATE_FILENAME

## DESCRIPTION


jsonmunge is a command line tool that takes a JSON document and
one or more Go templates rendering the results. Useful for
reshaping a JSON document, transforming into a new format,
or filter for specific content.

+ TEMPLATE_FILENAME is the name of a Go text tempate file used to render
  the outbound JSON document


## OPTIONS

Below are a set of options available.

```
    -E, -expression      use template expression as template
    -examples            display example(s)
    -generate-manpage    generate man page
    -generate-markdown   generate markdown documentation
    -h, -help            display help
    -i, -input           input filename
    -l, -license         display license
    -nl, -newline        if true add a trailing newline
    -o, -output          output filename
    -quiet               suppress error messages
    -v, -version         display version
```


## EXAMPLES


If person.json contained

   {"name": "Doe, Jane", "email":"jd@example.org", "age": 42}

and the template, name.tmpl, contained

   {{- .name -}}

Getting just the name could be done with

    cat person.json | jsonmunge name.tmpl

This would yield

    "Doe, Jane"


jsonmunge v0.0.25
