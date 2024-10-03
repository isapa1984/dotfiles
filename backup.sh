#!/bin/bash

# Verifica se os parâmetros foram passados corretamente

if [[ -z $1 ]]; then
	echo "Uso: sync.sh AMBIENTE"
	exit 0
fi

PASTA_AMBIENTE=$1

# Verifica se a pasta do ambiente existe e se possui o arquivo itens.txt
if [[ ! -e "$PASTA_AMBIENTE/itens.txt" ]]; then
	echo "Pasta do ambiente e arquivo 'itens.txt' inexistente."
	exit 0
fi

# Copia os itens que são comuns a todos os ambientes, excluindo arquivos específicos do ambiente escolhido
echo "==> Copiando arquivos comuns"
rsync -r --ignore-missing-args --files-from=comuns/itens.txt --exclude-from=$PASTA_AMBIENTE/itens.txt $HOME comuns/

# Copia os arquivos para a pasta de backup do ambiente selecionada
echo "==> Copiando arquivos do ambiente '$PASTA_AMBIENTE'"
rsync -r --ignore-missing-args --files-from=$PASTA_AMBIENTE/itens.txt $HOME $PASTA_AMBIENTE

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