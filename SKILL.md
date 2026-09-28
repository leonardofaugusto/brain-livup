---
name: brain-livup
description: |
  Instala, na máquina de quem trabalha na Liv Up, o Livup Brain: memória pessoal em
  Obsidian operada pelo Claude. Conduz a instalação do Obsidian (recomendação da Liv Up),
  conecta o tomador de notas da pessoa (Granola ou Gemini), puxa as pessoas em volta dela do
  organograma da Liv Up, faz duas perguntas ao dono, cria a estrutura, escreve o CLAUDE.md,
  instala a rotina diária e importa o contexto que a pessoa já tem (reuniões recentes, Notion,
  Drive, notas soltas). A skill é uma casca: não traz contexto de área, projeto ou pessoa. O
  contexto nasce do material da própria pessoa e do uso, ao longo das semanas. Use quando o pedido for "quero
  montar meu Livup Brain", "instalar o Livup Brain", "quero um Livup Brain", "montar meu vault",
  ou para auditar se um vault existente cumpre os contratos. Não use para pasta de contexto
  de Área ou Agente num repositório de IA (isso é `criar-estrutura-de-contexto`) nem para
  arquitetura de agente (isso é `criar-arquitetura-agente`).
metadata:
  origem: "derivada de criar-second-brain (versão 2026-09-11), adaptada para a Liv Up"
  versao: "2026-09-23"
---

## PRIMEIRA RESPOSTA: copiar literalmente

Ao ser acionada, a sua primeira resposta à pessoa é **o texto entre as linhas INÍCIO e FIM abaixo, copiado caractere por caractere**, e nada mais: nenhuma frase antes, nenhum resumo, nenhum "vou apresentar". Não rode comando, não leia outro arquivo e não faça checagem antes de enviar esta mensagem. A marmita vai dentro do bloco de código, para não perder o alinhamento. Só depois de enviar, siga para a Etapa 1.

INÍCIO

```
     _________________________________
    /                                 \
   |       L I V U P   B R A I N       |
    \_________________________________/
    |  ideias   | reuniões | decisões |
    |  ~~ ~ ~~  | = = = =  |  [x] [x] |
    |  ~ ~~ ~   | = = =    |  [x] [ ] |
    '---------------------------------'
       comida de verdade pra cabeça
    (isso era pra ser uma marmita)
```

O Livup Brain transforma o Claude no seu agente pessoal de trabalho. Ele ganha uma pasta no seu computador onde guarda o que acontece no seu dia: reuniões, anotações, decisões, pessoas. Antes de responder, ele lê essa pasta. Depois de cada conversa, ele atualiza.

**Você pensa, ele amplifica.** Ele conhece seus projetos, suas pessoas e o que já foi decidido, então a conversa começa do ponto em que você está, e não do zero.

**Você fala, ele anota.** Reunião gravada, ideia solta, ata colada: ele separa o que é decisão, tarefa e contexto, e guarda cada coisa no lugar certo.

**Seu dia começa sempre pronto com o `/bom-dia`.** Ele traz as reuniões de ontem, monta a agenda de hoje e diz o que precisa de você.

Duas regras de segurança: o que você escreve nunca é reescrito por ele, e o que ele deduz fica marcado como dedução até você confirmar. Tudo fica no seu computador.

A montagem tem cinco etapas:

1. Preparar a máquina
2. Te conhecer (duas perguntas)
3. Conectar suas reuniões e sua equipe
4. Montar a pasta
5. Trazer o que você já tem e ver funcionando

Começando.

FIM

Se houver sinal de outro Livup Brain na máquina (outra pasta com `CLAUDE.md` e `00-Sistema/Estado.md`, ou a skill `bom-dia` já instalada), perguntar só depois da abertura, numa linha: "Encontrei um Livup Brain em `<caminho>`. Quer continuar nele ou começar um novo aqui?"


# Livup Brain: memória pessoal operada pelo Claude

