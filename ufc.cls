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

% Opções de classe
\DeclareOption{tese}{}
\DeclareOption{dissertacao}{}
\DeclareOption{monografia}{}
\DeclareOption{artigo}{}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
% Utiliza A4 como tamanho padrão
\LoadClass[a4paper]{report}

% Pacotes essenciais para o funcionamento
\RequirePackage{geometry} % Para ajustar as dimensões da página 
\RequirePackage{setspace} % Para espaçamento de linha
\RequirePackage{etoolbox} % Para o truque com a contagem de orientadores
\RequirePackage{graphicx} % Para inclusão de figuras (não vá me dizer que sua
                          % tese não tem figuras?! Aposto que vai ser bem
                          % tediosa a leitura :P)


\endinput
