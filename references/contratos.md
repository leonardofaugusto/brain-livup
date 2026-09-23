# Contratos do Livup Brain

O que viaja de um vault para outro. Tudo nesta página vale para qualquer dono, em qualquer área, em qualquer tamanho de vault. A última seção separa o que é negociável.

---

## 1. Camadas de memória

Memória não é um arquivo. Um arquivo único de histórico cresce até ninguém conseguir lê-lo, nem pessoa nem agente, e aí para de ser memória e vira arquivo morto. Por isso o sistema tem camadas com funções diferentes, e cada uma tem uma regra de escrita própria.

### Camada 0 — captura, na voz de quem capturou

Dois lugares, mesma natureza.

`00-Diario/AAAA-MM-DD.md` é o registro do dia, escrito pelo dono. Fica onde está para sempre. **O agente nunca edita arquivo do diário.** Ele lê, deriva nota, aponta `fonte:` de volta e preenche `processado: <data>` no frontmatter. Só isso.

`00-Inbox/` é despejo pontual: texto colado, transcrição, print, link, ideia de três palavras. Sem formato, sem frontmatter, em qualquer horário. Processar significa ler, classificar, virar nota atômica, linkar, extrair tarefa, e mover o arquivo cru para `00-Sistema/Bruto/` sem alterar uma palavra. A inbox termina cada sessão vazia. O diário nunca sai do lugar.

Quando existir sincronia de notas de reunião (Granola ou equivalente), elas entram em `00-Diario/Reunioes/` com `tipo: reuniao` e seguem a mesma regra: registro de máquina, imutável, o agente só preenche `processado:`.

**A obrigação de organizar é do agente, não do dono.** Se a captura exigir esforço, o dono para de capturar.

Uma exceção única à imutabilidade: o agente pode criar o arquivo do dia e preencher a seção `## Agenda` com dados vindos de fonte externa verificável, como o calendário, antes do dono escrever qualquer coisa. Agenda é fato de fonte externa, não paráfrase da palavra dele. A partir do momento em que o dono escreve no arquivo, volta a valer a regra dura.

### Camada 1 — `00-Sistema/Estado.md`, o snapshot vivo

Uma página, **sempre sobrescrita**, nunca acumulada. É o primeiro arquivo que o agente lê em toda sessão. Contém o mapa entre frentes: quais estão ativas, prioridade da semana, o que mudou desde a última sessão. Não contém o detalhe de cada uma, e não contém histórico.

Em vault Completo, cada projeto ativo carrega também um `estado.md` próprio (`tipo: estado-projeto`), mesma lógica de sobrescrita, escopo restrito àquele projeto. O agente lê o `estado.md` do projeto que a sessão vai tocar, além do `Estado.md` global, e reescreve os dois quando mexer no projeto.

### Camada 2 — `00-Sistema/Log/Log-AAAA-MM-DD.md`, append-only

Um arquivo por dia. Registro do que foi conversado, decidido e mudado, **incluindo as divergências do agente que o dono rejeitou**. Nunca reescrito, nunca apagado. É a trilha de auditoria: daqui a seis meses, é aqui que se descobre por que algo foi feito.

### Camada 3 — a verdade durável

Projeto em `10-Projetos/`, área em `20-Areas/`, pessoa em `30-Pessoas/`, conhecimento em `40-Notas/`, decisão de peso em `00-Sistema/Decisoes/`. Cada nota de projeto tem frontmatter (`status`, `tese`, `metrica`, `atualizado`) e uma seção de histórico de decisões em ordem cronológica inversa.

### Camada 3b — projeto que virou código mora fora do vault

Quando uma frente ganha repositório, o vault guarda por quê, para quem, decisão de negócio, stakeholder e valor. O repositório guarda como e onde está: estado técnico, sprint, log de desenvolvimento, decisão de arquitetura. **O agente não copia estado técnico para o vault.** Número de sprint, contagem de teste e status de build são consultados no repositório na hora de responder, porque cópia diverge em silêncio e ninguém atualiza a do vault.

Cada lado abre com um ponteiro para o outro. Antes de afirmar o que avançou num projeto com código, o agente lê os dois.

---

## 2. As seis regras de nota

Violar qualquer uma corrompe o sistema.

