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

## Declaration
[//]: #Implimented in version 1.1 is the \declaration Command. 
[//]: #This typesets the declaration (below) that this thesis is your own work, required in the front of each PhD Thesis.
[//]: #I, <Student’s Full Name>, declare that this thesis, submitted in partial fulfilment of the requirements for the award of 
[//]: #<Your Degree>, of the School of <Your School>, University of Wollongong, is wholly my own work unless otherwise referenced
or acknowledged. The document has not been submitted for qualifications at any other academic institution.


[//]: #------------------------------------

[//]: #<Student’s Full Name>, July 1, 2013

