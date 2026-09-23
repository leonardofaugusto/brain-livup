# Plugins do Obsidian

Todos opcionais. O vault é markdown em pasta: ele funciona no Obsidian pelado, funciona em qualquer editor de texto e funciona para o agente sem plugin nenhum. Cada plugin compra conforto e cobra um preço, e o preço está escrito em cada linha abaixo.

Regra que atravessa todas as camadas: **nenhum índice é mantido à mão**. Com `dataview`, o índice é consulta. Sem `dataview`, o índice é busca que o agente roda na hora. Lista escrita à mão apodrece na primeira semana e passa a mentir.

---

## Camada 0: só o que já vem no Obsidian

Nada a instalar. Ligar em Configurações, Plugins principais:

| Recurso | Para quê |
|---|---|
| Explorador de arquivos, busca global, alternador rápido | Navegação básica |
| Grafo e backlinks | Ver o que aponta para a nota aberta, que é como a regra do não órfão se verifica |
| Propriedades | Editar frontmatter sem abrir o YAML na mão |
| Notas diárias | Criar `00-Diario/AAAA-MM-DD.md` com um atalho |
| Modelos | Inserir esqueleto de nota sem plugin externo |
| Marcadores | Fixar `Painel.md` e `Estado.md` |

Configuração das notas diárias: formato `YYYY-MM-DD`, pasta `00-Diario`, e modelo apontando para `00-Sistema/Templates/Diario.md` quando o vault for tamanho Padrão ou maior.

Um vault inteiro em Camada 0 cumpre todos os contratos. A pessoa perde consulta viva no painel e ganha zero manutenção.

---

## Camada 1: os quatro recomendados pela Liv Up

Instalar os quatro na montagem do vault, pela loja da comunidade (Configurações, Plugins da comunidade, Procurar). É o conjunto que a rotina `/bom-dia` e o `Painel.md` pressupõem.

### `dataview`

Transforma o `Painel.md` em consulta viva: inbox pendente, diário sem processar, projetos por status, notas esperando validação, notas órfãs, tarefas abertas.

Preço: a consulta só renderiza dentro do Obsidian. Fora dele, quem abrir o arquivo vê o código. O agente que lê o `Painel.md` também vê o código, então ele precisa rodar a busca de verdade em vez de confiar no que está escrito ali.

Sem ele: o painel vira uma lista de perguntas em prosa, e o agente responde cada uma com busca na hora.

### `calendar`

Barra lateral com o mês, clique no dia abre ou cria o diário daquele dia. Resolve a navegação do diário, que é o arquivo mais acessado do vault depois do painel.

Preço: nenhum relevante.

### `templater`

Templates com data automática e título preenchido, que é o que faz o frontmatter nascer certo sem digitação. Os templates desta skill usam a sintaxe dele (`<% tp.date.now("YYYY-MM-DD") %>`).

Preço: o plugin executa código dentro do template. Manter apenas templates de origem conhecida e não colar template de internet sem ler.

Sem ele: os templates continuam servindo como esqueleto para copiar e colar, só que a data é digitada à mão. O plugin de modelos da Camada 0 também resolve boa parte, com sintaxe `{{date:YYYY-MM-DD}}`.

### `obsidian-tasks-plugin`

Dá sentido a `- [ ] tarefa 📅 2026-09-18`: consulta de tarefa por data, por projeto, por status, espalhada pelo vault mas visível num lugar só.

Preço: uma sintaxe a mais para aprender, e a tentação de virar gerenciador de tarefa completo. A regra do sistema continua valendo: tarefa nasce de decisão ou pedido explícito da pessoa, nunca de palpite do agente.

---

## Camada 2: conforto e visual

### `obsidian-excalidraw-plugin`

Diagrama desenhado dentro do vault, com o desenho salvo como markdown. Serve para fluxo de processo e arquitetura.

Preço: arquivo grande e difícil de ler fora do Obsidian. Diagrama é artefato visual de um projeto, não nota: mora em subpasta própria, com `fonte:` apontando para o projeto dono.

Sem ele: diagrama em Mermaid dentro da nota, que o Obsidian renderiza nativamente e o agente lê como texto. Para a maior parte dos casos, Mermaid basta.

### `obsidian-minimal-settings` com `obsidian-style-settings`

Tema e ajuste fino de tipografia e densidade. Conforto de leitura, zero efeito sobre conteúdo.

### `obsidian-icon-folder`

Ícone por pasta. Ajuda quem se perde na numeração, não muda nada do sistema.

### `table-editor-obsidian`

Edição de tabela em markdown sem contar pipe na mão.

---

## Camada 3 — integrações que trazem conteúdo para dentro

Só depois que a captura manual já virou hábito. Integração antes do hábito enche o vault de conteúdo que ninguém processa, e vault com cinquenta notas de reunião não lidas é pior que vault vazio.

### Sincronia de notas de reunião

Plugin que traz nota de reunião de ferramenta externa (Granola, por exemplo) para `00-Diario/Reunioes/`, com `tipo: reuniao`, participantes já como wikilink e `processado:` vazio.

Preço: o conteúdo é resumo gerado por máquina, sujeito a erro de transcrição em nome próprio e a atribuição de fala que o resumo não garante. Tratar como captura imutável, e confirmar com a pessoa antes de transformar qualquer frase do resumo em afirmação atribuída a alguém.

### Agenda

Sem plugin: o agente puxa a agenda do dia por conector e preenche a seção `## Agenda` do diário. Essa é a única exceção à imutabilidade do diário, e vale porque agenda é fato de fonte externa.

---

## Ordem de instalação recomendada

Na montagem: Camada 0 ligada e os quatro da Camada 1 instalados, porque o Painel e a rotina `/bom-dia` usam os quatro. Camada 2 só se a pessoa pedir. A sincronia de reunião vem pela rotina `/bom-dia` (ver `tomadores-de-notas.md`), sem plugin.

Plugin instalado e não usado é peso morto que quebra na próxima atualização. Fora os quatro recomendados, se em um mês a pessoa não sentiu falta, não instale.
