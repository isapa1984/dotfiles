#!/bin/bash

# Verifica se os parâmetros foram passados corretamente

if [[ -z $1 ]]; then
	echo "Uso: backup.sh AMBIENTE"
	exit 0
fi

ARQUIVO_LISTA_ITENS=itens.txt
PASTA_COMUNS=comuns
PASTA_AMBIENTE=$1

# Verifica se a pasta do ambiente existe e se possui o arquivo com a lista de itens para backup
if [[ ! -e "$PASTA_AMBIENTE/$ARQUIVO_LISTA_ITENS" ]]; then
	echo "Pasta do ambiente e arquivo '$ARQUIVO_LISTA_ITENS' inexistente."
fi

# Verifica se a pasta do ambiente existe e se possui o arquivo com a lista de itens para backup
if [[ ! -e "$PASTA_AMBIENTE/$ARQUIVO_LISTA_ITENS" ]]; then
	echo "Pasta do ambiente e arquivo '$ARQUIVO_LISTA_ITENS' inexistente."
	exit 0
fi

# Remove todos os arquivos, exceto o arquivo com a lista de itens para backup
# Serve para evitar a existência de arquivos que foram excluídos na pasta de origem
find $PASTA_COMUNS/ -mindepth 1 ! -name "$ARQUIVO_LISTA_ITENS" -exec rm -rf {} +

# Copia os itens que são comuns a todos os ambientes, excluindo arquivos específicos do ambiente escolhido
echo "==> Copiando arquivos comuns"
rsync -r --ignore-missing-args --files-from=$PASTA_COMUNS/$ARQUIVO_LISTA_ITENS --exclude-from=$PASTA_AMBIENTE/$ARQUIVO_LISTA_ITENS $HOME $PASTA_COMUNS/

# Remove todos os arquivos, exceto o arquivo com a lista de itens para backup
find $PASTA_AMBIENTE/ -mindepth 1 ! -name "$ARQUIVO_LISTA_ITENS" -exec rm -rf {} +

# Copia os arquivos para a pasta de backup do ambiente selecionada
echo "==> Copiando arquivos do ambiente '$PASTA_AMBIENTE'"
rsync -r --ignore-missing-args --files-from=$PASTA_AMBIENTE/$ARQUIVO_LISTA_ITENS $HOME $PASTA_AMBIENTE

# Envia as modificações para o repositório
if [ -n "$(git status --porcelain)" ]; then
	echo "==> Enviado modificações para o repositório"
	git add -A
	git commit -m "Backup"
	git push origin main
else
	echo "==> Nenhuma modificação para enviar ao repositório"
fi

echo "==> Concluído!"