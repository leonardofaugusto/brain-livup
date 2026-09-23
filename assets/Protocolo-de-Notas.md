---
tipo: sistema
titulo: Protocolo de Notas
fonte: "skill brain-livup"
atualizado: {{DATA}}
---

# Protocolo de Notas

Mecânica de como a captura crua vira conhecimento organizado. O [[CLAUDE]] carrega as seis regras não negociáveis; este arquivo carrega o detalhe operacional. Ler antes de processar `00-Inbox/` ou de criar qualquer nota.

---

## 1. Divisão de trabalho

| Quem | Faz o quê |
|---|---|
| O dono | Captura. Escreve o dia em `00-Diario/` e despeja o pontual em `00-Inbox/`, em qualquer formato, sem cerimônia. Confirma ou rejeita as afirmações destiladas. |
| O agente | Classifica, escreve nota atômica, linka, extrai tarefa, arquiva o bruto, mantém `Estado.md` e log, aponta contradição. |

O ponto de atenção: destilar é onde o pensamento acontece. Se o agente destila tudo sozinho, o dono ganha um arquivo pesquisável e perde o raciocínio. Por isso **toda afirmação nova extraída de uma captura entra como proposta**, listada ao fim do processamento para ele confirmar, ajustar ou matar. Nota confirmada ganha `confirmado: true` no frontmatter.

---

## 2. Pipeline de processamento

| Entrada | O que é | Destino do original |
|---|---|---|
| `00-Diario/AAAA-MM-DD.md` | diário do dono | **fica onde está, para sempre.** Ganha só `processado: <data>` |
| `00-Diario/Reunioes/*` | nota de reunião gerada por máquina | **fica onde está, para sempre.** Ganha só `processado: <data>` |
| `00-Inbox/*` | despejo pontual | move para `00-Sistema/Bruto/AAAA-MM-DD-slug.md` |

Rodar quando o dono pedir. No início da sessão, avisar se houver arquivo na inbox ou diário com `processado` vazio.

1. **Ler o arquivo cru inteiro.** Sem pular, sem resumir antes de entender.
2. **Buscar antes de escrever.** Buscar os termos centrais em todo o vault, para descobrir se já existe nota sobre aquilo. Atualizar vence duplicar.
3. **Classificar cada pedaço da captura** pela árvore de decisão da seção 3. Uma captura vira várias coisas, o que é normal.
4. **Escrever.** Nota atômica em `40-Notas/`, atualização em `10-Projetos/`, `20-Areas/` ou `30-Pessoas/`, tarefa no formato do plugin Tasks, decisão de peso em `00-Sistema/Decisoes/`.
5. **Linkar nos dois sentidos.** A nota nova aponta para o contexto dela, e o projeto ou pessoa ganha link de volta.
6. **Fechar o original.** Da inbox, mover para `00-Sistema/Bruto/` sem editar conteúdo. Do diário, o arquivo não sai do lugar e a única alteração permitida é `processado: <data>`.
7. **Atualizar `Estado.md` e o log do dia.**
8. **Devolver ao dono** a lista do que foi criado, do que virou proposta a confirmar, e das contradições encontradas.

A `00-Inbox/` deve terminar a sessão vazia.

⚠️ **Nenhuma limpeza automática roda sobre `00-Sistema/Bruto/` ou `00-Diario/`.** Isso inclui script de formatação. A formatação estranha de uma captura é parte da captura: indentação irregular de nota telegráfica carrega hierarquia de pensamento que o texto não diz.

---

## 3. Onde cada coisa mora

Árvore de decisão, na ordem. A primeira que casar, ganha.

- É o registro do dia escrito pelo dono? → `00-Diario/` (ele escreve, o agente só lê)
- É nota de reunião gerada por ferramenta? → `00-Diario/Reunioes/`
- Tem começo, meio e fim, com resultado esperado? → `10-Projetos/`
- É responsabilidade contínua sem data de término? → `20-Areas/`
- É sobre uma pessoa (contexto, motivação, histórico)? → `30-Pessoas/`
- É uma afirmação sobre o mundo, que vale independente de projeto? → `40-Notas/`
- É escolha com custo de reversão alto ou consequência estrutural? → `00-Sistema/Decisoes/`
- É registro do que aconteceu num dia? → `00-Sistema/Log/`
- Encerrado, morto ou irrelevante? → `90-Arquivo/`

Se nada casar, **perguntar**. Não inventar pasta.

---

## 4. Nomes de arquivo

| Tipo | Padrão | Exemplo |
|---|---|---|
| Nota atômica | afirmação em kebab-case, sem data | `custo-de-frete-limita-expansao-para-o-norte.md` |
| Projeto | nome curto em kebab-case | `copiloto-de-compras.md` |
| Área | substantivo da responsabilidade | `Governanca de Dados.md` |
| Pessoa | nome como as pessoas a chamam | `Maria Silva.md` |
| Diário | `AAAA-MM-DD.md` | `2026-09-11.md` |
| Log | `Log-AAAA-MM-DD.md` | `Log-2026-09-11.md` |
| Bruto | `AAAA-MM-DD-slug.md` | `2026-09-11-reuniao-supply.md` |
| ADR | `ADR-NNN-slug.md` | `ADR-001-arquitetura-do-vault.md` |

