---
name: bom-dia
description: |
  Rotina diária do Brain-Livup. Use quando o dono pedir /bom-dia, "bom dia", "processa minhas
  reuniões", "como está meu dia" ou equivalente, com o Claude Code aberto na pasta do vault.
  Busca as reuniões novas no tomador de notas (Granola ou Gemini), cria o diário do dia com a
  agenda, processa diário, reuniões e inbox pelo Protocolo de Notas, e devolve um resumo curto
  com agenda, to-dos e o que precisa da decisão do dono. Disparo manual.
metadata:
  origem: "skill brain-livup, assets/skills/bom-dia"
  versao: "2026-09-23"
---

# Bom dia

Rotina de começo de dia, sempre nesta ordem. As regras do `CLAUDE.md` do vault e do `00-Sistema/Protocolo-de-Notas.md` mandam; esta skill só define a sequência e o formato da resposta. Em conflito, o protocolo vence.

## Regras que valem em todos os passos

- Diário, notas de reunião e `00-Sistema/Bruto/` são imutáveis. A única edição permitida é `processado:` no frontmatter. Exceção única: criar o diário do dia e preencher `## Agenda` com dados do calendário, antes de o dono escrever.
- Sem agenda vinda do calendário, não inventar reunião.
- E-mail e Drive são só leitura. Nunca responder, encaminhar, mover ou apagar.
- Tarefa (`- [ ]`) só nasce de decisão ou pedido explícito do dono. Inferência do agente vira texto com `💭`.
- Afirmação nova extraída de captura entra como proposta, com `confirmado: false`. Confirmar é ato do dono.

## Passos

### 1. Abrir a sessão

Ler `00-Sistema/Estado.md`, o log de hoje (se existir) e o último log anterior. Ler no `CLAUDE.md` qual tomador de notas o dono usa.

### 2. Trazer as reuniões novas

Seguir `~/.claude/skills/brain-livup/references/tomadores-de-notas.md` para a ferramenta do dono. Buscar as reuniões desde a data da última nota em `00-Diario/Reunioes/` e gravar uma nota por reunião, copiando o conteúdo sem resumir, com `processado:` vazio. Reunião que já tem nota com o mesmo `fonte:` é pulada.

Se o conector não responder, avisar no resumo e seguir com o resto.

### 3. Criar o diário do dia

Se o conector do Google Calendar estiver ligado, puxar os eventos de hoje (fuso America/Sao_Paulo) e criar `00-Diario/AAAA-MM-DD.md` a partir de `00-Sistema/Templates/Diario.md`, com um bloco por reunião: horário, título, pessoas como wikilink para `30-Pessoas/` quando a nota existir, e link do Meet. Se o diário já existir com texto do dono, não tocar no que ele escreveu.

### 4. Processar o que está pendente

Tudo que tem `processado:` vazio em `00-Diario/` e `00-Diario/Reunioes/`, mais qualquer arquivo em `00-Inbox/` além do `Como-usar.md`. Ler o `Protocolo-de-Notas.md` antes. Para cada captura: ler inteira, buscar no vault antes de criar, atualizar nota existente em vez de duplicar, escrever com `fonte:`, linkar nos dois sentidos, e marcar `processado: <hoje>`. Da inbox, mover o bruto para `00-Sistema/Bruto/AAAA-MM-DD-slug.md` sem alterar uma palavra.

Pessoa que aparece numa reunião e não tem nota: criar só se o nome vier com contexto suficiente para saber quem é. Nome ambíguo ou mal transcrito vira pergunta no resumo, nunca nota nova.

### 5. Preparar as reuniões do dia

Para cada reunião da agenda, uma linha: o que ficou aberto na última vez que o vault registrou aquela pessoa ou assunto, e a pergunta que a reunião deveria fechar. Sem histórico no vault, dizer que é a primeira vez e não inventar pauta.

### 6. Fechar

Append no log do dia (o que foi processado, criado, o que ficou aberto), sobrescrever `Estado.md` com a foto nova, atualizar `atualizado:` das notas tocadas.

### 7. Responder no chat

Curto, nesta ordem:

1. Uma linha com o que foi processado.
2. **Agenda de hoje:** hora, reunião e a linha de preparação.
3. **Seus to-dos:** do mais urgente para o menos, separando o que é do dono do que espera outra pessoa.
4. **Para você decidir:** só contradição real encontrada no processamento, proposta esperando confirmação e nome que o agente não conseguiu resolver. Se não houver, omitir a seção.
