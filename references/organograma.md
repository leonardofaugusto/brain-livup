# Pessoas a partir do organograma da Liv Up

O organograma da Liv Up é um app da plataforma interna, `organograma-pessoas-livup`, mantido por People e aberto a qualquer conta `@livup.com.br`. Quem roda esta skill tem acesso a ele com o próprio login. O agente usa o organograma para criar as notas de pessoa do ramo do dono, e só isso.

## Onde está o dado

- **App:** https://organograma-pessoas-livup.livup-ai.app (login Google com a conta `@livup.com.br`).
- **Rota:** `GET /api/pessoas`. Devolve `{ arvore, ultimaAtualizacao, totalPessoas }`, em que `arvore` é a hierarquia inteira, com cada nó trazendo `nome`, `email`, `cargo`, `nivel`, `area`, `email_chefe`, `data_admissao`, `nome_centro_custo` e `subordinados`.
- **Autenticação:** toda rota `/api` do app exige `Authorization: Bearer <token>`, que é o token da sessão Supabase da pessoa logada. Sem sessão, a rota devolve 401. Não existe acesso de máquina: a leitura sempre acontece em nome de quem está rodando a skill.
- **Chave da hierarquia:** `email_chefe`. Os diretos de alguém são as pessoas cujo `email_chefe` é o e-mail dessa pessoa, que na árvore aparecem como `subordinados` do nó dela.
- **Atualização:** a base é importada por People uma vez por mês. `ultimaAtualizacao` diz de quando é a foto; vai no `fonte:` de cada nota.

## O que não funciona (testado em 2026-09-23)

O MCP da plataforma de apps (`livup-deploy`) lê o código e os metadados do app (`list_files`, `get_file`, `list_projects`), não o banco dele. A base de pessoas mora no Supabase do app, atrás do gate de login, e o app não publica recurso de dados para outros apps (`list_data_apis` não o lista). O gateway de APIs internas (`list_core_apis`) não tem API de pessoas, e o BigQuery liberado ao Claude não tem tabela de colaboradores. Por isso a leitura passa pela sessão da pessoa no navegador, descrita abaixo. Para ler sem login, o app precisaria expor a base por um canal de máquina, decisão de People, dona do app, com os admins da plataforma.

Caminho pela sessão validado em 2026-09-23: com login feito no navegador, `GET /api/pessoas` devolveu 200, 279 pessoas, base de setembro de 2026, e o ramo (gestor, pares, diretos) saiu corretamente pelo `email_chefe`.

## O que puxar

O ramo do dono, a partir do nome dele. Com o nome, o agente acha o nó na árvore e lê:

- o gestor direto (o nó cujo e-mail é o `email_chefe` do dono);
- os pares (os outros subordinados desse gestor);
- os liderados diretos (os `subordinados` do nó do dono);
- depois do passo 8, quem aparecer em várias das reuniões importadas, se estiver na base.

Isso dá entre 5 e 25 pessoas. O resto entra no vault quando aparecer numa captura.

Busca pelo nome: comparar sem acento e sem diferença de maiúscula, porque a base guarda nomes completos em caixa alta ("VICTOR NOGUEIRA DOS SANTOS"). Se o nome casar com mais de uma pessoa, mostrar as opções com cargo e área e perguntar. Se não casar com ninguém, pedir o e-mail.

## Como puxar

1. Abrir o app no navegador disponível na sessão do Claude (o painel de navegador do app do Claude ou o Claude in Chrome) e pedir que a pessoa entre com o Google. O agente não digita senha nem faz o login por ela.
2. Com a sessão aberta, ler o token da sessão Supabase guardado no `localStorage` da página (chave que termina em `-auth-token`, campo `access_token`) e chamar `GET /api/pessoas` com ele no cabeçalho `Authorization`. Rodar a chamada dentro da própria página, para que o token nunca saia do navegador nem seja gravado em arquivo.
3. Percorrer a árvore, achar o nó do dono pelo nome e montar a lista do ramo.
4. Mostrar a lista para a pessoa antes de criar qualquer nota, e corrigir o que ela apontar.

Se não houver navegador na sessão, a pessoa abre o organograma, copia o trecho do ramo dela e cola na conversa. O agente trata o trecho como captura: salva em `00-Sistema/Bruto/` e cria as notas a partir dele.

## O que vai na nota de pessoa

Só o que o organograma diz, e sem `data_admissao` nem centro de custo: não servem ao vault e são dado de RH. Nome do arquivo: o nome como as pessoas chamam no dia a dia, perguntado ao dono quando for diferente do nome completo.

```yaml
---
tipo: pessoa
aliases: ["<nome completo>", "<apelido, se o dono informar>"]
papel: "<cargo>"
nivel: "<nivel>"
area: "<area>"
relacao: gestor          # gestor | par | liderado | outro
email: <email>
fonte: "organograma da Liv Up (/api/pessoas), base de <ultimaAtualizacao>, consultado em AAAA-MM-DD"
atualizado: AAAA-MM-DD
---
```

Corpo da nota: vazio, ou uma linha com o que o dono disser na hora. Contexto, prioridade e histórico entram depois, a partir das capturas.

## Homônimos

Antes de criar, conferir nome repetido na base inteira, e não só no ramo: a árvore completa está na resposta. Quando houver, o nome do arquivo leva o sobrenome e o `aliases` guarda o primeiro nome, com uma linha no corpo dizendo de quem não confundir. Nome curto homônimo nunca é resolvido por dedução numa captura; vira pergunta ao dono.

## O que o organograma não dá

Apelido, quem é sponsor de quê, quem decide o quê. Isso sai das reuniões e das capturas. O organograma diz a hierarquia formal; o vault aprende a real com o tempo.
