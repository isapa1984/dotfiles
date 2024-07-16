#!/bin/bash

if [[ -z $1 ]]; then
	printf "Uso: backup.sh OPÇÃO\n"
	printf "OPÇÃO:\n"
	printf "\t-p: Salva na pasta 'pessoal'\n"
	printf "\t-t: Salva na pasta 'trabalho'\n"
	exit 0
fi

arquivos=(	
	.bash_aliases
	.bash_profile
	.bashrc	
	.gitconfig
	.config/starship.toml
	.zshrc
	.config/sway/*
	.config/waybar/*
	.config/wofi/*
	.config/fuzzel/*
)

echo "Copiando arquivos"
for arquivo in "${arquivos[@]}"; do	
	case $1 in
		-p)
			rsync -u $HOME/$arquivo pessoal
			;;
		-t)
			rsync -u $HOME/$arquivo trabalho
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