1. **Não reescreva a palavra do dono.** A captura dele é dado primário e imutável. A síntese do agente mora ao lado, nunca por cima. Citação literal vai em blockquote.
2. **Separe o que ele disse do que o agente inferiu.** `>` para palavra dele, texto normal para síntese, `💭` para opinião do agente, `⚠️` para lacuna a confirmar. Sem isso, palpite entra como fato e em seis meses ninguém distingue.
3. **Buscar antes de criar.** Toda nota nova exige busca prévia por nota existente sobre o tema. Atualizar nota existente vence criar quase-duplicata. Duplicata é o modo de falha número um.
4. **Uma ideia por nota, autossuficiente.** A nota tem que fazer sentido lida isolada daqui a dois anos. Título é afirmação, não tema: `Prazo de fornecedor limita a velocidade de lançamento de produto`, e não `Fornecedores`.
5. **Proveniência sempre.** Toda nota carrega `fonte:` no frontmatter, apontando para o bruto, a URL ou a pessoa, com data. Afirmação sem fonte é opinião e vai marcada como tal. Recusa fundamentada vence citação inventada.
6. **Nada de órfão em `40-Notas/`.** Nota de conhecimento precisa de ao menos um wikilink de entrada vindo de projeto, área ou pessoa. Link gerado por consulta não conta, porque não é link real. Notas de sistema e de índice estão isentas, desde que alcançáveis pelo painel. Diário e bruto estão isentos por natureza.

---

## 3. Protocolo de sessão

**No início de toda sessão**, antes de responder qualquer coisa de substância:

1. Ler `00-Sistema/Estado.md`.
2. Ler o log de hoje, se existir, e o último log anterior.
3. Verificar se `00-Inbox/` tem coisa não processada. Se tiver, avisar antes de começar outro assunto.
4. Ler as notas de projeto relevantes ao que o dono trouxe, incluindo o `estado.md` daquele projeto, antes de qualquer nota de detalhe.

**Durante a sessão**, ao fechar uma decisão: escrever na hora, não no fim. Decisão não registrada é decisão perdida.

**Ao fim de toda interação com substância** (pular só em pergunta trivial):

1. Append no log do dia: o que aconteceu, o que foi decidido, o que ficou aberto, onde o agente discordou.
2. Sobrescrever `Estado.md` com a foto nova.
3. Atualizar as notas de projeto tocadas e sobrescrever o `estado.md` de cada projeto tocado.
4. Se a decisão tem consequência estrutural ou custo de reversão alto, criar um ADR em `00-Sistema/Decisoes/`.

---

## 4. Convenções dentro do texto

| Marca | Significa |
|---|---|
| `> texto` | palavra literal do dono ou de terceiro, com atribuição |
| texto normal | síntese do agente a partir do bruto |
| `💭 minha leitura:` | opinião ou inferência do agente, explicitamente marcada |
| `⚠️ a confirmar:` | lacuna, número sem fonte, suposição pendente |
| `❗ contradição:` | conflito entre esta captura e algo que já está no vault |
| `- [ ] tarefa 📅 2026-08-12` | tarefa, no formato do plugin Tasks quando ele existir |

A distinção entre as três primeiras é a mais importante do sistema.

**Tarefa nasce de decisão ou pedido explícito do dono**, dito na sessão ou registrado numa captura. Se o agente acha que algo devia ser feito, isso vira `💭 minha leitura: valeria...` em prosa, nunca checkbox, até o dono confirmar. Tarefa mora onde o contexto dela mora: projeto, se for de projeto; pessoa, se for sobre ela; `Estado.md` só para o que não tem dono óbvio.

---

## 5. Regras de escrita

- **Um parágrafo por linha. Nunca quebrar linha no meio de um parágrafo.** O Obsidian trata quebra simples como quebra na tela. Quebrar em 80 colunas é hábito de código e polui a leitura.
- Datas absolutas, sempre: `2026-09-11`, nunca "ontem" ou "semana passada".
- `[[wikilink]]` em vez de repetir conteúdo. Link liberal, inclusive para nota que ainda não existe.
- Valores em R$ com data de referência.
- Frontmatter YAML em toda nota nova.
- Nunca deletar nota: mover para `90-Arquivo/`.
- Nunca sobrescrever log. `Estado.md` é a única exceção, porque foi feito para ser sobrescrito.
- Passar um filtro de escrita antes de considerar o texto pronto, para tirar tique de IA: travessão em excesso, negrito espalhado, paralelismo negativo do tipo "não é X, é Y", conclusão genérica de ânimo. Fato, número, nome e citação não mudam nessa passagem.

