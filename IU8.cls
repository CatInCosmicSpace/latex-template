\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IU8}[2020/06/01 IU8 class]
\LoadClass{article}

\renewcommand\maketitle\courseworkTitle
\DeclareOption{coursework}{
    \renewcommand\maketitle\courseworkTitle
}
\DeclareOption{research}{
    \renewcommand\maketitle\researchTitle
}
\ExecuteOptions{coursework}
\ProcessOptions

\renewcommand\normalsize{\fontsize{14pt}{14pt}\selectfont}
\usepackage[T2A]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[russian]{babel}

\pagenumbering{arabic}
\pagestyle{empty} 

\RequirePackage[a4paper, left=30mm, top=20mm, right=10mm, bottom=20mm, footskip=3em]{geometry}
\RequirePackage{indentfirst}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{hhline}
\RequirePackage{amsmath}
\RequirePackage{ulem}
\RequirePackage{stackrel}
\RequirePackage{lineno}
\RequirePackage{mathtools}
\RequirePackage{adjustbox}
\RequirePackage{xassoccnt}
\RequirePackage{lastpage}

\setlength{\parindent}{15mm}
\linespread{1.5}

\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000

% ===============================================
%  Форматирование заголовков и названий разделов
% ===============================================
% В содержание включаются заголовки разделов, подразделов (при необходимости - пунктов) 
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

\renewcommand\thepart         {\@arabic\c@part}
\renewcommand\thesection      {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}

% Формат команды:
% \newcommand\part{
%     \@startsection{part} % name
%     {1} % level
%     {0pt} % indent
%     {1em} % beforeskip
%     {1em} % afterskip
%     {\bfseries\centering} % style
% }

\renewcommand\part{\clearpage\@startsection{part}{1}{0pt}{1em}{1em}{\bfseries\centering}}
\renewcommand\section{\@startsection{section}{2}{\parindent}{1em}{1em}{\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{3}{\parindent}{1em}{1em}{\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{4}{\parindent}{1em}{1em}{\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{5}{\parindent}{1em}{1em}{\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}{1em}{1em}{\bfseries}}

% ===============================================
%  Определения для форматирования содержания
% ===============================================
% \renewcommand\@pnumwidth{1.5em}
% \renewcommand\@tocrmarg{1em}
% \renewcommand\@dotsep{2}

\renewcommand{\l@part}           {\@dottedtocline{1}{0mm}{1em}}
\renewcommand{\l@section}        {\@dottedtocline{2}{.8em}{2em}}
\renewcommand{\l@subsection}     {\@dottedtocline{3}{1.6em}{2.7em}}
\renewcommand{\l@subsubsection}  {\@dottedtocline{4}{2.4em}{3.5em}}
\renewcommand{\l@paragraph}      {\@dottedtocline{5}{3.2em}{4.8em}}
\renewcommand{\l@subparagraph}   {\@dottedtocline{6}{5.0em}{4.8em}}
\renewcommand*{\l@figure}        {\@dottedtocline{1}{1.5em}{2.3em}}
\renewcommand*{\l@table}         {\@dottedtocline{1}{1.5em}{2.3em}}
\renewcommand\tableofcontents{%
    \clearpage%
    \part*{СОДЕРЖАНИЕ}
    \@starttoc{toc}%
}

% ===============================================
%  Титульный лист
% ===============================================
\RequirePackage{IU8-title}

% ===============================================
%  Стандарт отчётов
% ===============================================
\newcommand\Abstract{
    \part*{РЕФЕРАТ}
}
\newcommand\Introduction{
    \clearpage
    \part*{ВВЕДЕНИЕ}
    \addcontentsline{toc}{part}{ВВЕДЕНИЕ}
}
\newcommand\General{
    \clearpage
    \part*{ОСНОВНАЯ~ЧАСТЬ}
    \addcontentsline{toc}{part}{ОСНОВНАЯ~ЧАСТЬ}
}
\newcommand\Conclusion{
    \clearpage
    \part*{ЗАКЛЮЧЕНИЕ}
    \addcontentsline{toc}{part}{ЗАКЛЮЧЕНИЕ}
}
 
% === Подписи к рисункам и таблицам ===
\RequirePackage[normal,nooneline]{caption}
\DeclareCaptionLabelSeparator*{emdash}{\space---\space}
\captionsetup{labelsep=emdash,aboveskip=10pt,belowskip=0pt,position=bottom}
\captionsetup[figure]{justification=centering}
\captionsetup[table]{position=top,aboveskip=5pt,justification=justified}

\def\fps@figure{htp!}
\def\fnum@figure{Рисунок~\thefigure}

\def\fps@table{htp!}
\def\fnum@table{Таблица~\thetable}


\NewTotalDocumentCounter{totalfigures}
\NewTotalDocumentCounter{totaltables}
\NewTotalDocumentCounter{totalcites}
\NewTotalDocumentCounter{totalappendices}
\DeclareAssociatedCounters{figure}{totalfigures}
\DeclareAssociatedCounters{table}{totaltables}
\DeclareAssociatedCounters{biblio}{totalcites}
\newcounter{apps}
\DeclareAssociatedCounters{apps}{totalappendices}

\newcommand{\Bibliography}[1]{
  \bibliographystyle{ugost2008}
  \bibliography{#1}
}



\setlength\leftmargini  {15mm+2em}
\leftmargin\leftmargini
\setlength\leftmarginii  {15mm}
\setlength\leftmarginiii {3em}
\setlength\leftmarginiv  {3em}
\setlength\leftmarginv  {3em}
\setlength\leftmarginvi {3em}
\setlength  \labelsep  {0.7em}
\setlength  \labelwidth{\leftmargini}


\renewcommand\theenumi{\russian@alph\c@enumi}
\renewcommand\theenumii{\@arabic\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\renewcommand\labelenumi{\theenumi)}
\renewcommand\labelenumii{\theenumii)}
\renewcommand\labelenumiii{\theenumiii)}
\renewcommand\labelenumiv{\theenumiv)}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}

