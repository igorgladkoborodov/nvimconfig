" Option+= and Option+- to change window size
map <A-≠> :vertical resize +10<CR>
map <A-–> :vertical resize -10<CR>

" Ctrl + hjkl to navigate between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Cmd+D for vertical split, Cmd+Shift+D for horizontal split
map <D-d> :vs<CR><C-w>l
map <D-S-d> :sp<CR><C-w>j

" Navigation on wrapped lines
nmap <silent> j gj
nmap <silent> k gk

" New tab on Cmd+t
map <D-t> :tabnew<CR>

" Double leader opens file in new tab
map <Leader><Leader> :tabe %<CR>

" Cmd+Shift+]/[ for next/previous tab
map <D-S-}> :tabn<CR>
map <D-S-{> :tabp<CR>
map <D-S-]> :tabn<CR>
map <D-S-[> :tabp<CR>

" Shit+Cmd+Ctrl+] to move tab left
" Shit+Cmd+Ctrl+[ to move tab right
map <C-S-D-{> :tabm -1<CR>
map <C-S-D-}> :tabm +1<CR>

" Toggle line numbers
map <D-l> :set number!<CR>

" Indent on < or >
vnoremap < <gv
vnoremap > >gv

" Copy current filename to clipboard by `i or \i
map `i :let @*=expand("%")<CR>
map <Leader>i :let @*=expand("%")<CR>

" Disable {visual}u lowercase. Always hit it by accident.
vmap u <Nop>

" `y moves last saved register to yank register 0
map `y :let @0=@"<CR>
" `p in paste yanked register
map `p "0p

" When you search current word, don't jump on the next one
nnoremap * *``
nnoremap # #``

" Reset current search with `/
map `/ :noh<CR>

" Folding
nnoremap <Space> za
