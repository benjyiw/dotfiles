autocmd BufNewFile ~/vimwiki/diary/[0-9]*.md :silent 0r !echo "\# `date +'\%Y-\%m-\%d'`"
