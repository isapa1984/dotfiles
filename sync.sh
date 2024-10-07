#!/bin/bash

# Copia os itens que são comuns a todos os ambientes, excluindo arquivos específicos do ambiente escolhido
echo "==> Atualizando arquivos comuns"
rsync -r --ignore-missing-args --files-from=comuns/itens.txt comuns/ $HOME