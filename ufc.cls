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
\RequirePackage{etoolbox} % Para variáveis lógicas e truque com contagem de orientadores
\RequirePackage{mfirstuc} % Para capitalizar a primeira letra da palavra

% Definição de variáveis lógicas
%% Tipos de trabalhos acadêmicos suportados
\newbool{ufc@tese}
\newbool{ufc@dissertacao}
\newbool{ufc@monografia}
\newbool{ufc@qualificacao}
\newbool{ufc@artigo}

%% Para análise do número de orientadores e coorientadores
\newbool{ufc@semorientador}
\newbool{ufc@comcoorientador}
\newbool{ufc@semcoorientador}
\newbool{ufc@multiplosorientadores}
\newbool{ufc@multiploscoorientadores}

% Inicializa as variáveis lógicas definidas anteriormente
%% Valor padrão das variáveis é `false'
\boolfalse{ufc@tese}
\boolfalse{ufc@dissertacao}
\boolfalse{ufc@monografia}
\boolfalse{ufc@qualificacao}
\boolfalse{ufc@artigo}

\boolfalse{ufc@semorientador}
\boolfalse{ufc@comcoorientador}
\boolfalse{ufc@semcoorientador}
\boolfalse{ufc@multiplosorientadores}
\boolfalse{ufc@multiploscoorientadores}

% Definição das opções da classe
\DeclareOption{tese}{\booltrue{ufc@tese}}
\DeclareOption{dissertacao}{\booltrue{ufc@dissertacao}}
\DeclareOption{monografia}{\booltrue{ufc@monografia}}
\DeclareOption{qualificacao}{\booltrue{ufc@qualificacao}}
\DeclareOption{artigo}{\booltrue{ufc@artigo}}
\DeclareOption{rascunho}{\PassOptionsToClass{draft}{report}}
\DeclareOption*{\ClassWarning{ufc}{Opcao `\CurrentOption' desconhecida . Ignorando}}
\ExecuteOptions{tese} % tese é o formato padrão
\ProcessOptions
% Utiliza A4 como tamanho padrão, e fonte 12pt
\LoadClass[a4paper,12pt]{report}

% Pacotes essenciais para o funcionamento
%% Para ajustar as dimensões da página 
\RequirePackage{geometry}
%% Controla o espaçamento entre as linhas do texto. ABNT requer espaçamento 1.5
\RequirePackage{setspace}
\RequirePackage{graphicx} % Para inclusão de figuras (não vá me dizer que sua
                          % tese não tem figuras?! Aposto que vai ser bem
                          % tediosa a leitura :P)

