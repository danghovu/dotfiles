#cp $HOME/.config/kitty/{kitty.conf,theme.conf} .
#cp $HOME/.config/karabiner/karabiner.json .
#cp $HOME/.config/nvim/{coc-settings.json,init.vim} .
#cp $HOME/{.vimrc,.zshrc,.gitconfig,.kubectl_aliases,.bash_aliases} .

files=("$HOME/.config/kitty/kitty.conf" "$HOME/.config/kitty/theme.conf" "$HOME/.config/karabiner/karabiner.json" "$HOME/.config/nvim/coc-settings.json" "$HOME/.config/nvim/init.vim" "$HOME/.vimrc" "$HOME/.zshrc" "$HOME/.gitconfig" "$HOME/.kubectl_aliases" "$HOME/.bash_aliases")
originalIFS="$IFS"
for f in "${files[@]}"
do
  target="${f##*/}" 
  echo "======**======"
  echo "Handling $target" 
  omit_flag=false
  rm -f "$target"
  touch "$target"
  while IFS= read -r line; do
    if [ "$line" == \"OMIT_START ] || [ "$line" == \#OMIT_START ]; 
    then
      omit_flag=true
      continue
    elif [[ "$line" == \"OMIT_END || "$line" == \#OMIT_END ]] && [ $omit_flag == true ] ; 
    then
      omit_flag=false
      continue
    elif [ $omit_flag == true ] ;
    then
      continue
    fi
    printf "%s\n" "$line" >> "$target"
  done < $f 
done
IFS="$originalIFS"
echo "DONE"



