%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%80
% teseufc.sty 
% Estilo UFC 
%
% Um bom guia pra começar a entender o funcionamento do pacote é o wikibooks:
%
% http://en.wikibooks.org/wiki/LaTeX/Creating_Packages
%
% Os pacotes usados aqui são os mais básicos, referentes à formatação de texto,
% legendas nas figuras e coisas do tipo. Se você tem necessidades mais
% específicas, você pode procurar no Google, adicionando os termos de busca
% 'LaTeX' e 'packages'. Um endereço muito útil é o http://ctan.org/, que é um
% repositório bem abrangente do TeX.
%
% O que o pacote faz basicamente é redefinir o comando \maketitle to LaTeX,
% gerando a capa, folha de rosto e etc. de acordo com as normas da UFC.
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%80
\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{ufc}[2014/04/24 v.0.1 Normalizacao de trabalhos academicos da Universidade federal do Ceara]
\RequirePackage{ifthen}

\newboolean{ufc@tese}

\setboolean{ufc@tese}{false}


% Opções de classe
\DeclareOption{tese}{%
\setboolean{ufc@tese}{true}
}
\DeclareOption{dissertacao}{}
\DeclareOption{monografia}{}
\DeclareOption{artigo}{}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
% Utiliza A4 como tamanho padrão
\LoadClass[a4paper,10pt]{report}

% Pacotes essenciais para o funcionamento
%% Para ajustar as dimensões da página 
\RequirePackage{geometry}
%% Controla o espaçamento entre as linhas do texto. ABNT requer espaçamento 1.5
\RequirePackage{setspace}
\RequirePackage{etoolbox} % Para o truque com a contagem de orientadores
\RequirePackage{graphicx} % Para inclusão de figuras (não vá me dizer que sua
                          % tese não tem figuras?! Aposto que vai ser bem
                          % tediosa a leitura :P)

% Comandos internos
%% Coloca texto em negrito e caixa alta
\newcommand{\boldUppercase}[1]{\textbf{\MakeUppercase{#1}}}
%% Define geometria do verso da página
\newcommand{\verso}{\newgeometry{right=3cm,left=2cm,top=2cm,bottom=2cm}}
%% Define geometria do verso da página
\newcommand{\anverso}{\newgeometry{right=2cm,left=3cm,top=2cm,bottom=2cm}}
%% Espaçamento vertical
\def\vertskip{\vspace{60pt}}


% Armazena o título do trabalho
\newcommand{\ufc@titulo}{T\'itulo do trabalho}
\renewcommand{\title}[1]{\renewcommand{\ufc@titulo}{#1}}
\providecommand{\titulo}[1]{\renewcommand{\ufc@titulo}{#1}} % Comando em português

% Armazena o nome do autor
\newcommand{\ufc@autor}{Autor}
\renewcommand{\author}[1]{\renewcommand{\ufc@autor}{#1}}
\providecommand{\autor}[1]{\renewcommand{\ufc@autor}{#1}} % Comando em português

% Armazena o nome da universidade (pardrão - UFC)
\newcommand{\ufc@universidade}{Universidade Federal do Cear\'{a}}
\providecommand{\university}[1]{\renewcommand{\ufc@universidade}{#1}}
\providecommand{\universidade}[1]{\renewcommand{\ufc@universidade}{#1}} % Comando em português

% Armazena o nome do departamento
\newcommand{\ufc@departamento}{Nome do departamento}
\providecommand{\department}[1]{\renewcommand{\ufc@departamento}{#1}}
\providecommand{\departamento}[1]{\renewcommand{\ufc@departamento}{#1}} % Comando em português

% Armazena local
\newcommand{\ufc@local}{Fortaleza}
\providecommand{\local}[1]{\renewcommand{\ufc@local}{#1}}

% Armazena data de publicação
\newcommand{\ufc@data}{1900}
\providecommand{\data}[1]{\renewcommand{\ufc@data}{#1}}

\renewcommand{\maketitle}
{%
%% Capa
\anverso
\singlespacing
\begin{titlepage}
\centering
\includegraphics[scale=0.45]{brasaoUFC.pdf}\par
\vspace{10px}
\boldUppercase{\ufc@universidade}\par
\boldUppercase{\ufc@departamento}\par
%
\vspace{2cm}
%
\boldUppercase{\ufc@autor}\par
%
\vspace{2cm}
%
{\huge\boldUppercase{\ufc@titulo}}
%
\vfill
%
\boldUppercase{\ufc@local}\par
\boldUppercase{\ufc@data}
\end{titlepage} % Fim - Capa
%
%% Folha de rosto
%%% A folha de rosto tem espaçamento padrão da ABNT (1.5)
\anverso
\onehalfspacing
\begin{titlepage}
\centering
\MakeUppercase{\ufc@autor}\par
%
\vspace{2cm}
%
{\huge\ufc@titulo}
%
\vspace{2cm}
%
\begin{flushright}
\begin{minipage}{.5\textwidth}
{%
Projeto de tese apresentado ao Programa de Pós-Graduação em Física da
\ufc@universidade como parte dos requisitos para obtenção
do título de Doutor em Física.\par
\vspace{1cm}
Orientador: Prof. Dr. Carlos Alberto Santos de Almeida}
\end{minipage}
\end{flushright}\par
\vfill
%
\ufc@local\par
\ufc@data
\end{titlepage}
}


\renewenvironment{abstract}
{%

}

\newenvironment{agradecimentos}
{%

}

\endinput
