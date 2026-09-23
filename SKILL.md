---
name: brain-livup
description: |
  Instala, na máquina de quem trabalha na Liv Up, o Livup Brain: memória pessoal em
  Obsidian operada pelo Claude. Conduz a instalação do Obsidian (recomendação da Liv Up),
  conecta o tomador de notas da pessoa (Granola ou Gemini), puxa as pessoas em volta dela do
  organograma da Liv Up, entrevista o dono, cria a estrutura, escreve o CLAUDE.md do vault,
  instala a rotina diária de processamento e processa a primeira captura real junto com ela.
  A skill é uma casca: não traz contexto de área, projeto ou pessoa. O contexto nasce das
  capturas, das reuniões e do uso, ao longo das semanas. Use quando o pedido for "quero
  montar meu Livup Brain", "instalar o Livup Brain", "quero um Livup Brain", "montar meu vault",
  ou para auditar se um vault existente cumpre os contratos. Não use para pasta de contexto
  de Área ou Agente num repositório de IA (isso é `criar-estrutura-de-contexto`) nem para
  arquitetura de agente (isso é `criar-arquitetura-agente`).
metadata:
  origem: "derivada de criar-second-brain (versão 2026-09-11), adaptada para a Liv Up"
  versao: "2026-09-23"
---

# Livup Brain: memória pessoal operada pelo Claude

Um vault por pessoa, na máquina dela. O que esta skill instala é um **sistema de memória**, não um conteúdo: quem escreve o quê, o que nunca pode ser reescrito, o que o agente lê antes de responder, o que ele escreve antes de encerrar, e a rotina que transforma captura bruta em contexto todo dia.

A skill chega vazia de propósito. Área, projetos, pessoas e vocabulário da pessoa não são pré-carregados: nascem das capturas, das atas de reunião e das notas dela, ao longo dos dias e semanas. A única exceção é a lista de pessoas em volta dela, puxada do organograma da Liv Up no passo 4, porque nome errado é o erro mais caro do sistema.

**Isto é memória pessoal.** Cada um tem o seu, com as próprias capturas. Memória compartilhada de time é outro desenho, e a skill para isso é `criar-estrutura-de-contexto`.

## Arquivos desta skill

- `references/contratos.md`: o núcleo não negociável e o que cada dono pode adaptar. Ler antes de criar qualquer arquivo.
- `references/entrevista.md`: os blocos de pergunta do bootstrap.
- `references/tomadores-de-notas.md`: como conectar Granola ou Gemini e como o agente busca as reuniões.
- `references/organograma.md`: como puxar do organograma da Liv Up as pessoas em volta do dono.
- `references/plugins-obsidian.md`: o conjunto de plugins recomendado pela Liv Up, com o que cada um habilita.
- `assets/CLAUDE-modelo.md`: modelo do `CLAUDE.md` do vault novo, com marcadores `{{...}}`.
- `assets/bootstrap.ps1` e `assets/bootstrap.sh`: criam o esqueleto e copiam os arquivos de sistema, no Windows e no macOS.
- `assets/skills/bom-dia/`: a rotina diária que processa reuniões, diário e inbox. Instalada no passo 7.
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

Rodar os blocos de `references/entrevista.md`, em conversa, uma pergunta por vez. Regra do sistema: **não preencher lacuna com suposição plausível**. Resposta que não existe vira `⚠️ a confirmar` no `CLAUDE.md` e continua faltando até alguém responder.

A entrevista tem duas saídas obrigatórias: o conteúdo pessoal do `CLAUDE.md` e a primeira captura real, usada no passo 8.

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

1. Escrever o `CLAUDE.md` a partir de `assets/CLAUDE-modelo.md`, substituindo todo marcador `{{...}}` pelas respostas da entrevista e dos passos 3 e 4. Marcador que sobrou é erro: ou vira resposta, ou vira `⚠️ a confirmar` com a pergunta por extenso.
2. Escrever o primeiro `00-Sistema/Estado.md` com a foto real do dia, e o primeiro log em `00-Sistema/Log/Log-AAAA-MM-DD.md`.
3. Abrir a pasta no Obsidian como vault ("Abrir pasta como cofre") e confirmar que o `Painel.md` aparece.

