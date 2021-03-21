### BEFORE
sudo apt install silversearcher-ag neovim python3-pip npm
echo '### iniciou processo'
sudo curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo '### finalizou processo'

pip3 install flake8 isort pylint autopep8 pynvim jedi
npm install --global prettier

# rm -rf ~/.config/nvim/autoload
# mkdir ~/.config/nvim/autoload
# cd ~/.config/nvim/autoload
# wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
# unzip DroidSansMono.zip -d ~/.fonts
# fc-cache -fv

### AFTER
# :PlugInstall
## COMFORTABLE MOTION VIM (change)
# nnoremap <silent> <a-j> :call comfortable_motion#flick(100)<cr>
# nnoremap <silent> <a-k> :call comfortable_motion#flick(-100)<cr>
#
## BUFTABLINE + DEVICONS (change)
# replace all s:switch_buffer to buftabline#switch_buffer
# let tab.label = tab.path[tab.sep + 1:] . ' ' . WebDevIconsGetFileTypeSymbol(tab.path)
#
## VIMSPECTOR (run)
# :VimspectorInstall debugpy
# :VimspectorInstall debugger-for-chrome
#
## VIM VISUAL MULTI (comment)
# autoload/vm.vim
#     call s:V.Funcs.msg('Exited Visual-Multi.')
# autoload/vm/maps.vim
#     call s:V.Funcs.msg('VM has started with warnings. :VMDebug for more info')
# autoload/vm/funcs.vim
#     silent! noautocmd setlocal statusline=%!vm#themes#statusline()
#
# ALE (comment)
# execute 'echoerr ''The file was changed before fixing finished'''
