# Onboarding: o roteiro da conversa

Este arquivo define o que a pessoa lê durante a montagem. Os passos técnicos do `SKILL.md` dizem o que fazer; este diz o que falar. Quem está montando o Livup Brain nunca viu um vault e não precisa ver a máquina trabalhando: precisa entender o que ganha, saber em que etapa está e ver o resultado aparecer.

## Regras de tom

- Toda mensagem diz o que está acontecendo e por que importa para a pessoa. Nada de "vou verificar algumas coisas".
- Checagem técnica que passou não aparece. Versão do Obsidian, caminho sem acento, pasta fora do OneDrive: o agente confere em silêncio e só fala se algo falhar, e aí fala o que a pessoa precisa fazer.
- Cada etapa abre com o marcador `Etapa N de 5` e uma frase sobre o que ela entrega.
- Frase curta, segunda pessoa, sem jargão. "Vault" só aparece depois que a abertura explicou o que é. Nada de "incrível", "poderoso" ou "vamos lá".
- Texto passa pela skill `humanizer` antes de ser mostrado.
- Os textos abaixo são base, não script decorado. Adaptar ao que a pessoa já disse, mantendo o conteúdo.

## Abertura

Mostrar antes de qualquer checagem, numa mensagem só, começando pela marmita dentro de bloco de código (para manter o alinhamento):

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
```

> Hoje o Claude é bom de conversa e ruim de memória: cada sessão começa do zero, e é você quem explica de novo quem é quem, o que foi decidido e o que ficou pendente.
>
> O Livup Brain transforma o Claude no seu agente pessoal de trabalho. Ele ganha uma pasta no seu computador onde guarda o que acontece no seu dia: reuniões, anotações, decisões, pessoas. Antes de responder, ele lê essa pasta. Depois de cada conversa, ele atualiza.
>
> **Você pensa, ele amplifica.** Ele conhece seus projetos, suas pessoas e o que já foi decidido, então a conversa começa do ponto em que você está, e não do zero.
>
> **Você fala, ele anota.** Reunião gravada, ideia solta, ata colada: ele separa o que é decisão, tarefa e contexto, e guarda cada coisa no lugar certo.
>
> **Seu dia começa sempre pronto com o `/bom-dia`.** Ele traz as reuniões de ontem, monta a agenda de hoje e diz o que precisa de você.
>
> Duas regras de segurança: o que você escreve nunca é reescrito por ele, e o que ele deduz fica marcado como dedução até você confirmar. Tudo fica no seu computador.
>
> A montagem tem cinco etapas:
>
> 1. Preparar a máquina
> 2. Te conhecer (duas perguntas)
> 3. Conectar suas reuniões e sua equipe
> 4. Montar a pasta
> 5. Trazer o que você já tem e ver funcionando
>
> Começando.

Se o agente encontrar sinal de outro Livup Brain na máquina (outra pasta com `CLAUDE.md` e `00-Sistema/Estado.md`, ou a skill `bom-dia` já instalada), perguntar depois da abertura, numa linha: "Encontrei um Livup Brain em `<caminho>`. Quer continuar nele ou começar um novo aqui?"

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

Ao processar a captura na frente da pessoa, narrar as decisões no formato "isto virou X porque Y", uma linha por decisão. Ao terminar o resto, mostrar números reais: quantas reuniões, notas, pessoas e tarefas.

## Fechamento

Passos 9 e 10 do `SKILL.md`. Mostrar numa mensagem só.

> **Seu Livup Brain está pronto.**
>
> Hoje ele já tem `<N>` reuniões, `<N>` pessoas e `<N>` frentes do seu trabalho. As frentes estão em `00-Sistema/Estado.md`: dê uma olhada e me diga se falta ou sobra alguma.
>
> Três hábitos fazem ele funcionar:
>
> 1. **De manhã:** abra o Claude Code nesta pasta e digite `/bom-dia`.
> 2. **Durante o dia:** qualquer coisa que valha lembrar, cole aqui ou jogue na `00-Inbox`. Sem formatar.
> 3. **Quando precisar:** pergunte. "O que ficou aberto com a pessoa X?", "o que já sabemos sobre Y?", "prepara minha reunião das 15h".
>
> Amanhã, rode o `/bom-dia` sozinho. Daqui a uma semana, a gente revisa juntos o que funcionou.

Os números vêm do que foi criado de fato. Sem número real, a linha sai.
