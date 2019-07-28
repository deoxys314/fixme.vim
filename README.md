# vim-fixme

Vim plugin to find strings in your code (or text).

## Installation

Install using your preferred Vim package manager. The author recommends
[vim-plug][1].

```vim
Plug 'deoxys314/vim-fixme'
```

## Quickstart

While users are encouraged to see the documentation (see [documentation][2]
below), vim-fixme provides one command `:FindFixmes`, which is mapped to
`<leader>f`. Using the default settings, this will search the current buffer.
(N.B.: Running this on a buffer not attached to a file can have unexpected
results.)

## Documentation

### Settings

The most commonly used settings are below.

```vim
  g:fixme_sigils
```

This is a list of strings, which will be the target of the search vim-fixme
runs. By default it contains common code comments: `['TODO', 'FIXME', 'HACK',
'XXX']`. This can be changed, of course, to any arbitrary list of strings you
wish to search for.

```vim
  g:fixme_openwindow
```

If this is set to a falsy value, then the quickfix window will not be opened
after a search completes.

Comprehensive documentation is included in the plugin. See `:help fixme` for
more.

[1]: https://github.com/junegunn/vim-plug
[2]: #documentation
