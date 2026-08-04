# fmt

![](./screenshot.png)

A Kakoune plugin for `fmt`, which allows auto-reflow of typed text to a defined
width (via `:fmt-toggle-window`), and simple reflow (via `:fmt`).

To install, place

```bash
source /path/to/fmt.kak
map -docstring 'fmt'     global user <key> ': fmt<ret>'
map -docstring 'autofmt' global user <key> ': fmt-toggle-window<ret>'
```

in Kakoune's configuration.