% Comandos internos
%% Coloca texto em negrito e caixa alta
\newcommand{\boldUppercase}[1]{\MakeUppercase{\textbf{#1}}}
%% Define geometria do verso da página
\newcommand{\verso}{\newgeometry{right=3cm,left=2cm,top=2cm,bottom=2cm}}
%% Define geometria do verso da página
\newcommand{\anverso}{\newgeometry{right=2cm,left=3cm,top=2cm,bottom=2cm}}
%% Espaçamento vertical
\def\vertskip{\vspace{60pt}}

% Armazena o título do trabalho
\newcommand{\ufc@titulo}{t\'itulo do trabalho}
\renewcommand{\title}[1]{\renewcommand{\ufc@titulo}{#1}}
\providecommand{\titulo}[1]{\renewcommand{\ufc@titulo}{#1}} % Comando em português

% Armazena o nome do autor
\newcommand{\ufc@autor}{nome do autor}
\renewcommand{\author}[1]{\renewcommand{\ufc@autor}{#1}}
\providecommand{\autor}[1]{\renewcommand{\ufc@autor}{#1}} % Comando em português

% Armazena o nome da universidade (padrão - UFC)
\newcommand{\ufc@universidade}{Universidade Federal do Cear\'{a}}
\providecommand{\university}[1]{\renewcommand{\ufc@universidade}{#1}}
\providecommand{\universidade}[1]{\renewcommand{\ufc@universidade}{#1}} % Comando em português

% Armazena o nome do departamento
\newcommand{\ufc@departamento}{nome do departamento}
\providecommand{\department}[1]{\renewcommand{\ufc@departamento}{#1}}
\providecommand{\departamento}[1]{\renewcommand{\ufc@departamento}{#1}} % Comando em português

% Armazena o nome do departamento
\newcommand{\ufc@programa}{nome do programa}
\providecommand{\program}[1]{\renewcommand{\ufc@programa}{#1}}
\providecommand{\programa}[1]{\renewcommand{\ufc@programa}{#1}} % Comando em português

% Armazena o nome do curso
\newcommand{\ufc@curso}{F\'{i}sica}

% Armazena local
\newcommand{\ufc@local}{local de publica\c{c}\~{a}o}
\providecommand{\local}[1]{\renewcommand{\ufc@local}{#1}}

% Armazena data de publicação
\newcommand{\ufc@data}{ano de publica\c{c}\~{a}o}
\providecommand{\data}[1]{\renewcommand{\ufc@data}{#1}}

\newcommand{\ufc@grau}{grau}
\newcommand{\ufc@tipo}{tipo de documento}
\newcommand{\ufc@apresent}{apresentada}

%% Análise das opções da classe, e atribuição das variáveis textuais apropriadas
\ifbool{ufc@tese}{%
\renewcommand{\ufc@grau}{doutor}
\renewcommand{\ufc@tipo}{tese}
\renewcommand{\ufc@apresent}{apresentada}
\renewcommand{\ufc@programa}{programa de p\'{o}s-gradua\c{c}\~{a}o em \ufc@curso}
}{}

\newcommand{\ufc@orientador}{nome do orientador}
\newcommand{\ufc@coorientador}{nome do coorientador}

% Armazena orientador(es)
\newcommand{\orientador}[2][1]
{
\renewcommand{\ufc@orientador}{#2}
\ifnumless{#1}{1}
    {% true
    \booltrue{ufc@semorientador}
    \boolfalse{ufc@multiplosorientadores}
    }
    {% false
    }
\ifnumequal{#1}{1}
    {% true
    \boolfalse{ufc@semorientador}
    \boolfalse{ufc@multiplosorientadores}
    }
    {% false
    }
\ifnumgreater{#1}{1}
    {% true
    \boolfalse{ufc@semorientador}
    \booltrue{ufc@multiplosorientadores}
    }
    {% false
    }
}
% Armazena coorientador(es)
\newcommand{\coorientador}[2][1]
{
\renewcommand{\ufc@coorientador}{#2}
\ifnumless{#1}{1}
    {% true
    \boolfalse{ufc@comcoorientador}
    \booltrue{ufc@semcoorientador}
    \boolfalse{ufc@multiploscoorientadores}
    }
    {% false
    }
\ifnumequal{#1}{1}
    {% true
    \booltrue{ufc@comcoorientador}
    \boolfalse{ufc@semcoorientador}
    \boolfalse{ufc@multiploscoorientadores}
    }
    {% false
    }
\ifnumgreater{#1}{1}
    {% true
    \booltrue{ufc@comcoorientador}
    \boolfalse{ufc@semcoorientador}
    \booltrue{ufc@multiploscoorientadores}
    }
    {% false
    }
}

%% Versão robusta de quebra de linha, para o comando \MakeUppercase
\newcommand{\e}{\protect\\}


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
\xmakefirstuc{\ufc@tipo} \ufc@apresent\ ao \ufc@programa\ da
\ufc@universidade\ como parte dos requisitos para obten\c{c}\~{a}o
do t\'{i}tulo de \xmakefirstuc{\ufc@grau} em \xmakefirstuc{\ufc@curso}.\par
\vspace{1cm}
\end{minipage}
\end{flushright}\par
\ifbool{ufc@multiplosorientadores}
{Orientadores:\par}{Orientador:\par}
\ufc@orientador\par
\vspace{60pt}
\ifbool{ufc@comcoorientador}
{%% true
\ifbool{ufc@multiploscoorientadores}
{Coorientadores:\par}{Coorientador:\par}
\ufc@coorientador
}
{% false
}
\vfill
%
\ufc@local\par
\ufc@data
\end{titlepage}
}

%% (Re)define o ambiente `abstract', para acomodar as páginas de
%% abstract, resumo e agradecimentos de acordo com os requisitos
%% das normas ABNT
\renewenvironment{abstract}
{%
  \titlepage
   \null\vfil
   \@beginparpenalty\@lowpenalty
   \begin{center}%
     \bfseries ABSTRACT
     \@endparpenalty\@M
   \end{center}%
}%
{\par\vfil\null\endtitlepage}

\newenvironment{resumo}
{%
  \titlepage
   \null\vfil
   \@beginparpenalty\@lowpenalty
   \begin{center}%
     \bfseries RESUMO
     \@endparpenalty\@M
   \end{center}%
}%
{\par\vfil\null\endtitlepage}

\newenvironment{agradecimentos}
{%
  \titlepage
   \null\vfil
   \@beginparpenalty\@lowpenalty
   \begin{center}%
     \bfseries AGRADECIMENTOS
     \@endparpenalty\@M
   \end{center}%
}%
{\par\vfil\null\endtitlepage}

\newenvironment{dedicatoria}
{%
  \titlepage
  \null\vspace{17.5cm}
  \begin{flushright}
  \begin{minipage}{0.4\textwidth}
  \itshape
}
{\par\vfil\null\end{minipage}\end{flushright}\endtitlepage}

\newenvironment{epigrafe}
{%
  \titlepage
  \null\vspace{17.5cm}
  \begin{flushright}
  \begin{minipage}{0.4\textwidth}
  \itshape
}
{\par\vfil\null\end{minipage}\end{flushright}\endtitlepage}

\endinput
