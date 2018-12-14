# Felipe's search for vim

This plugin wraps [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim) to make it a bit nicer to use.
It exposes two commands:
  * `:Search some-search-term` to search for some term, select results with fzf and show a preview
  * `:FindUnderCursor` to search for the term under the cursor


I have mapped my leader key and `s` to `FindUnderCursor` to make it quick and easy to search for terms.

```vim
nmap <silent> <Leader>s :execute 'FindUnderCursor'<CR>
```

To make the search blazing fast, I also suggest using `ripgrep` with `fzf`. 
It can be enabled by default for `fzf` if you set the following environment variables in your shell:

```bash
export FZF_DEFAULT_COMMAND="rg --files"
```

Here is what it looks like (some colors in vim went missing though...):

[![Search plugin in vim](https://asciinema.org/a/JBepEOiwov6fHSYxL8Rsv5sLN.png)](https://asciinema.org/a/JBepEOiwov6fHSYxL8Rsv5sLN)
