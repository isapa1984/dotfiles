#!/bin/bash

# Validação do programa

if [[ -z $1 ]]; then
	printf "Uso: backup.sh OPÇÃO\n"
	printf "OPÇÃO:\n"
	printf "\t-p: Salva na pasta 'pessoal'\n"
	printf "\t-t: Salva na pasta 'trabalho'\n"
	exit 0
fi

# Copia dos arquivos para as pastas de backup

echo "Copiando itens"

case $1 in
	-p)
		dest=pessoal
		;;
	-t)
		dest=trabalho
		;;
esac		

rsync --files-from=backup-list.txt --recursive --ignore-missing-args $HOME $dest

# Push para o repositório

if [ -n "$(git status --porcelain)" ]; then 
	echo "Atualizando no GIT"
	git add .
	git commit -m "Backup"
	git push origin main
else 
	echo "Nada para atualizar no GIT"
fi
