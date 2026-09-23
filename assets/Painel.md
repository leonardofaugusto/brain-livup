---
tipo: sistema
atualizado: {{DATA}}
---

# Painel

Ponto de entrada do vault. Tudo aqui é consulta viva, nenhuma lista é mantida à mão.

As consultas abaixo dependem do plugin `dataview`. Sem ele, o Obsidian mostra o código em vez do resultado, e cada bloco vira uma pergunta que o agente responde com busca na hora. Apagar os blocos que não interessam e manter os que a pessoa realmente olha.

## Mapa do sistema

- **Índices:** [[Projetos]] · [[Areas]] · [[Pessoas]] · [[Notas]] · [[Diarios]]
- **Sistema:** [[Estado]] (onde estamos) · [[CLAUDE]] (regras) · [[Protocolo-de-Notas]] (mecânica) · [[Fontes]] (origem das afirmações) · [[Como-usar]] (como despejar na inbox)

## Inbox pendente

```dataview
LIST
FROM "00-Inbox"
WHERE file.name != "Como-usar"
SORT file.ctime ASC
```

## Diário sem processar

```dataview
LIST
FROM "00-Diario"
WHERE tipo = "diario" AND !processado
SORT file.name DESC
```

## Projetos

```dataview
TABLE status, tese, atualizado
FROM "10-Projetos"
WHERE tipo = "projeto"
SORT status ASC, atualizado DESC
```

## Projetos ativos sem atualização há mais de 30 dias

```dataview
TABLE atualizado
FROM "10-Projetos"
WHERE tipo = "projeto" AND status = "ativo" AND (date(today) - atualizado) > dur(30 days)
SORT atualizado ASC
```

## Afirmações esperando validação

```dataview
TABLE fonte, confianca, criado
FROM "40-Notas"
WHERE tipo = "nota" AND confirmado = false
SORT criado ASC
```

## Notas órfãs

```dataview
LIST
FROM "40-Notas"
WHERE length(file.inlinks) = 0 AND file.name != "Notas"
```

## Tarefas abertas

```dataview
TASK
FROM -"00-Sistema/Templates"
WHERE !completed
GROUP BY file.link
```

## Últimos logs de sessão

```dataview
LIST
FROM "00-Sistema/Log"
SORT file.name DESC
LIMIT 7
```

## Decisões registradas

```dataview
TABLE status, data
FROM "00-Sistema/Decisoes"
WHERE tipo = "adr"
SORT numero DESC
```
