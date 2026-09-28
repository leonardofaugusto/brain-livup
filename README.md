# Livup Brain

Skill do Claude Code que instala, na máquina de quem trabalha na Liv Up, um Livup Brain: memória pessoal em Obsidian operada pelo Claude.

## Instalar

Cole este link no Claude Code e peça: "instala essa skill".

Instruções para o Claude:

1. Clonar este repositório em `~/.claude/skills/brain-livup` (no Windows, `$env:USERPROFILE\.claude\skills\brain-livup`). Se a pasta já existir, rodar `git pull` dentro dela em vez de clonar.
2. Sem git na máquina: baixar o zip em https://github.com/leonardofaugusto/brain-livup/archive/refs/heads/main.zip e extrair o conteúdo de `brain-livup-main/` em `~/.claude/skills/brain-livup/`.
3. Conferir que existe `~/.claude/skills/brain-livup/SKILL.md`.
4. Avisar a pessoa para reiniciar o Claude Code, abrir numa pasta nova e vazia (por exemplo `~/LivupBrain`) e digitar `/brain-livup`.

As skills `/bom-dia` (rotina diária) e `humanizer` (filtro de escrita) são instaladas pela própria skill, no passo 7.

## Atualizar

`git pull` dentro de `~/.claude/skills/brain-livup`, ou baixar o zip de novo.