Um vault por pessoa, na máquina dela. O que esta skill instala é um **sistema de memória**, não um conteúdo: quem escreve o quê, o que nunca pode ser reescrito, o que o agente lê antes de responder, o que ele escreve antes de encerrar, e a rotina que transforma captura bruta em contexto todo dia.

A skill chega vazia de propósito. Área, projetos, pessoas e vocabulário da pessoa não são pré-carregados: nascem das capturas, das atas de reunião e das notas dela, ao longo dos dias e semanas. A única exceção é a lista de pessoas em volta dela, puxada do organograma da Liv Up no passo 4, porque nome errado é o erro mais caro do sistema.

**Isto é memória pessoal.** Cada um tem o seu, com as próprias capturas. Memória compartilhada de time é outro desenho, e a skill para isso é `criar-estrutura-de-contexto`.

## Como conduzir

Depois da abertura literal do topo deste arquivo, a pessoa vive a montagem como um onboarding em cinco etapas, com o roteiro de `references/onboarding.md`: trilha de progresso em cada etapa, checagem técnica em silêncio quando passa, um momento aha respondendo uma pergunta real com o contexto importado, e fechamento com a marmita cheia de números reais e os três hábitos de uso.

| Etapa do onboarding | Passos abaixo |
|---|---|
| 1. Preparar a máquina | 0 e 1 |
| 2. Te conhecer | 2 |
| 3. Conectar reuniões e equipe | 3 e 4 |
| 4. Montar a pasta | 5, 6 e 7 |
| 5. Trazer o que já existe | 8 |
| Fechamento | 9 e 10 |

## Arquivos desta skill

- `references/contratos.md`: o núcleo não negociável e o que cada dono pode adaptar. Ler antes de criar qualquer arquivo.
- `references/entrevista.md`: as duas perguntas do bootstrap e como importar o que a pessoa já registra.
- `references/tomadores-de-notas.md`: como conectar Granola ou Gemini e como o agente busca as reuniões.
- `references/organograma.md`: como puxar do organograma da Liv Up as pessoas em volta do dono.
- `references/plugins-obsidian.md`: o conjunto de plugins recomendado pela Liv Up, com o que cada um habilita.
- `assets/CLAUDE-modelo.md`: modelo do `CLAUDE.md` do vault novo, com marcadores `{{...}}`.
- `assets/bootstrap.ps1` e `assets/bootstrap.sh`: criam o esqueleto e copiam os arquivos de sistema, no Windows e no macOS.
- `references/onboarding.md`: o roteiro do que a pessoa lê em cada etapa.
- `assets/skills/bom-dia/`: a rotina diária que processa reuniões, diário e inbox. Instalada no passo 7.
- `assets/skills/humanizer/`: o filtro de escrita usado em toda nota. Instalado no passo 7.
- `assets/` e `assets/templates/`: arquivos de sistema e templates copiados para o vault novo.

## Passo 0: o que precisa existir na máquina

Checar antes de prometer qualquer coisa, com a pessoa presente.

| Item | Para quê | Se faltar |
|---|---|---|
| Claude Code instalado e com login feito | É o agente que opera o vault | Sem isso a skill não roda |
| Obsidian | Leitura, grafo, busca, painel e plugins. É a recomendação da Liv Up para ler o vault | Instalar agora, pelo roteiro abaixo |
| Conector do tomador de notas no Claude | É por ele que a rotina diária busca as reuniões | Resolver no passo 3 |
| Conector do Google Calendar no Claude | Agenda do dia no diário | Recomendado, não obrigatório |
| Uma pasta escolhida para o vault | Raiz do vault e diretório de trabalho do agente ao mesmo tempo | Decidir no passo 1 |

### Instalar o Obsidian

A Liv Up recomenda o Obsidian como leitor do vault. O vault funciona sem ele, porque é markdown em pasta, mas a pessoa perde navegação, grafo e painel, e é no Obsidian que ela vai ler o que o agente escreveu.