\newcommand\labelitemfont{\normalfont}
\renewcommand\labelitemi  {\labelitemfont \bfseries \textemdash}
\renewcommand\labelitemii {\labelitemfont \bfseries \textemdash}
\renewcommand\labelitemiii{\labelitemfont \bfseries \textemdash}
\renewcommand\labelitemiv {\labelitemfont \bfseries \textemdash}

\RequirePackage{longtable}
\RequirePackage{subcaption}
\RequirePackage{fix-cm}
\pagestyle{plain}
\sloppy

\RequirePackage{todonotes}

\newcounter{biblio}


\RequirePackage[acronym, nopostdot, toc, xindy={glsnumbers=false, language=russian}]{glossaries}
\GlsSetXdyCodePage{utf8}
\RequirePackage{glossaries}
\RequirePackage[automake]{glossaries-extra}
\newglossarystyle{terms}{%  
 \renewenvironment{theglossary}%  
  {В настоящем отчёте применяются следующие термины с соответствующими определениями:
      \begin{longtable}{lp{4cm+\glsdescwidth}p{\glspagelistwidth-1cm}}}%  
  {\end{longtable}}%  
  \renewcommand*{\glsgroupheading}[1]{}%  
  \renewcommand*{\glossentry}[2]{%  
    \glsentryitem{##1}% Entry number if required  
    \glstarget{##1}{\glossentryname{##1}}% Name  
    & \glossentrydesc{##1}% Description 
    \tabularnewline % end of row  
  }%   
 \renewcommand*{\glsgroupskip}{}%  
}
\makeglossaries
\setglossarysection{part}
\newcommand\glossaries{
    \clearpage
    \printunsrtglossary[style=terms, title={ОПРЕДЕЛЕНИЯ,~ОБОЗНАЧЕНИЯ~И~СОКРАЩЕНИЯ}, toctitle={ОПРЕДЕЛЕНИЯ,~ОБОЗНАЧЕНИЯ~И~СОКРАЩЕНИЯ}, nonumberlist]
}

\RequirePackage[
  bookmarks=true, colorlinks=true, unicode=true,
  urlcolor=black,linkcolor=black, anchorcolor=black,
  citecolor=black, menucolor=black, filecolor=black,
]{hyperref}

\RequirePackage{fancyhdr}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C] {\thepage}


% ======================
%  Поддержка алгоритмов
% ======================

\RequirePackage[linesnumbered,boxruled]{algorithm2e} 
\SetAlCapSty{}
% Перевод плагина
 
\SetKwInput{KwData}{Исходные параметры}
\SetKwInput{KwResult}{Результат}
\SetKwInput{KwIn}{Входные данные}
\SetKwInput{KwOut}{Выходные данные}
\SetKwIF{If}{ElseIf}{Else}{если}{тогда}{иначе если}{иначе}{конец условия}
\SetKwFor{While}{до тех пор, пока}{выполнять}{конец цикла}
\SetKw{KwTo}{от}
\SetKw{KwRet}{возвратить}
\SetKw{Return}{возвратить}
\SetKwBlock{Begin}{начало блока}{конец блока}
\SetKwSwitch{Switch}{Case}{Other}{Проверить значение}{и выполнить}{вариант}{в противном случае}{конец варианта}{конец проверки значений}
\SetKwFor{For}{цикл}{выполнять}{конец цикла}
\SetKwFor{ForEach}{для каждого}{выполнять}{конец цикла}
\SetKwRepeat{Repeat}{повторять}{до тех пор, пока}
\SetAlgorithmName{Алгоритм}{алгоритм}{Список алгоритмов}
\SetAlgoCaptionSeparator{~---}
% \SetAlgoCaptionLayout{centerline}
\renewcommand{\@algocf@capt@plain}{above}

\RequirePackage{amsthm}
\theoremstyle{definition}
\newtheorem{definition}{Определение}
\newtheorem{theorem}{Теорема}
\newtheorem{corollary}{Следствие}[theorem]
\newtheorem{lemma}{Лемма}
\newtheorem{example}{Пример}



\RequirePackage{listings}
\usepackage{xcolor}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=t,      
    xleftmargin=2em,              
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}
\lstset{style=mystyle}
\newcommand{\listing}[2][]{%
    \lstinputlisting[caption={\texttt{\detokenize{#2}}},#1]{#2}%
}

\usepackage{titlesec}
\usepackage[title,titletoc]{appendix}

\newcommand{\apppart}[1]{
    \stepcounter{apps}
    \part*{\Asbuk{apps}}
    \paragraph{\centerline{{#1}}}
    \addcontentsline{toc}{part}{ПРИЛОЖЕНИЕ~\Asbuk{apps}~{#1}}
}

\renewcommand{\appendix}{
    \renewcommand\part{\clearpage\@startsection{part}{1}{0pt}{1em}{1em}{\bfseries\centering ПРИЛОЖЕНИЕ~}}
    \setcounter{part}{0}
    \setcounter{figure}{0}    
    \setcounter{table}{0}    
    \setcounter{equation}{0}    
    \renewcommand\thefigure{\Asbuk{apps}.\arabic{figure}} 
    \renewcommand\thetable{\Asbuk{apps}.\arabic{figure}} 
    \renewcommand\theequation{\Asbuk{apps}.\arabic{figure}} 
}

\renewcommand\@biblabel{}%
\renewenvironment{thebibliography}[1]
    {
        \clearpage
        \part*{СПИСОК~ИСПОЛЬЗОВАННЫХ~ИСТОЧНИКОВ}%
        \addcontentsline{toc}{part}{СПИСОК~ИСПОЛЬЗОВАННЫХ~ИСТОЧНИКОВ}
        \list{\@biblabel{\@arabic\c@biblio}. }
           {\settowidth\labelwidth{\@biblabel{#1}. }
            \leftmargin\labelsep
            \itemindent 16.7mm
            \@openbib@code
            \usecounter{biblio}
            \let\p@biblio\@empty
            \renewcommand\thebiblio{\@arabic\c@biblio}
        }
        \setlength{\itemsep}{0pt}
    }
\endinput
