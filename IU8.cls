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

\RequirePackage{IU8/IU8-glossaries}
\RequirePackage{IU8/IU8-base}
\RequirePackage{IU8/IU8-biblio}
\RequirePackage{IU8/IU8-extra}
\RequirePackage{IU8/IU8-algorithm}
\RequirePackage{IU8/IU8-listings}
\RequirePackage{IU8/IU8-headings}
\RequirePackage{IU8/IU8-counters}
\RequirePackage{IU8/IU8-structure-elements}
\RequirePackage{IU8/IU8-contents}
\RequirePackage{IU8/IU8-figures}
\RequirePackage{IU8/IU8-tables}
\RequirePackage{IU8/IU8-enums}
\RequirePackage{IU8/IU8-title}
\RequirePackage{IU8/IU8-appendicies}
\usepackage{tabularx}
\usepackage{longtable}
\usepackage{hhline}

\RequirePackage[
  bookmarks=true, colorlinks=true, unicode=true,
  urlcolor=black, linkcolor=black, anchorcolor=black,
  citecolor=black, menucolor=black, filecolor=black,
]{hyperref} % Кликабельные ссылки в pdf

\RequirePackage{todonotes}
\sloppy % Запретить выход за поля