Perguntar o sistema operacional e seguir o caminho correspondente. Rodar o comando pela pessoa quando o ambiente permitir; se pedir permissão de administrador e ela não tiver, cair no download manual.

- **Windows:** `winget install --id Obsidian.Obsidian -e`. Sem `winget` ou sem permissão, baixar o instalador em https://obsidian.md/download e executar.
- **macOS:** `brew install --cask obsidian`, se ela usa Homebrew. Sem Homebrew, baixar o `.dmg` em https://obsidian.md/download e arrastar para Aplicativos.

Conferir abrindo o Obsidian uma vez. A pasta do vault só é aberta nele no passo 5, depois de criada.

## Passo 1: onde o vault mora

Sugerir caminho curto, estável, sem acento e sem espaço (por exemplo `C:\Users\<usuario>\LivupBrain` ou `~/LivupBrain`). **Fora de pasta sincronizada por OneDrive ou Google Drive:** sincronia automática sobre arquivo editado por agente produz conflito silencioso e cópia duplicada.

Nesta fase o vault não é versionado nem tem backup automático. Registrar isso no `CLAUDE.md` como decisão consciente, para que ninguém descubra depois.

O tamanho padrão da Liv Up é o **Padrão com reuniões**: `CLAUDE.md`, `Painel.md`, `00-Inbox/`, `00-Diario/` com `Reunioes/`, `00-Sistema/` (Estado, Log, Bruto, Decisoes, Templates, Protocolo, Fontes), `10-Projetos/`, `30-Pessoas/`, `40-Notas/` e `90-Arquivo/`. Usar o Mínimo só se a pessoa não tem reunião gravada nem frente formalizada. Pasta que ainda não tem nota fica, com o índice dentro; pasta nova além dessas só por decisão registrada.

## Passo 2: entrevistar o dono

Duas perguntas, em `references/entrevista.md`: como a pessoa gosta de ser chamada, e onde está hoje o que ela já anota e registra. O resto não se pergunta: cargo, área e gestor vêm do organograma (passo 4), e frentes, pessoas e vocabulário vêm das reuniões e do material que ela já tem (passos 3 e 8). Regra do sistema: **não preencher lacuna com suposição plausível**. O que nenhuma fonte trouxe fica marcado `⚠️ a confirmar`.

## Passo 3: conectar o tomador de notas

Perguntar qual ferramenta grava as reuniões dela: **Granola** ou **Gemini** (anotações do Google Meet). Seguir `references/tomadores-de-notas.md` para a escolhida: conferir o conector no Claude, conferir que a ferramenta está gravando, e fazer uma busca de teste pelas reuniões dos últimos dias. Se ela não usa nenhuma, recomendar uma das duas e seguir sem, registrando no `Estado.md`.

A escolha vai escrita no `CLAUDE.md`, porque é ela que diz à rotina diária onde buscar.

## Passo 4: puxar as pessoas do organograma

Seguir `references/organograma.md`. O agente busca no app de organograma da Liv Up o ramo da pessoa (gestor, pares, liderados diretos) e cria uma nota em `30-Pessoas/` para cada um, só com o que o organograma diz: nome, cargo, área, e-mail, relação com o dono. Nada de contexto inventado.

Não importar a empresa inteira. Centenas de notas de pessoa que ninguém usa poluem busca e grafo. Outras pessoas entram quando aparecerem numa captura.

## Passo 5: criar a estrutura e escrever o CLAUDE.md

O script de bootstrap faz o mecânico (pastas, arquivos de sistema, templates, índices) e não inventa conteúdo. Não sobrescreve arquivo existente, então rodar duas vezes é seguro.

```powershell
powershell -ExecutionPolicy Bypass -File <caminho-da-skill>\assets\bootstrap.ps1 -Destino "C:\Users\<usuario>\LivupBrain" -Tamanho padrao
```

```bash
bash <caminho-da-skill>/assets/bootstrap.sh ~/LivupBrain padrao
```

Depois do script:

