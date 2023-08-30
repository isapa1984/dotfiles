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
	rsync -u $HOME/$arquivo .
done

if [ -n "$(git status --porcelain)" ]; then 
	echo "Atualizando no GIT"
	git add .
	git commit -m "Backup"
	git push origin main
else 
	echo "Nada para atualizar no GIT"
fi



