<#
.SYNOPSIS
  Cria o esqueleto de um Livup Brain pessoal, no padrão da skill brain-livup.

.DESCRIPTION
  Faz só o mecânico: pastas, arquivos de sistema, templates e índices. Não inventa
  conteúdo. O CLAUDE.md sai com os marcadores {{...}} por preencher, e o Estado.md sai
  como modelo: os dois viram texto real na conversa com o dono, nos passos 2 e 3 da skill.
  Não sobrescreve arquivo que já existe.

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File .\bootstrap.ps1 -Destino "C:\Users\fulano\LivupBrain" -Tamanho padrao
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Destino,
    [ValidateSet('minimo', 'padrao', 'completo')][string]$Tamanho = 'padrao'
)

$ErrorActionPreference = 'Stop'
$assets = $PSScriptRoot
$hoje = Get-Date -Format 'yyyy-MM-dd'
$criados = @()
$pulados = @()
$utf8 = New-Object System.Text.UTF8Encoding($false)

function New-Pasta($caminho) {
    if (-not (Test-Path $caminho)) { New-Item -ItemType Directory -Path $caminho -Force | Out-Null }
}

function Write-Arquivo($caminho, $conteudo) {
    if (Test-Path $caminho) { $script:pulados += $caminho; return }
    New-Pasta (Split-Path -Parent $caminho)
    [System.IO.File]::WriteAllText($caminho, $conteudo, $script:utf8)
    $script:criados += $caminho
}

function Copy-Asset($origem, $destino) {
    $texto = Get-Content -Raw -Encoding UTF8 (Join-Path $assets $origem)
    $texto = $texto -replace '\{\{DATA\}\}', $hoje
    Write-Arquivo $destino $texto
}

function New-Indice($caminho, $titulo, $pasta, $tipo) {
    $conteudo = @"
---
tipo: sistema
atualizado: $hoje
---

# $titulo

Índice gerado por consulta. Nenhuma lista aqui é mantida à mão. Sem o plugin dataview, o bloco abaixo aparece como código e o índice vira busca que o agente roda na hora.

``````dataview
TABLE atualizado
FROM "$pasta"
WHERE tipo = "$tipo"
SORT atualizado DESC
``````
"@
    Write-Arquivo $caminho $conteudo
}

# --- pastas por tamanho -------------------------------------------------------

$pastas = @('00-Inbox', '00-Sistema', '00-Sistema/Log', '00-Sistema/Bruto', '40-Notas')
if ($Tamanho -in @('padrao', 'completo')) {
    $pastas += @('00-Diario', '00-Diario/Reunioes', '10-Projetos', '30-Pessoas', '00-Sistema/Decisoes', '00-Sistema/Templates', '90-Arquivo')
}
if ($Tamanho -eq 'completo') {
    $pastas += @('20-Areas', '50-Skills')
}

New-Pasta $Destino
foreach ($p in $pastas) { New-Pasta (Join-Path $Destino $p) }

# --- arquivos de sistema ------------------------------------------------------

Copy-Asset 'CLAUDE-modelo.md'  (Join-Path $Destino 'CLAUDE.md')
Copy-Asset 'Painel.md'         (Join-Path $Destino 'Painel.md')
Copy-Asset 'Como-usar.md'      (Join-Path $Destino '00-Inbox/Como-usar.md')
Copy-Asset 'Estado-inicial.md' (Join-Path $Destino '00-Sistema/Estado.md')

if ($Tamanho -in @('padrao', 'completo')) {
    Copy-Asset 'Protocolo-de-Notas.md' (Join-Path $Destino '00-Sistema/Protocolo-de-Notas.md')
    Copy-Asset 'Fontes.md'             (Join-Path $Destino '00-Sistema/Fontes.md')
    foreach ($t in (Get-ChildItem (Join-Path $assets 'templates') -Filter *.md)) {
        Copy-Asset "templates/$($t.Name)" (Join-Path $Destino "00-Sistema/Templates/$($t.Name)")
    }
}

# --- índices por pasta --------------------------------------------------------

New-Indice (Join-Path $Destino '40-Notas/Notas.md') 'Notas' '40-Notas' 'nota'
if ($Tamanho -in @('padrao', 'completo')) {
    New-Indice (Join-Path $Destino '10-Projetos/Projetos.md') 'Projetos' '10-Projetos' 'projeto'
    New-Indice (Join-Path $Destino '30-Pessoas/Pessoas.md')   'Pessoas'  '30-Pessoas' 'pessoa'
}
if ($Tamanho -eq 'completo') {
    New-Indice (Join-Path $Destino '20-Areas/Areas.md') 'Áreas' '20-Areas' 'area'
}

# --- primeiro log -------------------------------------------------------------

Write-Arquivo (Join-Path $Destino "00-Sistema/Log/Log-$hoje.md") @"
---
tipo: log
data: $hoje
---

# Log $hoje

Append-only. Entrada nova nunca edita entrada antiga.

## Montagem do vault

**O que aconteceu.** Esqueleto criado pelo bootstrap da skill brain-livup, tamanho $Tamanho.

**O que foi decidido.** (preencher na sessão: onde o vault mora, tomador de notas escolhido, pessoas puxadas do organograma, o que ficou fora)

**O que ficou aberto.** (preencher: marcadores do CLAUDE.md ainda por responder)
"@

# --- relatório ----------------------------------------------------------------

Write-Host ""
Write-Host "Vault criado em: $Destino  (tamanho: $Tamanho)"
Write-Host "Arquivos criados: $($criados.Count)"
if ($pulados.Count -gt 0) {
    Write-Host "Já existiam e foram preservados: $($pulados.Count)"
    $pulados | ForEach-Object { Write-Host "  - $_" }
}
Write-Host ""
Write-Host "Falta o que só a conversa resolve:"
Write-Host "  1. Preencher os marcadores {{...}} do CLAUDE.md com as respostas da entrevista."
Write-Host "  2. Reescrever 00-Sistema/Estado.md com a foto real do dia."
Write-Host "  3. Abrir a pasta no Obsidian como vault e conferir o Painel."
Write-Host "  4. Processar a primeira captura real, de ponta a ponta, com o dono junto."
Write-Host ""
