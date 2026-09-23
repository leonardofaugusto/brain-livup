---
tipo: area
responsavel: 
saude: verde
atualizado: <% tp.date.now("YYYY-MM-DD") %>
---

# <% tp.file.title %>

## O que essa área garante

<!-- Responsabilidade contínua. Se tem data de término, é projeto, não área. -->

## Padrão de qualidade

<!-- Como se reconhece que a área está saudável. -->

## Projetos vinculados

```dataview
LIST
FROM "10-Projetos"
WHERE contains(area, this.file.link)
```

## Notas relacionadas
