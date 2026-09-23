# Entrevista de bootstrap

O que esta conversa produz: o conteúdo pessoal do `CLAUDE.md` do vault novo, o primeiro `Estado.md` e a primeira captura para processar. Nada além disso. Área, projeto, pessoa e vocabulário ganham arquivo depois, a partir de captura real.

A entrevista é curta de propósito. Ela levanta o mínimo para o agente não errar a leitura da pessoa no primeiro dia. O resto o vault aprende com o uso.

## Como conduzir

Conversa, não formulário. Uma pergunta por vez, com a resposta anterior na mão. Quinze a vinte minutos bastam.

Três regras valem o tempo todo:

**Não completar.** Se a pessoa não sabe responder, a resposta é `⚠️ a confirmar`, escrita no `CLAUDE.md` como pergunta por extenso. Lacuna marcada é informação; lacuna preenchida por dedução é erro que vira verdade no mês seguinte.

**Não julgar a resposta.** A entrevista levanta o que existe, inclusive quando o processo da pessoa é bagunçado. Bagunça declarada é dado de desenho: diz onde a captura tem atrito.

**Anotar a palavra dela.** Frase boa sobre o próprio trabalho entra no `CLAUDE.md` em blockquote, com atribuição. Paráfrase de agente sobre o mandato de alguém envelhece mal.

---

## Bloco A: quem é e o que carrega

1. Nome, como as pessoas chamam ela no dia a dia, e apelidos que aparecem em convite de reunião ou transcrição.
2. Cargo, e o que o cargo significa no dia a dia dela.
3. Qual é o mandato: o que precisa acontecer para o trabalho dela ter valido no período.
4. Qual autoridade ela tem e qual não tem. Ela decide sozinha, propõe, ou executa o que outro decidiu.
5. O que ela é cobrada por entregar, e por quem.

A resposta 4 é a que mais muda o comportamento do agente: alguém que atua por influência precisa de evidência rápida, alguém com time e orçamento próprio precisa de sequenciamento e acompanhamento. Um agente que erra essa leitura sugere trabalho que a pessoa não tem como executar.

## Bloco B: a área dela

6. Qual é a área e com quais outras áreas ela mais se conecta.
7. Uma sigla, sistema ou nome de processo que aparece toda semana e que um recém-chegado não entenderia. Uma ou duas bastam; o vocabulário cresce com as capturas.

A skill não traz descrição da Liv Up nem da área. Número, estratégia e estrutura entram no vault quando aparecerem numa captura, com data e fonte.

## Bloco C: frentes ativas

8. Quais são as três a sete coisas em andamento que consomem o tempo dela hoje.
9. Para cada uma, em uma frase: por que vale a pena agora e quem decide.
10. O que está parado esperando terceiro, e esperando quem.

Isso alimenta o primeiro `Estado.md`, não a criação de notas de projeto. Projeto só ganha arquivo quando a pessoa trouxer conteúdo para ele.

## Bloco D: pessoas em volta

O ramo formal vem do organograma, no passo 4 da skill. Aqui entra o que o organograma não diz.

11. Fora do ramo, quem aparece toda semana e qual o papel de cada um.
12. Quem ela chama por apelido, e qual é o apelido.
13. Nome curto que é homônimo na empresa, e que portanto nunca deve ser resolvido por dedução.
14. Qual nome a transcrição de reunião costuma errar, inclusive o dela.

As respostas 13 e 14 evitam o erro mais caro do sistema: o agente inventar pessoa a partir de nome mal transcrito, ou juntar duas pessoas no mesmo arquivo.

## Bloco E: como a captura acontece hoje

O tomador de notas (Granola ou Gemini) é escolhido no passo 3 da skill. Aqui entra o resto.

15. Onde ela escreve coisa solta hoje: bloco de notas, WhatsApp para si mesma, papel, nada.
16. Que horas do dia ela escreve, e quanto tempo tem para isso.
17. O que ela já tentou de organização pessoal e abandonou, e por quê.

A resposta 17 vale ouro: diz qual atrito derruba o sistema para aquela pessoa.

## Bloco F: como o agente deve se comportar

O comportamento do agente vem pronto, como recomendação da Liv Up, na seção 3 do `assets/CLAUDE-modelo.md`: discordar na primeira resposta, tom humano pela skill `humanizer`, direcionar sem dar sermão, nunca inventar, não inflar o escopo de documento e ser específico. Apresentar a recomendação em duas frases e perguntar só o que é da pessoa:

18. Quão conciso o agente deve ser com ela no chat.
19. O que o agente nunca deve fazer sem perguntar.
20. Ela quer ver a proposta antes de o agente escrever no vault, ou prefere que ele escreva e mostre o resultado.

A obrigação de discordar e a de não inventar não são negociáveis, porque agente que concorda por padrão transforma o vault em eco do que a pessoa já pensava. Se ela pedir para o agente não discordar, registrar o pedido no log e manter a regra.

## Bloco G: fronteiras

As regras da Liv Up sobre o que nunca entra no vault não são pergunta: vão direto para o `CLAUDE.md` (ver `assets/CLAUDE-modelo.md`, seção 5). Perguntar só:

21. Alguém além dela vai ler essa pasta algum dia.
22. Ela lida com algum material que exige cuidado extra além das regras gerais (NDA, negociação em curso, processo de pessoas).

---

## Teste de suficiência, antes de encerrar

Escrever o `CLAUDE.md` e responder, olhando só para ele, quatro perguntas do dia a dia dela: qual é a área dela e quem é o gestor, qual frente consome mais tempo, com quem ela precisa falar para destravar a coisa parada, e qual ferramenta grava as reuniões dela.

Falhou alguma, falta bloco. Voltar e perguntar, em vez de deduzir.

## O que fazer com o que ficou em branco

Cada lacuna vira uma linha no `Estado.md`, na seção de perguntas abertas, escrita como a pessoa vai reconhecê-la. Elas fecham sozinhas nas primeiras semanas de captura. O que não fecha em duas semanas vira pergunta direta numa sessão.
