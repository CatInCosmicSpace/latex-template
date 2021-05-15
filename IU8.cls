\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IU8}[2020/06/01 IU8 class]

\LoadClass{article}

\DeclareOption{diploma}{
    \renewcommand\maketitle\diplomaTitle
}
\ExecuteOptions{diploma}
\ProcessOptions

\RequirePackage[T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[russian]{babel}

% =================================================
%         Списки терминов и сокращений
% =================================================
\RequirePackage[acronym, automake, nopostdot, xindy={glsnumbers=false, language=russian}]{glossaries}
\GlsSetXdyCodePage{utf8}
\RequirePackage{glossaries}
\RequirePackage[abbreviations]{glossaries-extra}

\renewcommand{\glossarysection}[2][]{}

\newglossarystyle{terms}{%  
 \renewenvironment{theglossary}{}{}
  \renewcommand*{\glossentry}[2]{  
    \noindent\glstarget{##1}{\glossentryname{##1}}~\textemdash~\glossentrydesc{##1}
    \newline
  } 
 \renewcommand*{\glsgroupskip}{}%  
}

\newglossarystyle{definitions}{%  
 \renewenvironment{theglossary}{}{}
  \renewcommand*{\glossentry}[2]{  
    \noindent\glstarget{##1}{\glossentryname{##1}}~\textemdash~\glossentrydesc{##1}
    \newline
  } 
 \renewcommand*{\glsgroupskip}{}%  
}

\makeglossaries


% =================================================
%                 Базовые настройки
% =================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{IU8/IU8-base}[2021/03/21 v1.0]

% ГОСТ 7.32-2017. Пункт 6.1:
% Текст отчета следует печатать, соблюдая следующие размеры полей: 
% левое - 30 мм, правое - 15 мм, верхнее и нижнее - 20 мм.
% Используется формат A4
\RequirePackage[
    a4paper, 
    left=30mm, right=10mm, top=20mm, bottom=20mm, 
    footskip=10mm, % Для расположения номера страницы на 10 мм выше края листа
    ignoreall,
]{geometry}
% Ты там пишешь, что правое поле должно быть 15 мм, 
% а потом ставишь его в 10 мм. Почему? 
% А потому что в программе TestVKR проходит только 10 мм, а не 15 мм ¯\_(ツ)_/¯

% ГОСТ 7.32-2017. Пункт 6.1:
% Цвет шрифта должен быть черным, размер шрифта - не менее 12 пт.
% Рекомендуемый тип шрифта для основного текста отчета - Times New Roman.
\RequirePackage[fontsize=14pt]{scrextend}
% Но у Times New Roman нет открытой реализации, так что будет стандартный
% Или можете попробовать xelatex:
% \RequirePackage{fontspec}
% \setmainfont{Times New Roman}

% ГОСТ 7.32-2017. Пункт 6.1:
% Абзацный отступ должен быть одинаковым по всему тексту отчета и равен 1,25 см.
\setlength{\parindent}{1.25cm}
\RequirePackage{indentfirst} % Отступ первой строки для абзацев

% ГОСТ 7.32. Пункт 6.1:
% Отчет о НИР должен быть выполнен любым печатным способом на одной стороне 
% листа белой бумаги формата А4 через полтора интервала.
\RequirePackage{setspace}
\onehalfspacing

% ГОСТ 7.32. Пункт 6.3.1:
% Страницы отчета следует нумеровать арабскими цифрами, 
% соблюдая сквозную нумерацию по всему тексту отчета,
% включая приложения. 
% Номер страницы проставляется в центре нижней части страницы без точки.
\pagenumbering{arabic}
\pagestyle{plain}

\RequirePackage[none]{hyphenat} % Отключим переносы, так красивее
\RequirePackage{lastpage}


% =================================================
%                 Список источников
% =================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{IU8/IU8-biblio}[2021/03/21 v1.0]

\bibliographystyle{gost2008}
\renewcommand{\@biblabel}[1]{#1.}
\renewenvironment{thebibliography}[1]{
    \structure{СПИСОК~ИСПОЛЬЗОВАННЫХ~ИСТОЧНИКОВ}
    \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}}{}

\addto{\captionsrussian}{%
    \renewcommand{\refname}{
        \structure*{СПИСОК~ИСПОЛЬЗОВАННЫХ~ИСТОЧНИКОВ}
        \addcontentsline{toc}{section}{СПИСОК~ИСПОЛЬЗОВАННЫХ~ИСТОЧНИКОВ}
    }
}


\RequirePackage{fancyhdr}
\fancypagestyle{year}{%
  \fancyfoot[C]{\itshape Москва, \the\year~г.}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead{}
}
\RequirePackage{tabto}
\RequirePackage{ulem}
\RequirePackage[usestackEOL]{stackengine}
\RequirePackage{lineno}


\newcommand\makeBMSTUHeader{
    \thispagestyle{year}
    \noindent\begin{minipage}{0.05\textwidth}
        \includegraphics[scale=0.4]{inc/bmstu.png}
    \end{minipage}
    \hfill
    \begin{minipage}{0.85\textwidth}\raggedleft
        \begin{center}
            \fontsize{10pt}{0.3\baselineskip}\selectfont 
            \textbf{Министерство науки и высшего образования 
                Российской Федерации \\ 
                Федеральное государственное бюджетное образовательное 
                учреждение \\ 
                высшего образования \\ 
                <<Московский государственный технический университет \\ 
                имени Н. Э. Баумана \\ 
                (национальный исследовательский университет)>> \\ 
                (МГТУ им. Н. Э. Баумана)
            }
        \end{center}
    \end{minipage}
    \begin{center}
        \fontsize{12pt}{0.1\baselineskip}\selectfont
        \noindent\makebox[\linewidth]{\rule{\textwidth}{2pt}} 
        \makebox[\linewidth]{\rule{\textwidth}{1pt}}
    \end{center}
    \begin{flushleft}
        \fontsize{12pt}{14pt}\selectfont
        ФАКУЛЬТЕТ \tabto{3cm} <<Информатика и системы управления>> (ИУ)\\
        КАФЕДРА \tabto{3cm} <<Информационная безопасность>> (ИУ8)
    \end{flushleft}
}

\newcommand\makeUlineStack[3][3cm]{
    \Shortunderstack{
        \uline{\parbox{#1}{\centering #2}}\\
        {\fontsize{9pt}{9pt}\selectfont #3}
    }
}

\newcommand\fillingBox[3][3.5cm]{
    \noindent#2 \hfill \makeUlineStack[2.5cm]{~}{(Подпись, дата)} \quad 
    \makeUlineStack[#1]{#3}{(И. О. Фамилия)}\\
}

\newcommand\makeDiplomaTheme[1]{
    \noindent
    \begin{minipage}{\linewidth}
        \centering\internallinenumbers\rmfamily\bfseries\fontsize{20pt}{20pt}\selectfont
        \renewcommand{\makeLineNumber}{\rule[-0.7ex]{\textwidth}{0.4pt}\hss}%
        #1
    \end{minipage}
}

\RequirePackage{amsthm}
\theoremstyle{definition}
\newtheorem{definition}{Определение}[section]
\newtheorem{theorem}{Теорема}[section]
\newtheorem{corollary}{Следствие}[theorem]
\newtheorem{lemma}{Лемма}[section]
\newtheorem{example}{Пример}[section]


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


% =================================================
%                 Стили заголовков
% =================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{IU8/IU8-headings}[2021/03/21 v1.0]
\usepackage{titlesec}

\titleformat{\section}[block]{\hspace{\parindent}\normalfont\bfseries}{\thesection}{1em}{}
% Структурный элемент. Не использовать просто так!
% ГОСТ 7.32-2017. Пункт 6.2.1:
% Заголовки структурных элементов следует располагать 
% в середине строки (\centering)
% без точки в конце, прописными буквами, не подчеркивая. 
% Каждый структурный элемент и каждый раздел основной части отчета начинают 
% с новой страницы (\clearpage).
% \newcounter{structure}
% \renewcommand\thestructure{\@arabic\c@structure}
% \newcommand\structure{\@startsection{structure}{0}{0pt}
%         {1mm} % Отступ до заголовка
%         {1mm} % Отступ после заголовка
%         {\clearpage\normalfont\normalsize\bfseries\centering} % Стиль шрифта
% }
\usepackage{chngcntr}
\newcounter{structure}

\usepackage{titletoc}
\renewcommand{\thestructure}{}
% \counterwithin{section}{structure}
\titleclass{\structure}{straight}[\section]
\titleformat{\structure}[hang]
  {\clearpage\normalfont\bfseries\centering}{}{1em}{}
\titlespacing*{\structure}{0pt}{3.5ex plus 1ex minus .2ex}{2.3 ex plus .2ex}
\titlecontents{structure}
  {}{}{}{}
% % ГОСТ 7.32-2017. Пункт 6.2.2:
% % Основную часть отчета следует делить на 
% % разделы (section), 
% % подразделы (subsection) и 
% % пункты (subsubsection). 
% % Пункты при необходимости могут делиться на 
% % подпункты (paragraph). 
% % Разделы и подразделы отчета должны иметь заголовки. 
% % Пункты и подпункты, как правило, заголовков не имеют.

% % ГОСТ 7.32-2017. Пункт 6.4.1:
% % Разделы должны иметь порядковые номера в пределах всего отчета, обозначенные 
% % арабскими цифрами (\@arabic\c@section) без точки и 
% % расположенные с абзацного отступа (\indent).
\titleformat{\section}[block]{\clearpage\hspace{\parindent}\normalfont\bfseries}{\thesection}{1em}{}

% % ГОСТ 7.32-2017. Пункт 6.4.1:
% % Подразделы должны иметь нумерацию в пределах каждого раздела. 
% % Номер подраздела состоит из номеров раздела и подраздела, разделенных точкой. 
% % В конце номера подраздела точка не ставится.
\titleformat{\subsection}[block]{\hspace{\parindent}\normalfont\bfseries}{\thesubsection}{1em}{}

% % ГОСТ 7.32-2017. Пункт 6.4.1:
% % Разделы, как и подразделы, могут состоять из одного или нескольких пунктов.
\titleformat{\subsubsection}[block]{\hspace{\parindent}\normalfont\bfseries}{\thesubsubsection}{1em}{}

% % Параграф
\titleformat{\paragraph}[block]{\hspace{\parindent}\normalfont\bfseries}{\theparagraph}{1em}{}


% =================================================
%                 Счётчики
% =================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{IU8/IU8-counters}[2021/03/21 v1.0]

\RequirePackage{calc}
\RequirePackage{xassoccnt}
\RequirePackage{totcount}

\NewTotalDocumentCounter{totalfigures}
\DeclareAssociatedCounters{figure}{totalfigures}
\NewTotalDocumentCounter{totaltables}
\DeclareAssociatedCounters{table}{totaltables}
\NewTotalDocumentCounter{totalcites}
\DeclareAssociatedCounters{biblio}{totalcites}

\newcounter{apps}
\NewTotalDocumentCounter{totalappendices}
\DeclareAssociatedCounters{apps}{totalappendices}


% =================================================
%                 Структурные элементы
% =================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{IU8/IU8-structure-elements}[2021/03/21 v1.0]

% Этот файл посвящён основным структурным элементам. Здесь же будут 
% определены все структурные элементы отчёта

% ГОСТ 7.32-2017. Пункт 6.2.1:
% Наименования структурных элементов отчета: "СПИСОК ИСПОЛНИТЕЛЕЙ", "РЕФЕРАТ", 
% "СОДЕРЖАНИЕ", "ТЕРМИНЫ И ОПРЕДЕЛЕНИЯ", "ПЕРЕЧЕНЬ СОКРАЩЕНИЙ И ОБОЗНАЧЕНИЙ", 
% "ВВЕДЕНИЕ", "ЗАКЛЮЧЕНИЕ", "СПИСОК ИСПОЛЬЗОВАННЫХ ИСТОЧНИКОВ", 
% "ПРИЛОЖЕНИЕ" служат заголовками структурных элементов отчета.
% 
% У нас не используется пункт "СПИСОК ИСПОЛНИТЕЛЕЙ"

\renewcommand{\abstract}{
    \structure*{РЕФЕРАТ}
    
    Отчёт содержит \pageref{LastPage} стр.\ifnum
    \TotalValue{totalfigures}>0, \TotalValue{totalfigures} рис.\fi\ifnum
    \TotalValue{totaltables}>0, \TotalValue{totaltables} табл.\fi\ifnum
    \TotalValue{totalcites}>0, \TotalValue{totalcites} источн.\fi\ifnum
    \TotalValue{totalappendices}>0, \TotalValue{totalappendices} прил.\fi
}

\renewcommand\tableofcontents{ % Для прямого использования
    \structure*{СОДЕРЖАНИЕ}
    \@starttoc{toc}
}

\newcommand{\termsanddefenitions}{
    \structure{ТЕРМИНЫ~И~ОПРЕДЕЛЕНИЯ}

    В настоящем отчете о выпускной квалификационной работе специалиста
    применяют следующие термины с соответствующими определениями:

    \printunsrtglossary[
        style=terms,
        nonumberlist
    ]
}

\newcommand{\listofabbreviationsanddesignations}{
    \glsaddallunused
    \clearpage
    \structure{ПЕРЕЧЕНЬ~СОКРАЩЕНИЙ~И~ОБОЗНАЧЕНИЙ}

    В настоящем отчете о выпускной квалификационной работе специалиста
    применяют следующие следующие сокращения и обозначения:

    \printunsrtglossary[
        style=terms,
        type=\acronymtype
    ]
}

\newcommand{\introduction}{
    \structure{ВВЕДЕНИЕ}
}

\newcommand{\conclusion}{
    \structure{ЗАКЛЮЧЕНИЕ}
}

\newcommand{\references}[1]{{
        \bibliography{#1}
    }
}


% =================================================
%                 Стили содержания
% =================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{IU8/IU8-contents}[2021/03/21 v1.0]

% ГОСТ 7.32-2017. Пункт 5.4.1:
% Содержание включает введение (уровень 0), 
% наименование всех разделов (уровень 0) 
% и подразделов (уровень 1), 
% пунктов (если они имеют наименование) (уровень 2), 
% заключение (уровень 0), 
% список использованных источников (уровень 0) 
% и наименования приложений с указанием номеров страниц (уровень 0), 
% с которых начинаются эти элементы отчета о НИР.

% После заголовка каждого элемента ставят отточие и приводят номер страницы 
% работы, на которой начинается данный структурный элемент.

% Обычный абзацный отступ - 1,25 см - равен 5 печатным знакам. Нехитрыми
% вычислениями получаем, что 1 печатный знак = 2,5 мм.

% ГОСТ 7.32-2017. Пункт 6.13:
% Каждую запись содержания оформляют как отдельный абзац, выровненный влево.
\renewcommand*\l@section{\@dottedtocline{0}{0mm}{2em}}
\renewcommand*\l@structure{\@dottedtocline{0}{0mm}{0em}}
% ГОСТ 7.32-2017. Пункт 5.4.1:
% Обозначения подразделов приводят после абзацного отступа, 
% равного двум знакам, относительно обозначения разделов.
\renewcommand*\l@subsection{\@dottedtocline{1}{5mm}{3em}}
% ГОСТ 7.32-2017. Пункт 5.4.1:
% Обозначения пунктов приводят после абзацного отступа, 
% равного четырем знакам, относительно обозначения разделов.
\renewcommand*\l@subsubsection{\@dottedtocline{2}{10mm}{4em}}
% Остальное - индуктивно
\renewcommand*\l@paragraph{\@dottedtocline{3}{15mm}{5em}}

\setcounter{secnumdepth}{5} % Глубина заголовков - до пятого уровня
\setcounter{tocdepth}{2}    % Глубина содержания - до второго уровня


% =================================================
%                 Стили иллюстраций
% =================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{IU8/IU8-figures}[2021/03/21 v1.0]

\RequirePackage{float}      % Для положения в месте задания
\RequirePackage{setspace}   % Для интервалов

% ГОСТ 7.32. Пункт 6.5.1:
% Иллюстрации (чертежи, графики, схемы, компьютерные распечатки, 
% диаграммы, фотоснимки) следует располагать в отчете непосредственно после 
% текста отчета, где они упоминаются впервые, или на следующей странице 
% (по возможности ближе к соответствующим частям текста отчета). 
\def\fps@figure{htp!}

% ГОСТ 7.32. Пункт 6.5.4:
% Иллюстрации, за исключением иллюстраций, приведенных в приложениях, следует 
% нумеровать арабскими цифрами сквозной нумерацией. Если рисунок один, то он 
% обозначается: Рисунок 1.
\renewcommand\thefigure{\@arabic\c@figure} % Арабские цифры

\RequirePackage{caption}    % Настройка подписи
\captionsetup[figure]{
    % ГОСТ 7.32-2017. Пункт 6.5.7:
    % Слово "Рисунок", его номер и через тире наименование помещают после 
    % пояснительных данных и располагают 
    % в центре под рисунком без точки в конце.
    name=Рисунок,
    labelsep=endash, % Тире
    position=below,
    justification=centering, % Выравнивание по центру    
    % ГОСТ 7.32-2017. Пункт 6.5.8:
    % Если наименование рисунка состоит из нескольких строк, 
    % то его следует записывать через один межстрочный интервал.
    font={stretch=\setspace@singlespace},    
    width=0.8\linewidth, % Ограничение по длине, а то будет на всю строку
}


% =================================================
%                 Стили таблиц
% =================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{IU8/IU8-tables}[2021/03/21 v1.0]

\RequirePackage{float}      % Для положения в месте задания
\RequirePackage{setspace}   % Для интервалов
\RequirePackage{tabularx}   % Для настраиваемых таблиц
\RequirePackage{longtable}  % Для длинных таблиц
\RequirePackage{hhline}     % Для кастомного задания границ таблиц

% ГОСТ 7.32. Пункт 6.6.2:
% Таблицу следует располагать непосредственно после текста, 
% в котором она упоминается впервые, или на следующей странице.
\def\fps@table{htp!}

% ГОСТ 7.32. Пункт 6.6.4:
% Таблицы, за исключением таблиц приложений, 
% следует нумеровать арабскими цифрами сквозной нумерацией.
% \newcounter{table} % Счётчик иллюстраций
\renewcommand\thetable{\@arabic\c@table} % Арабские цифры

\RequirePackage{caption}    % Настройка подписи
\captionsetup[table]{
    % ГОСТ 7.32-2017. Пункт 6.6.3:
    % Наименование следует помещать над таблицей слева, 
    % без абзацного отступа в следующем формате: 
    % Таблица Номер таблицы - Наименование таблицы.
    name=Таблица,
    labelsep=endash, % Тире
    position=above,
    justification=justified, % Выравнивание по ширине    
    singlelinecheck=false,
    % ГОСТ 7.32-2017. Пункт 6.6.3:
    % Если наименование таблицы занимает две строки и более, 
    % то его следует записывать через один межстрочный интервал.
    font={stretch=\setspace@singlespace},
}

% В таблице допускается применять размер шрифта меньше, чем в тексте отчета.

% Продолжение длинных таблиц, к сожалению, нужно записывать руками


% =================================================
%                 Стили перечислений
% =================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{IU8/IU8-enums}[2021/03/21 v1.0]

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesPackage{IU8base}[2021/03/21 v1.0]

% ГОСТ 2.105-2019. Пункт 6.7.2:
% Перечисления записывают с абзацного отступа. 
\RequirePackage{enumitem}
\setlist{
    leftmargin=\dimexpr\parindent+1em\relax,
    labelindent=\parindent,
    labelwidth=\dimexpr1em,
    labelsep=!,
    align=left,
    nosep,
}

% ГОСТ 2.105-2019. Пункт 6.7.2:
% Перед каждой позицией перечисления следует ставить дефис или,
% при необходимости ссылки в тексте документа на одно из перечислений,
% строчную букву русского или латинского алфавита, 
% после которой ставится скобка.
% ГОСТ 7.32-2017. Пункт 6.4.6:
% Перед каждым элементом перечисления следует ставить тире. 
% При необходимости ссылки в тексте отчета на один из элементов перечисления 
% вместо тире ставят строчные буквы русского алфавита со скобкой, 
% начиная с буквы "а" (за исключением букв ё, з, й, о, ч, ъ, ы, ь). 
% Простые перечисления отделяются запятой, сложные - точкой с запятой.
\setlist[itemize]{label=\textendash}

\AddEnumerateCounter{\Asbuk}{\@Asbuk}{А}
\AddEnumerateCounter{\asbuk}{\@asbuk}{а}
\setlist[enumerate, 1]{label=\asbuk*)}

% ГОСТ 2.105-2019. Пункт 6.7.2:
% При необходимости дальнейшей детализации перечислений используют арабские 
% цифры, после которых ставится скобка, а запись приводят с абзацного 
% отступа, как показано в примере.
\setlist[enumerate, 2]{label=\arabic*)}
\setlist[enumerate, 3]{label=\alph*)}
\setlist[enumerate, 4]{label=\roman*)}

% NOTE: в Asbuk/asbuk следующие буквы: АБВГДЕЖЗИКЛМНОПРСТУФХЦЧШЩЭЮЯ.
% Уж не знаю, почему в ГОСТ так не любят букву З, но я её удалять, пожалуй,
% не буду 


\newcommand\theme[1]{
	\def\titleTheme{#1}
}
\newcommand\group[1]{
	\def\groupNumber{#1}
}
\newcommand\profile[1]{
	\def\profileNumber{#1}
}
\newcommand\student[1]{
	\def\studentName{#1}
}
\newcommand\studentFullName[1]{
	\def\studentFullNameForTitle{#1}
}
\newcommand\supervisor[1]{
	\def\supervisorName{#1}
}
\newcommand\economist[1]{
	\def\economistName{#1}
}
\newcommand\laws[1]{
	\def\lawsName{#1}
}
\newcommand\normcontroller[1]{
	\def\normcontrollerName{#1}
}
\newcommand\researchTheme[1]{
	\def\researchThemeName{#1}
}
\newcommand\speciality[1]{
	\def\specialityName{#1}
}
\newcommand\specialization[1]{
	\def\specializationName{#1}
}
\newcommand\supervisorDegree[1]{
    \def\degree{#1}
}


\newcommand\diplomaTitle{
    \makeBMSTUHeader
        
    \noindent\begin{center}
        \centering\bfseries\fontsize{20pt}{25pt}\selectfont 
        РАСЧЁТНО-ПОЯСНИТЕЛЬНАЯ~ЗАПИСКА\\
        {\fontsize{16pt}{25pt}\bfseries\selectfont К~ВЫПУСКОЙ~КВАЛИФИКАЦИОННОЙ~РАБОТЕ}\\
        {\fontsize{16pt}{25pt}\bfseries\selectfont НА~ТЕМУ:}
    \end{center}

    \vfill

    \makeDiplomaTheme{\titleTheme}

    \vfill
    
    {\fontsize{12pt}{15pt}\selectfont

    \fillingBox{Студент \hfill \makeUlineStack[2cm]{\groupNumber}{(Группа)}}{\studentName}

    \fillingBox{Руководитель ВКР}{\supervisorName}
    
    \fillingBox{Консультант по конструкторской части}{\supervisorName}
    
    \fillingBox{Консультант по исследовательской части}{\supervisorName}

    \fillingBox{Консультант по технологической части}{\supervisorName}

    \fillingBox{Консультант по организационно-\\экономической части}{\economistName}

    \fillingBox{Консультант по организационно-\\правовому обеспечению ИБ}{\lawsName}

    \fillingBox{Нормоконтролер}{\normcontrollerName}
    }

    \clearpage
}


% =================================================
%                 Приложения
% =================================================

\newcommand{\appendixsection}[1]{
    \stepcounter{apps}
    \section*{\Asbuk{apps}}
    \begin{center}
        \bfseries #1
    \end{center}
    \addcontentsline{toc}{section}{ПРИЛОЖЕНИЕ~\Asbuk{apps}~{#1}}
}

\renewcommand{\appendix}{
    \renewcommand\section{\clearpage\@startsection{section}{1}{0pt}{1em}{1em}{\bfseries\centering ПРИЛОЖЕНИЕ~}}
    \setcounter{section}{0}
    \setcounter{figure}{0}    
    \setcounter{table}{0}    
    \setcounter{equation}{0}    
    \renewcommand\thefigure{\Asbuk{apps}.\arabic{figure}} 
    \renewcommand\thetable{\Asbuk{apps}.\arabic{figure}} 
    \renewcommand\theequation{\Asbuk{apps}.\arabic{figure}} 
}


\usepackage{tabularx}
\usepackage{longtable}
\usepackage{hhline}

\RequirePackage[
  bookmarks=true, colorlinks=true, unicode=true,
  urlcolor=black, linkcolor=black, anchorcolor=black,
  citecolor=black, menucolor=black, filecolor=black,
]{hyperref} % Кликабельные ссылки в pdf
\usepackage{bookmark}
\def\toclevel@structure{1}
\usepackage[all, defaultlines=4]{nowidow}
\sloppy % Запретить выход за поля