Nota atômica não leva data no nome, porque o conteúdo dela deve ser atemporal. Log e bruto levam, porque o valor deles é serem de um momento.

---

## 5. Frontmatter por tipo

Obrigatório em toda nota nova. É o que faz as consultas funcionarem.

**Nota atômica** (`40-Notas/`)
```yaml
---
tipo: nota
fonte: "[[2026-09-11-reuniao-supply]]"
confianca: media       # alta | media | baixa
confirmado: false      # true depois que o dono valida a afirmação
tags: []
criado: 2026-09-11
atualizado: 2026-09-11
---
```

**Projeto** (`10-Projetos/`)
```yaml
---
tipo: projeto
status: ativo          # ideia | ativo | pausado | concluido | morto
tese: "uma frase: por que isso vale a pena agora"
metrica: "como sabemos que funcionou, com número"
horizonte: 2026-Q4
stakeholders: []
atualizado: 2026-09-11
---
```

**Área** (`20-Areas/`)
```yaml
---
tipo: area
responsavel:
saude: verde           # verde | amarelo | vermelho
atualizado: 2026-09-11
---
```

**Pessoa** (`30-Pessoas/`)
```yaml
---
tipo: pessoa
aliases: []
papel:
relacao: par           # sponsor | par | liderado | parceiro | externo
atualizado: 2026-09-11
---
```

**Apelido é obrigatório em nota de pessoa.** O dono escreve pelo apelido, e sem `aliases:` cada captura vira ou pergunta repetida ou pessoa duplicada.

⚠️ **Nome curto que é homônimo dentro da empresa não entra como alias.** Captura que use só aquele primeiro nome vira pergunta, nunca dedução.

Regra de conteúdo em `30-Pessoas/`: contexto profissional, prioridade declarada e histórico de interação. Não registrar juízo sobre caráter, avaliação de desempenho de terceiro, nem informação pessoal sensível. Este vault pode ir para o git.

---

## 6. Convenções dentro do texto

| Marca | Significa |
|---|---|
| `> texto` | palavra literal do dono ou de terceiro, com atribuição |
| texto normal | síntese do agente a partir do bruto |
| `💭 minha leitura:` | opinião ou inferência do agente, explicitamente marcada |
| `⚠️ a confirmar:` | lacuna, número sem fonte, suposição pendente |
| `❗ contradição:` | conflito entre esta captura e algo que já está no vault |
| `- [ ] tarefa 📅 2026-09-18` | tarefa no formato do plugin Tasks |

A distinção entre as três primeiras é a mais importante do sistema. Sem ela, palpite do agente entra como fato do dono.

**Tarefa nasce de decisão ou pedido explícito do dono**, dito na sessão ou registrado numa captura. Se o agente acha que algo devia ser feito, vira `💭 minha leitura: valeria...` em prosa, nunca checkbox, até ele confirmar. Tarefa mora onde o contexto dela mora: projeto, se for de projeto; pessoa, se for sobre ela; `Estado.md` só para o que não tem dono óbvio.

---

## 7. Manutenção

Rodar quando o dono pedir revisão, ou a cada duas semanas de uso.

- Órfãos: nota sem link de entrada.
- Links mortos: wikilink para nota que nunca foi criada e já não faz sentido criar.
- Frontmatter faltando ou malformado.
- Projeto sem atualização há mais de 30 dias, ainda marcado `ativo`.
- Notas com `confirmado: false` há mais de 14 dias.
- Quase-duplicatas: duas notas afirmando a mesma coisa.
- Inbox com resíduo.

Entregar como lista de problema com correção proposta, e aplicar só depois do aval.

---

## 8. Modos de falha conhecidos

| Falha | Regra |
|---|---|
| Inflar o escopo de uma fonte interna | Documento diz o que o autor dele afirma, no escopo dele. Atribuir ao documento e perguntar antes de generalizar |
| Estrutura esperta demais, agente adivinha onde salvar | Caminho previsível vence taxonomia bonita. Sem pasta nova sem decisão explícita |
| Agente reescreve a captura humana | Bruto imutável, síntese ao lado |
| Duplicatas acumulando | Buscar antes de criar, sempre |
| Notas órfãs | Link de entrada obrigatório |
| Afirmação sem rastro de origem | `fonte:` obrigatório; recusa fundamentada vence citação inventada |
| Regras longas demais, agente ignora | `CLAUDE.md` curto com o essencial, detalhe aqui |
| Credencial em markdown | Nunca. Segredo vai para gerenciador de segredos |
| Merge silencioso sobre nota já alterada | Conflito para e vira pergunta |
| Vault vira arquivo morto pesquisável | Destilação entra como proposta, o dono confirma |
