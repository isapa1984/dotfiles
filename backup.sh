#!/bin/bash

arquivos=(	
	.bash_aliases
	.bash_profile
	.bashrc	
	.gitconfig
	.config/starship.toml
	.zshrc
)

echo "Copiando arquivos"
for arquivo in "${arquivos[@]}"; do	
	
	if [[ -n $1 ]] && [[ $1 -eq "-t" ]] then
		rsync -u $HOME/$arquivo trabalho/
	else
		rsync -u $HOME/$arquivo pessoal/
	fi
	
done

if [ -n "$(git status --porcelain)" ]; then 
	echo "Atualizando no GIT"
	git add .
	git commit -m "Backup"
	git push origin main
else 
	echo "Nada para atualizar no GIT"
fi



