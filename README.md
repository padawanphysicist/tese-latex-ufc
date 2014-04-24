Tese UFC
========

# O que é isso?

Modelo LaTeX para normalização de trabalhos acadêmicos (monografias, dissertações e teses) da [Universidade Federal do Ceará](https://www.ufc.br), de acordo com o [guia de normalização 2012](http://www.biblioteca.ufc.br/images/stories/arquivos/bibliotecauniversitaria/guia_normalizacao_ufc_2012.pdf)

# Pequeno manual de instruções 
## Inclusão do pacote
```latex
\usepackage{teseufc}
\begin{document}
```
## Página título

Comandos pré-definidos do `\maketitle` 
```
\title{Título da tese} 
\author{Zé}
```
Se você usar o pacote `hyperref` você pode adicionar um link `mailto`, e assim ao clicarem no seu nome irá abrir uma janela para enviar um e-mail pra você.
	
Novos comandos adicionados 
```
\degree{That Degree You've Been Studying} 

```
  % Write it in full: e.g. Bachelor of Science Medicinal Chemistry Advanced Honours
```
\school{Your School} 
```
e.g Física

```
\supervisor{supervisor 1, supervisor 2 \& supervisor 3}
```
Uma lista com os orientadores; pode ser desligada usando a opção `nosupervisor`, ou, no caso de mais de um orientador, usando a opção `multiplesupervisors`.

