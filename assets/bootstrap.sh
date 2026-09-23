#!/usr/bin/env bash
# Cria o esqueleto de um Livup Brain pessoal, no padrão da skill brain-livup.
# Equivalente do bootstrap.ps1 para macOS e Linux.
#
# Uso: ./bootstrap.sh <destino> [minimo|padrao|completo]
#
# Faz só o mecânico: pastas, arquivos de sistema, templates e índices. Não inventa
# conteúdo, não sobrescreve arquivo que já existe. CLAUDE.md sai com os marcadores {{...}}
# por preencher, e Estado.md sai como modelo.

set -euo pipefail

ASSETS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DESTINO="${1:-}"
TAMANHO="${2:-padrao}"
HOJE="$(date +%Y-%m-%d)"
CRIADOS=0
PULADOS=0

if [ -z "$DESTINO" ]; then
  echo "uso: $0 <destino> [minimo|padrao|completo]" >&2
  exit 1
fi

case "$TAMANHO" in
  minimo|padrao|completo) ;;
  *) echo "tamanho inválido: $TAMANHO (use minimo, padrao ou completo)" >&2; exit 1 ;;
esac

copy_asset() {
  local origem="$1" destino="$2"
  if [ -e "$destino" ]; then PULADOS=$((PULADOS+1)); echo "  preservado: $destino"; return; fi
  mkdir -p "$(dirname "$destino")"
  sed "s/{{DATA}}/$HOJE/g" "$ASSETS/$origem" > "$destino"
  CRIADOS=$((CRIADOS+1))
}

new_indice() {
  local caminho="$1" titulo="$2" pasta="$3" tipo="$4"
  if [ -e "$caminho" ]; then PULADOS=$((PULADOS+1)); return; fi
  cat > "$caminho" <<EOF
---
tipo: sistema
atualizado: $HOJE
---

# $titulo

Índice gerado por consulta. Nenhuma lista aqui é mantida à mão. Sem o plugin dataview, o bloco abaixo aparece como código e o índice vira busca que o agente roda na hora.

\`\`\`dataview
TABLE atualizado
FROM "$pasta"
WHERE tipo = "$tipo"
SORT atualizado DESC
\`\`\`
EOF
  CRIADOS=$((CRIADOS+1))
}

PASTAS=(00-Inbox 00-Sistema 00-Sistema/Log 00-Sistema/Bruto 40-Notas)
if [ "$TAMANHO" != "minimo" ]; then
  PASTAS+=(00-Diario 00-Diario/Reunioes 10-Projetos 30-Pessoas 00-Sistema/Decisoes 00-Sistema/Templates 90-Arquivo)
fi
if [ "$TAMANHO" = "completo" ]; then
  PASTAS+=(20-Areas 50-Skills)
fi

mkdir -p "$DESTINO"
for p in "${PASTAS[@]}"; do mkdir -p "$DESTINO/$p"; done

copy_asset "CLAUDE-modelo.md"  "$DESTINO/CLAUDE.md"
copy_asset "Painel.md"         "$DESTINO/Painel.md"
copy_asset "Como-usar.md"      "$DESTINO/00-Inbox/Como-usar.md"
copy_asset "Estado-inicial.md" "$DESTINO/00-Sistema/Estado.md"

if [ "$TAMANHO" != "minimo" ]; then
  copy_asset "Protocolo-de-Notas.md" "$DESTINO/00-Sistema/Protocolo-de-Notas.md"
  copy_asset "Fontes.md"             "$DESTINO/00-Sistema/Fontes.md"
  for t in "$ASSETS"/templates/*.md; do
    copy_asset "templates/$(basename "$t")" "$DESTINO/00-Sistema/Templates/$(basename "$t")"
  done
fi

new_indice "$DESTINO/40-Notas/Notas.md" "Notas" "40-Notas" "nota"
if [ "$TAMANHO" != "minimo" ]; then
  new_indice "$DESTINO/10-Projetos/Projetos.md" "Projetos" "10-Projetos" "projeto"
  new_indice "$DESTINO/30-Pessoas/Pessoas.md"   "Pessoas"  "30-Pessoas" "pessoa"
fi
if [ "$TAMANHO" = "completo" ]; then
  new_indice "$DESTINO/20-Areas/Areas.md" "Áreas" "20-Areas" "area"
fi

LOG="$DESTINO/00-Sistema/Log/Log-$HOJE.md"
if [ ! -e "$LOG" ]; then
  cat > "$LOG" <<EOF
---
tipo: log
data: $HOJE
---

# Log $HOJE

Append-only. Entrada nova nunca edita entrada antiga.

## Montagem do vault

**O que aconteceu.** Esqueleto criado pelo bootstrap da skill brain-livup, tamanho $TAMANHO.

**O que foi decidido.** (preencher na sessão: onde o vault mora, tomador de notas escolhido, pessoas puxadas do organograma, o que ficou fora)

**O que ficou aberto.** (preencher: marcadores do CLAUDE.md ainda por responder)
EOF
  CRIADOS=$((CRIADOS+1))
fi

echo
echo "Vault criado em: $DESTINO  (tamanho: $TAMANHO)"
echo "Arquivos criados: $CRIADOS   preservados: $PULADOS"
echo
echo "Falta o que só a conversa resolve:"
echo "  1. Preencher os marcadores {{...}} do CLAUDE.md com as respostas da entrevista."
echo "  2. Reescrever 00-Sistema/Estado.md com a foto real do dia."
echo "  3. Abrir a pasta no Obsidian como vault e conferir o Painel."
echo "  4. Processar a primeira captura real, de ponta a ponta, com o dono junto."
echo