1. Escrever o `CLAUDE.md` a partir de `assets/CLAUDE-modelo.md`, substituindo todo marcador `{{...}}` pelas respostas da entrevista e pelo que os passos 3 e 4 trouxeram. Marcador que sobrou é erro: ou vira resposta, ou vira `⚠️ a confirmar` com a pergunta por extenso.
2. Escrever o primeiro `00-Sistema/Estado.md` com a foto real do dia, e o primeiro log em `00-Sistema/Log/Log-AAAA-MM-DD.md`.
3. Abrir a pasta no Obsidian como vault ("Abrir pasta como cofre") e confirmar que o `Painel.md` aparece.

O `CLAUDE.md` fica curto. Regra longa demais é regra ignorada: o essencial mora nele e o detalhe operacional vai para `00-Sistema/Protocolo-de-Notas.md`.

## Passo 6: plugins do Obsidian

Instalar com a pessoa o conjunto recomendado em `references/plugins-obsidian.md`: `dataview`, `calendar`, `templater` e `tasks`, mais o de sincronia do Granola se ela escolheu Granola. Configurar as notas diárias (formato `YYYY-MM-DD`, pasta `00-Diario`, modelo `00-Sistema/Templates/Diario.md`).

Regra que não muda com plugin nenhum: **nenhum índice é mantido à mão**.

## Passo 7: instalar as rotinas

Duas skills vão junto, em `assets/skills/`:

- `bom-dia`: faz o vault viver. Busca as reuniões novas no tomador de notas, cria o diário do dia com a agenda, processa diário, reuniões e inbox pelo protocolo, e devolve um resumo curto. Sem rotina, o processamento depende de a pessoa lembrar de pedir, e o vault morre em três semanas.
- `humanizer`: o filtro de escrita que o `CLAUDE.md` do vault manda usar em toda nota e resposta. Se a pessoa já tiver uma skill `humanizer` instalada, não sobrescrever.

```powershell
Copy-Item -Recurse <caminho-da-skill>\assets\skills\bom-dia "$env:USERPROFILE\.claude\skills\bom-dia"
if (-not (Test-Path "$env:USERPROFILE\.claude\skills\humanizer")) { Copy-Item -Recurse <caminho-da-skill>\assets\skills\humanizer "$env:USERPROFILE\.claude\skills\humanizer" }
```

```bash
cp -R <caminho-da-skill>/assets/skills/bom-dia ~/.claude/skills/bom-dia
[ -d ~/.claude/skills/humanizer ] || cp -R <caminho-da-skill>/assets/skills/humanizer ~/.claude/skills/humanizer
```

Combinar com a pessoa o gatilho: ela abre o Claude Code na pasta do vault e digita `/bom-dia` no começo do dia.

## Passo 8: importar o contexto que já existe

Este passo não é opcional e é o que separa um vault vivo de uma pasta bonita. O vault não nasce vazio: nasce do que a pessoa já tem.

1. **Reuniões recentes.** Trazer pelo tomador de notas as reuniões das últimas duas semanas para `00-Diario/Reunioes/`, uma nota por reunião, como a rotina diária faz. Duas semanas bastam para aparecerem as frentes e as pessoas que se repetem; mais que isso deixa a primeira sessão longa demais.
2. **Memória do claude.ai.** Se a pessoa já usa o Claude no navegador, conduzir o tutorial da Etapa 5 em `references/onboarding.md`: ela pede ao Claude de lá tudo o que ele lembra dela e cria ela mesma uma nota na `00-Inbox/` com a resposta, que é o primeiro uso da inbox. É resumo feito por máquina, não palavra dela: toda afirmação tirada dali entra com `confirmado: false`.
3. **Material próprio.** Para cada lugar que ela citou na pergunta 2, trazer o que ela indicar: páginas do Notion e documentos do Drive pelos conectores, texto colado ou exportado de bloco de notas e WhatsApp. Cada item entra em `00-Inbox/` sem edição.
4. **Processar uma captura na frente dela**, dizendo cada decisão em voz alta: o que virou nota atômica, o que virou projeto, o que virou tarefa, o que ficou como a confirmar. Mover o bruto para `00-Sistema/Bruto/AAAA-MM-DD-slug.md` sem alterar uma palavra. A pessoa precisa ver o ciclo inteiro uma vez para confiar que pode despejar sem organizar.
5. **Processar o resto** pelo mesmo protocolo. Se o volume for grande, processar as reuniões primeiro e deixar o material próprio para o primeiro `/bom-dia`, registrando no `Estado.md` o que ficou na inbox.
6. **Escrever o `Estado.md`** com as frentes que apareceram nas reuniões e no material, cada uma com a fonte. É a primeira vez que o vault descreve o presente dela, e ela confere.
7. Devolver as três listas do protocolo: o que foi criado, o que virou proposta esperando confirmação dela, e onde uma fonte contradiz outra.
8. Fechar a sessão pelo protocolo completo: log do dia, `Estado.md`, notas de projeto tocadas.

