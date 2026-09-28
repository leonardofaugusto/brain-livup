# Onboarding: o roteiro da conversa

Este arquivo define o que a pessoa lê durante a montagem. Os passos técnicos do `SKILL.md` dizem o que fazer; este diz o que falar. Quem está montando o Livup Brain nunca viu um vault e não precisa ver a máquina trabalhando: precisa entender o que ganha, saber em que etapa está e ver o resultado aparecer.

## Regras de tom

- Toda mensagem diz o que está acontecendo e por que importa para a pessoa. Nada de "vou verificar algumas coisas".
- Checagem técnica que passou não aparece. Versão do Obsidian, caminho sem acento, pasta fora do OneDrive: o agente confere em silêncio e só fala se algo falhar, e aí fala o que a pessoa precisa fazer.
- Cada etapa abre com a trilha de progresso (seção abaixo) e uma frase sobre o que ela entrega.
- Frase curta, segunda pessoa, sem jargão. "Vault" só aparece depois que a abertura explicou o que é. Nada de "incrível", "poderoso" ou "vamos lá".
- Texto passa pela skill `humanizer` antes de ser mostrado.
- A abertura é texto fixo: sai literal, sem resumo nem paráfrase. Os textos das etapas e do fechamento são base: adaptar ao que a pessoa já disse, mantendo o conteúdo.

## Abertura

O texto da abertura mora no topo do `SKILL.md`, na seção "PRIMEIRA RESPOSTA", e sai literal. Este arquivo cuida das etapas e do fechamento.

## Trilha de progresso

Toda etapa abre com a trilha dentro de bloco de código, antes do texto da etapa. `◇` é etapa feita, `◆` é a atual, `○` é a que falta. Etapa feita leva o resultado curto dela no lugar do nome, quando houver um resultado real para mostrar. Exemplo, abrindo a etapa 3:

```
◇  Máquina pronta
◇  Oi, Raquel
│
◆  Etapa 3 de 5 · Reuniões e equipe
│
○  Montar a pasta
○  Trazer seu contexto
```

Nomes curtos das etapas na trilha: "Preparar a máquina", "Te conhecer", "Reuniões e equipe", "Montar a pasta", "Trazer seu contexto". Resultados curtos possíveis: "Máquina pronta", "Oi, <apelido>", "<N> reuniões e <N> pessoas", "Pasta montada".

## Etapa 1 de 5: preparar a máquina

Passos 0 e 1 do `SKILL.md`.

Abertura da etapa:

> **Etapa 1 de 5: preparar a máquina.** Vou conferir se o Obsidian está instalado e escolher onde sua pasta vai morar. O Obsidian é o aplicativo onde você vai ler o que o Claude organiza: ele mostra a pasta como um caderno navegável.

Se precisar instalar o Obsidian, dizer o que está fazendo em uma linha. Se estiver tudo certo:

> Obsidian pronto. Sua pasta vai ficar em `<caminho>`.

Se a pasta estiver dentro do OneDrive ou do Google Drive, explicar numa frase: sincronização automática disputa arquivo com o Claude e cria cópias duplicadas. Sugerir outro caminho.

## Etapa 2 de 5: te conhecer

Passo 2 do `SKILL.md`.

> **Etapa 2 de 5: te conhecer.** São duas perguntas. Cargo, área e equipe eu busco no organograma da Liv Up, e o resto aprendo com suas reuniões e anotações.

Depois da pergunta 1, confirmar em uma linha o nome encontrado no organograma. Antes da pergunta 2, dizer por que ela importa:

> A segunda é a mais importante: é daqui que o seu Livup Brain já começa com contexto, em vez de nascer vazio.

## Etapa 3 de 5: conectar suas reuniões e sua equipe

Passos 3 e 4 do `SKILL.md`.

> **Etapa 3 de 5: conectar suas reuniões e sua equipe.** Primeiro o seu gravador de reunião, que é de onde o Claude tira a maior parte do contexto. Depois o organograma, para ele saber quem é quem ao seu redor.

Depois da busca de teste de reuniões, mostrar o que achou, com números reais:

> Encontrei `<N>` reuniões suas nos últimos dias, como "`<título 1>`" e "`<título 2>`".

No organograma, antes de pedir o login, uma frase: "Vou abrir o organograma no navegador. Faça login com sua conta Liv Up; eu só leio a estrutura." Depois, mostrar o ramo em lista curta (gestor, pares, liderados, com cargo) e perguntar se está certo.

## Etapa 4 de 5: montar a pasta

Passos 5, 6 e 7 do `SKILL.md`.

> **Etapa 4 de 5: montar a pasta.** Vou criar a estrutura, escrever as regras que o Claude segue com você e instalar as rotinas.

Ao terminar, explicar a estrutura em quatro linhas, sem listar todas as pastas:

> Pronto. Os lugares que você vai usar:
>
> - `00-Inbox`: onde você despeja qualquer coisa, sem formato.
> - `00-Diario`: um arquivo por dia, com sua agenda, e as atas das reuniões.
> - `10-Projetos`, `30-Pessoas` e `40-Notas`: onde o Claude organiza o que aprende.
> - `CLAUDE.md`: as regras que ele segue com você. Pode ler e pedir mudança quando quiser.

