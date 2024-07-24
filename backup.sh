#!/bin/bash

# Validação do programa

if [[ -z $1 ]]; then
	printf "Uso: backup.sh OPÇÃO\n"
	printf "OPÇÃO:\n"
	printf "\t-p: Salva na pasta 'pessoal'\n"
	printf "\t-t: Salva na pasta 'trabalho'\n"
	exit 0
fi

# Configura a pasta de backup
case $1 in
	-p)
		dest=pessoal
		;;
	-t)
		dest=trabalho
		;;
esac		

# Copia os arquivos para a pasta de backup associada
echo "==> Copiando arquivos"
rsync --files-from=backup-list.txt --recursive --ignore-missing-args $HOME $dest

# Envia as modificações para o repositório
if [ -n "$(git status --porcelain)" ]; then 
	echo "==> Enviado modificações para o repositório"
	git add -A
	git commit -m "Modificações"
	git push origin main
else 
	echo "==> Nenhuma modificação para enviar ao repositório"
fi

echo "==> Concluído!"