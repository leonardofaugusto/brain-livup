# Pessoas a partir do organograma da Liv Up

O organograma da Liv Up é um app da plataforma interna, `organograma-pessoas-livup`, mantido por People e aberto a toda a Liv Up. Quem roda esta skill tem acesso a ele com o próprio login. O agente usa o organograma para criar as notas de pessoa do ramo do dono, e só isso.

## O que puxar

O ramo do dono, e não a empresa inteira:

- o gestor direto;
- os pares (quem responde ao mesmo gestor);
- os liderados diretos;
- quem o dono nomear na entrevista como pessoa de toda semana, se estiver no organograma.

Isso dá entre 5 e 25 pessoas. O resto entra no vault quando aparecer numa captura.

## Como puxar

1. Abrir o app de organograma pelo navegador conectado ao Claude, com a pessoa logada. ⚠️ Endereço a confirmar com o dono da skill; o padrão dos apps da plataforma é `https://<nome-do-app>.livup-ai.app`. Se o endereço não abrir, pedir que a pessoa abra o organograma e informe o link.
2. Localizar o dono na árvore e ler o ramo acima (gestor), ao lado (pares) e abaixo (liderados diretos).
3. Mostrar a lista para a pessoa antes de criar qualquer nota, e corrigir o que ela apontar.

Se não houver navegador conectado ao Claude, a pessoa abre o organograma, copia o trecho do ramo dela e cola na conversa. O agente trata o trecho colado como captura: salva em `00-Sistema/Bruto/` e cria as notas a partir dele.

## O que vai na nota de pessoa

Só o que o organograma diz. Nome do arquivo: o nome como as pessoas chamam no dia a dia, perguntado ao dono quando for diferente do nome completo.

```yaml
---
tipo: pessoa
aliases: ["<nome completo>", "<apelido, se o dono informar>"]
papel: "<cargo no organograma>"
area: "<área no organograma>"
relacao: gestor          # gestor | par | liderado | outro
email: <e-mail do organograma>
fonte: "organograma da Liv Up, consultado em AAAA-MM-DD"
atualizado: AAAA-MM-DD
---
```

Corpo da nota: vazio, ou uma linha com o que o dono disser na hora. Contexto, prioridade e histórico entram depois, a partir das capturas.

## Homônimos

Antes de criar, conferir nome repetido no ramo e na empresa: dois Lucas, duas Anas. Quando houver, o nome do arquivo leva o sobrenome e o `aliases` guarda o primeiro nome, com uma linha no corpo dizendo de quem não confundir. Nome curto homônimo nunca é resolvido por dedução numa captura; vira pergunta ao dono.

## O que o organograma não dá

Apelido, quem é sponsor de quê, quem decide o quê. Isso sai da entrevista (bloco D) e das capturas. O organograma diz a hierarquia formal; o vault aprende a real com o tempo.
