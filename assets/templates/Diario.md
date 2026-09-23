---
tipo: diario
data: {{date:YYYY-MM-DD}}
processado: 
---

# {{date:YYYY-MM-DD}}

## Agenda

<!-- Um bloco por reunião. O que dá poder ao briefing são os wikilinks: pessoa e projeto
     escritos como [[link]] fazem as consultas abaixo funcionarem sozinhas.
     Formato: apague este comentário e o exemplo. -->

### 09:00 · Nome da reunião
pessoas:: [[Nome da Pessoa]]
projeto:: [[nome-do-projeto]]
objetivo::

---

## Contexto puxado do vault

<!-- Consultas opcionais, dependem do plugin dataview. Rodam a partir dos links escritos
     na agenda acima. Apagar esta seção inteira se o vault não usa dataview. -->

### Tarefas abertas nas notas que o dia toca

```dataview
TASK
WHERE !completed AND any(this.file.outlinks, (l) => l.path = file.path)
```

### Última vez que falamos disso

```dataview
LIST
FROM "00-Sistema/Log" OR "00-Diario"
WHERE file.name != this.file.name
  AND any(file.outlinks, (l) => any(this.file.outlinks, (t) => t.path = l.path))
SORT file.name DESC
LIMIT 8
```

---

## Depois das reuniões

<!-- Escreva solto. Os títulos são muleta, não formulário: apague o que não usar.
     O agente nunca edita este arquivo. Ele lê, deriva nota e aponta a fonte de volta. -->

### O que aconteceu

### O que aprendi

### O que me incomodou

### Solto
