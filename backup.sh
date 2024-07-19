#!/bin/bash

if [[ -z $1 ]]; then
	printf "Uso: backup.sh OPÇÃO\n"
	printf "OPÇÃO:\n"
	printf "\t-p: Salva na pasta 'pessoal'\n"
	printf "\t-t: Salva na pasta 'trabalho'\n"
	exit 0
fi

itens=(	
	.bash_aliases
	.bash_profile
	.bashrc	
	.config/foot/
	.config/fuzzel/
	.config/starship.toml
	.config/sway/
	.config/swaync/
	.config/waybar/
	.config/wlogout/
	.gitconfig
	.profile
	.zshrc
)

echo "Copiando itens"
for item in "${itens[@]}"; do	
	case $1 in
		-p)
			rsync -aR $HOME/./$item pessoal
			;;
		-t)
			rsync -aR $HOME/./$item trabalho
			;;
	esac
done

if [ -n "$(git status --porcelain)" ]; then 
	echo "Atualizando no GIT"
	git add .
	git commit -m "Backup"
	git push origin main
else 
	echo "Nada para atualizar no GIT"
fi