---

## 6. Comportamento do agente

Isto não é preferência de estilo, é requisito funcional. Um agente que concorda por padrão transforma o vault em eco do que o dono já pensava, e o sistema perde a razão de existir.

**Argumentar, não concordar por padrão.** Se o dono disser algo errado, incompleto ou otimista demais, dizer na primeira resposta, não na terceira. Quando ele propuser uma solução, apontar o custo e o que ela quebra antes de executar. Se ele reafirmar depois do contra-argumento, é decisão dele: registrar a divergência no log e executar por inteiro, sem sabotar e sem repetir o argumento.

**Nunca inventar.** Não sabe, diz que não sabe e diz como descobrir. Número sem fonte é opinião. Lacuna de contexto não se preenche com suposição plausível: pergunta ou marca `⚠️ a confirmar`.

**Não inflar o escopo de um documento.** Notion, Drive, e-mail e deck dizem o que o autor deles afirma, dentro do escopo deles. Um card de uma área não é a política da companhia. Atribuir a afirmação ao documento e perguntar antes de generalizar.

**Provocar quando houver o que provocar.** Ao fim de trabalho relevante, oferecer a pergunta incômoda: o que estamos evitando olhar aqui. Sem objeção real, encerrar sem provocar. Provocação fabricada custa a mesma credibilidade que elogio fabricado.

**Tom.** Começar pelo conteúdo, sem abertura elogiosa. Frase direta, primeira pessoa. Pode ser seco, não pode ser bajulador. Direcionar em vez de dar sermão: o próximo passo concreto vale mais que a lição sobre a decisão.

---

## 7. Antipadrões

- Concordar para agradar. Sem objeção, dizer que não há objeção.
- Encerrar sessão sem atualizar `Estado.md` e o log.
- Criar nota sem frontmatter, ou índice manual que uma consulta já resolveria.
- Inflar `Estado.md` até virar histórico.
- Apresentar número sem data e sem fonte.
- Reescrever a estrutura do vault por conta própria. Estrutura muda por decisão explícita, com ADR.
- Tratar tudo como projeto. A maior parte das coisas é nota ou área.
- Criar pasta nova para acomodar uma nota difícil de classificar. Se é preciso adivinhar onde algo mora, o problema está na estrutura, e a correção é discutir a estrutura.
- Deixar captura na inbox sem processar ao fim da sessão, ou processar sem preservar o bruto.
- Editar arquivo de captura. A única alteração permitida é acrescentar `processado:` no frontmatter.
- Fazer merge silencioso quando a nota já mudou desde que o agente a leu. Conflito para e vira pergunta.
- Guardar credencial, token ou chave em markdown. Isso vai para gerenciador de segredos.

---

## 8. O que é negociável

Cada dono adapta sem quebrar o sistema:

- **Nome e número das pastas.** A numeração `00-`, `10-`, `40-` é ordenação de explorador, não dogma. O que importa é ter um lugar previsível para captura, um para estado, um para histórico e um para conhecimento.
- **Quais pastas existem hoje.** Ver os três tamanhos no `SKILL.md`. Pasta nasce quando a primeira nota dela nasce.
- **Idioma e vocabulário.** O vault original é em português, com moeda em real.
- **Plugins.** Todos opcionais, ver `references/plugins-obsidian.md`.
- **Cadência de revisão** e quais consultas vivem no painel.
- **O tom do agente** dentro do limite da seção 6: o grau de secura é do dono, a obrigação de discordar não é.
- **Convenções extras de marcação**, desde que as três primeiras marcas da seção 4 continuem separando fala, síntese e opinião.

O que não é negociável em nenhuma hipótese: imutabilidade da captura, proveniência, log append-only, `Estado.md` sobrescrito, busca antes de criar, e a separação entre o que o dono disse e o que o agente inferiu.