Pedir que a pessoa abra a pasta no Obsidian ("Abrir pasta como cofre") e confirme que está vendo o Painel.

## Etapa 5 de 5: trazer o que você já tem

Passo 8 do `SKILL.md`.

> **Etapa 5 de 5: trazer o que você já tem.** Vou importar suas reuniões das últimas duas semanas e o material que você indicou. Vou processar uma delas com você acompanhando, para você ver como funciona. O resto eu faço em seguida.

### Tutorial: trazer a memória do claude.ai

Oferecer a quem já usa o Claude no navegador. É o atalho mais rápido para o Livup Brain começar sabendo quem a pessoa é.

> Se você já usa o Claude no navegador, ele já aprendeu bastante sobre você. Vamos trazer isso para cá em três passos:
>
> 1. Abra https://claude.ai numa conversa nova.
> 2. Cole esta mensagem e envie:
>
>    ```
>    Liste tudo o que você lembra sobre mim e sobre o meu trabalho: cargo, área, projetos, pessoas com quem trabalho, decisões, preferências e qualquer contexto que você tenha guardado. Organize por tema, em tópicos curtos, e não invente nada que você não tenha registrado.
>    ```
>
> 3. Coloque a resposta na sua inbox. Este é o gesto que você vai repetir todo dia, então vale aprender agora:
>    - No Obsidian, clique com o botão direito na pasta `00-Inbox` e escolha **Nova nota**.
>    - Dê um nome qualquer, por exemplo `memoria claude`.
>    - Cole a resposta inteira e pronto. Não precisa formatar nem salvar: o Obsidian salva sozinho.
>    - Me avise aqui quando terminar.
>
> Eu leio a nota direto da inbox e uso como ponto de partida, sem mudar uma palavra do que está lá. Tudo o que vier dali entra como "a confirmar", porque é o resumo do Claude sobre você, e não palavra sua. Você valida aos poucos.

Se a pessoa não usa o claude.ai, ou a resposta vier vazia, seguir sem esse passo. Quando ela avisar, conferir que a nota apareceu em `00-Inbox/` e dizer em uma linha que é exatamente assim que qualquer coisa entra no Livup Brain. Se ela travar no Obsidian, aceitar a resposta colada na conversa e salvar na inbox por ela, sem editar.

Ao processar a captura na frente da pessoa, narrar as decisões no formato "isto virou X porque Y", uma linha por decisão. Ao terminar o resto, mostrar números reais: quantas reuniões, notas, pessoas e tarefas.

## Momento aha

Depois de processar tudo e antes do fechamento, mostrar o Livup Brain funcionando com o que acabou de entrar. Escolher uma pessoa ou frente que apareceu em pelo menos duas reuniões importadas e responder, sem a pessoa pedir:

> Antes de fechar, um teste. Perguntei a mim mesmo: **"O que ficou aberto com `<pessoa>`?"**
>
> `<resposta curta, dois a quatro itens, cada um com a reunião de origem e a data>`
>
> Tudo isso veio das suas reuniões, e eu não precisei que você me contasse nada. Agora faça você uma pergunta sobre qualquer coisa do seu trabalho.

Responder a pergunta dela do mesmo jeito, com fonte. Se nenhuma pessoa ou frente aparecer em duas reuniões, usar a reunião mais recente: "O que foi decidido na `<reunião>`?". Sem reunião importada, pular este passo.

## Fechamento

Passos 9 e 10 do `SKILL.md`. Mostrar numa mensagem só, começando pela trilha completa e pela marmita cheia, as duas em bloco de código.

```
◇  Máquina pronta
◇  Oi, <apelido>
◇  <N> reuniões e <N> pessoas
◇  Pasta montada
◇  Contexto trazido
│
└  Pronto
```

```
     _________________________________
    /                                 \
   |       L I V U P   B R A I N       |
    \_________________________________/
    |  ideias   | reuniões | decisões |
    |    <N>    |   <N>    |   <N>    |
    '---------------------------------'
          sua marmita está cheia
    (isso era pra ser uma marmita)
```

Na marmita cheia, `ideias` é o número de notas em `40-Notas/`, `reuniões` o de notas em `00-Diario/Reunioes/` e `decisões` o de decisões registradas no log e nas notas de projeto. Centralizar cada número na coluna preenchendo com espaço até a largura da célula (11, 10 e 10 caracteres), para a caixa não entortar.

> **Seu Livup Brain está pronto.**
>
> As `<N>` frentes do seu trabalho que apareceram estão em `00-Sistema/Estado.md`: dê uma olhada e me diga se falta ou sobra alguma.
>
> Três hábitos fazem ele funcionar:
>
> 1. **De manhã:** abra o Claude Code nesta pasta e digite `/bom-dia`.
> 2. **Durante o dia:** qualquer coisa que valha lembrar, cole aqui ou jogue na `00-Inbox`. Sem formatar.
> 3. **Quando precisar:** pergunte. "O que ficou aberto com a pessoa X?", "o que já sabemos sobre Y?", "prepara minha reunião das 15h".
>
> Amanhã, rode o `/bom-dia` sozinho. Daqui a uma semana, a gente revisa juntos o que funcionou.

Os números vêm do que foi criado de fato. Sem número real, a linha sai.