## Passo 9: checklist de aceite

O vault está de pé quando as afirmações abaixo são verdadeiras. Rodar o checklist com o dono, não sozinho.

- [x] O Obsidian abre a pasta e o `Painel.md` devolve alguma coisa.
- [ ] O tomador de notas está conectado e a busca de teste trouxe pelo menos uma reunião.
- [ ] As pessoas do ramo do dono estão em `30-Pessoas/`, com a fonte apontando para o organograma.
- [ ] As reuniões das últimas duas semanas e o material indicado por ela estão no vault, com pelo menos uma captura processada de ponta a ponta e bruto preservado.
- [ ] `Estado.md` descreve o presente da pessoa, e não o que a skill imaginou.
- [ ] O log do dia registra a sessão de montagem, incluindo o que ficou em aberto.
- [ ] `/bom-dia` e `humanizer` estão instalados, e a pessoa sabe quando rodar o `/bom-dia`.
- [ ] A pessoa responde, sem olhar, onde ela despeja uma ideia de três palavras às onze da noite.

Falhou alguma, o vault não foi entregue. Registrar o que falta no log e combinar quando fecha.

## Passo 10: combinar a segunda sessão

Vault morre entre a montagem e o primeiro uso sozinho. Antes de encerrar, fechar com a pessoa quando ela roda o primeiro `/bom-dia` sem ajuda (o dia seguinte serve) e quando a revisão acontece (uma semana depois). Na revisão, rodar a seção de auditoria abaixo.

## Revisar um vault que já existe

Ler `CLAUDE.md`, `Estado.md`, o último log e uma amostra de dez notas, e checar contra `references/contratos.md`. Os sintomas, na ordem em que costumam aparecer:

Inbox com resíduo de mais de uma sessão diz que o processamento parou. Reunião sem `processado:` há dias diz que a rotina diária não está rodando. Nota sem `fonte:` diz que opinião do agente entrou como fato. Duas notas afirmando a mesma coisa dizem que ninguém buscou antes de criar. `Estado.md` crescendo por acumulação diz que virou histórico, e histórico é o log. Diário editado pelo agente diz que o contrato mais importante do sistema caiu.

Entregar como lista de problema com correção proposta, e aplicar só depois do aval do dono.

## O que esta skill não faz

- Não traz contexto de área, projeto ou pessoa de outro vault. O contexto vem das capturas.
- Não cria projeto, área ou nota que o dono não nomeou, fora as pessoas do ramo dele no organograma.
- Não decide sozinha onde o vault mora.
- Não entrega vault vazio. Sem a importação do passo 8, o trabalho não terminou.
- Não monta base compartilhada de time.

## Onde a skill mora

A pasta inteira (`SKILL.md`, `references/`, `assets/`) vai para `~/.claude/skills/brain-livup/`. Quem mantém a skill mantém uma cópia canônica só e corrige nela quando o uso revelar erro. Cópia divergente espalhada por várias máquinas discorda da original no instante em que uma das duas muda.