O `CLAUDE.md` fica curto. Regra longa demais é regra ignorada: o essencial mora nele e o detalhe operacional vai para `00-Sistema/Protocolo-de-Notas.md`.

## Passo 6: plugins do Obsidian

Instalar com a pessoa o conjunto recomendado em `references/plugins-obsidian.md`: `dataview`, `calendar`, `templater` e `tasks`, mais o de sincronia do Granola se ela escolheu Granola. Configurar as notas diárias (formato `YYYY-MM-DD`, pasta `00-Diario`, modelo `00-Sistema/Templates/Diario.md`).

Regra que não muda com plugin nenhum: **nenhum índice é mantido à mão**.

## Passo 7: instalar a rotina diária

Copiar `assets/skills/bom-dia/` para `~/.claude/skills/bom-dia/`. É ela que faz o vault viver: busca as reuniões novas no tomador de notas, cria o diário do dia com a agenda, processa diário, reuniões e inbox pelo protocolo, e devolve um resumo curto. Sem rotina, o processamento depende de a pessoa lembrar de pedir, e o vault morre em três semanas.

```powershell
Copy-Item -Recurse <caminho-da-skill>\assets\skills\bom-dia "$env:USERPROFILE\.claude\skills\bom-dia"
```

```bash
cp -R <caminho-da-skill>/assets/skills/bom-dia ~/.claude/skills/bom-dia
```

Combinar com a pessoa o gatilho: ela abre o Claude Code na pasta do vault e digita `/bom-dia` no começo do dia.

## Passo 8: processar a primeira captura junto com o dono

Este passo não é opcional e é o que separa um vault vivo de uma pasta bonita.

1. Pedir uma captura real, agora, no formato que a pessoa já usa: texto colado de reunião, três linhas soltas, um link com um comentário. Salvar em `00-Inbox/` sem editar. Se o passo 3 trouxe uma reunião recente, ela também serve.
2. Processar na frente dela, dizendo cada decisão em voz alta: o que virou nota atômica, o que virou projeto, o que virou tarefa, o que ficou marcado como a confirmar.
3. Mover o bruto para `00-Sistema/Bruto/AAAA-MM-DD-slug.md` sem alterar uma palavra.
4. Devolver as três listas do protocolo: o que foi criado, o que virou proposta esperando confirmação dela, e onde a captura contradiz algo que já estava no vault.
5. Fechar a sessão pelo protocolo completo: log do dia, `Estado.md` reescrito, notas de projeto tocadas atualizadas.

A pessoa precisa ver o ciclo inteiro uma vez para confiar que pode despejar sem organizar. Enquanto ela achar que precisa formatar antes de capturar, ela não captura.

## Passo 9: checklist de aceite

O vault está de pé quando as afirmações abaixo são verdadeiras. Rodar o checklist com o dono, não sozinho.

- [ ] O Obsidian abre a pasta e o `Painel.md` devolve alguma coisa.
- [ ] O tomador de notas está conectado e a busca de teste trouxe pelo menos uma reunião.
- [ ] As pessoas do ramo do dono estão em `30-Pessoas/`, com a fonte apontando para o organograma.
- [ ] Uma captura real foi processada de ponta a ponta, com bruto preservado.
- [ ] `Estado.md` descreve o presente da pessoa, e não o que a skill imaginou.
- [ ] O log do dia registra a sessão de montagem, incluindo o que ficou em aberto.
- [ ] `/bom-dia` está instalado e a pessoa sabe quando rodar.
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
- Não entrega vault vazio. Sem a captura do passo 8, o trabalho não terminou.
- Não monta base compartilhada de time.

## Onde a skill mora

A pasta inteira (`SKILL.md`, `references/`, `assets/`) vai para `~/.claude/skills/brain-livup/`. Quem mantém a skill mantém uma cópia canônica só e corrige nela quando o uso revelar erro. Cópia divergente espalhada por várias máquinas discorda da original no instante em que uma das duas muda.
