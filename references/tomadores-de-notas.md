# Tomadores de notas: Granola ou Gemini

A pessoa escolhe um. A escolha vai escrita no `CLAUDE.md` do vault (seção de memória, camada 0), porque é ela que diz à rotina `/bom-dia` onde buscar as reuniões.

Nas duas opções o destino é o mesmo: uma nota por reunião em `00-Diario/Reunioes/AAAA-MM-DD Título.md`, com `tipo: reuniao`. Essa nota é registro de máquina. O agente cria a nota uma vez, copiando o conteúdo da ferramenta sem resumir nem reescrever, e depois disso não edita mais: só preenche `processado:` quando destila o conteúdo em notas, projetos e tarefas.

## Frontmatter da nota de reunião

```yaml
---
tipo: reuniao
origem: granola            # granola | gemini
fonte: "<link da nota no Granola ou do Google Doc do Gemini>"
title: "<título da reunião>"
date: AAAA-MM-DD
attendees:
  - "[[Nome como está em 30-Pessoas]]"
processado:
---
```

Participante que existe em `30-Pessoas/` entra como wikilink com o nome da nota. Participante que não existe entra com o nome como veio da ferramenta, entre colchetes duplos, sem criar a nota de pessoa na hora. Ela nasce quando o nome aparecer de novo com contexto.

## Opção 1: Granola

**Conectar.** Conferir que o conector do Granola está ligado no Claude da pessoa (Configurações, Conectores, no claude.ai; ou `/mcp` no Claude Code). Sem conector, a pessoa liga ali mesmo e faz login; o agente não faz login por ela.

**Conferir que está gravando.** Perguntar se o Granola abre sozinho nas reuniões do calendário. Se não, a pessoa ajusta no próprio Granola.

**Busca de teste.** Listar as reuniões dos últimos três dias pelo conector e mostrar os títulos para a pessoa. Se vier vazio, o problema está na gravação ou na conta conectada, não no vault.

**Como a rotina busca.** A cada `/bom-dia`, listar as reuniões desde a última nota existente em `00-Diario/Reunioes/`, pegar o resumo de cada uma e gravar a nota. Reunião que já tem nota (mesmo `fonte:`) é pulada.

**Alternativa por plugin.** Existe plugin de comunidade do Obsidian que sincroniza o Granola direto para a pasta. Serve para quem prefere que as notas apareçam sem rodar a rotina, com o custo de mais um plugin para manter. Se usar, apontar a pasta de destino para `00-Diario/Reunioes/` e a rotina passa a só processar.

## Opção 2: Gemini (anotações do Google Meet)

**Como o Gemini guarda.** Quando a pessoa ativa "Tomar notas com o Gemini" numa reunião do Meet, as anotações viram um Google Doc no Drive de quem organizou a reunião, e uma cópia do link chega por e-mail aos convidados da organização. Não existe plugin do Obsidian para isso: a busca é feita pelo agente.

**Conectar.** Conferir que o conector do Google Drive está ligado no Claude da pessoa. O conector do Gmail ajuda como segunda via, porque o e-mail das anotações chega mesmo quando o doc está no Drive de outra pessoa.

**Conferir que está gravando.** Perguntar se ela ativa as anotações do Gemini nas reuniões dela. Reunião organizada por outra pessoa só gera doc se o organizador ativar.

**Busca de teste.** Buscar no Drive os documentos de anotação do Gemini dos últimos três dias (o título costuma ter "Anotações" e o nome da reunião) e, se vier pouco, buscar no Gmail os e-mails de `gemini-notes@google.com` do mesmo período. Mostrar os títulos para a pessoa.

**Como a rotina busca.** A cada `/bom-dia`, buscar os docs e e-mails de anotação desde a última nota existente, ler o conteúdo do doc e gravar a nota com o link do doc em `fonte:`. Quando só houver o e-mail, gravar o que o e-mail traz e marcar `⚠️ doc completo não acessível`.

## Se a pessoa não usa nenhum

Recomendar um dos dois, sem forçar. O vault funciona com a pessoa colando texto de reunião na inbox. Registrar no `Estado.md` que não há tomador de notas conectado.
