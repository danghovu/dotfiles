#cp $HOME/.config/kitty/{kitty.conf,theme.conf} .
#cp $HOME/.config/karabiner/karabiner.json .
#cp $HOME/.config/nvim/{coc-settings.json,init.vim} .
#cp $HOME/{.vimrc,.zshrc,.gitconfig,.kubectl_aliases,.bash_aliases} .

files=("$HOME/.config/nvim/{coc-settings.json,init.vim}")
for f in "${files[@]}"
do
    echo $f
  omit_flag=false
  while read -r line; do
    if [ "$line" == \"OMIT_START ]; 
    then
      omit_flag=true
      continue
    elif [ "$line" == \"OMIT_END ] && [ $omit_flag == true ] ; 
    then
      omit_flag=false
      continue
    elif [ $omit_flag == true ] ;
    then
      continue
    fi
    target="${f##*/}" 
    rm -f "$target"
    touch "$target"
    echo $line >> "$target"
  done < $f 
done
