\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IU8}[2020/06/01 IU8 class]

\LoadClass{article}

\DeclareOption{diploma}{
    \def\termsAndDefinitionsLine{В настоящем отчете о выпускной квалификационной работе специалиста
    применяют следующие термины с соответствующими определениями:}
    \def\abbreviationsLine{В настоящем отчете о выпускной квалификационной работе специалиста
    применяют следующие следующие сокращения и обозначения:}
    \def\fillTitle{\fillDiplomaTitle}
}
\DeclareOption{research}{
    \def\termsAndDefinitionsLine{В настоящем отчете о НИР
    применяют следующие термины с соответствующими определениями:}
    \def\abbreviationsLine{В настоящем отчете о НИР
    применяют следующие следующие сокращения и обозначения:}
    \def\fillTitle{\fillResearchTitle}
}
\ExecuteOptions{diploma}
\ProcessOptions

\RequirePackage[T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[russian]{babel}
\RequirePackage{hyphsubst}
\RequirePackage{csquotes}

\RequirePackage{01-IU8-base}
\RequirePackage{02-IU8-construction}
\RequirePackage{03-IU8-numbering}
\RequirePackage{04-IU8-section-numbering}
\RequirePackage{05-IU8-figures}
\RequirePackage{06-IU8-tables}
\RequirePackage{07-IU8-footnotes}
\RequirePackage{08-IU8-formulas}
\RequirePackage{09-IU8-cites}
\RequirePackage{10-IU8-titlepage}
\RequirePackage{11-IU8-performers}
\RequirePackage{12-IU8-abstract}
\RequirePackage{13-IU8-contents}
\RequirePackage{14-IU8-terms-and-definitions}
\RequirePackage{15-IU8-list-of-abbreviations}
\RequirePackage{16-IU8-references}
\RequirePackage{17-IU8-appendices}
\RequirePackage{18-IU8-extra}
\RequirePackage{19-IU8-counters}
\RequirePackage{20-IU8-listing}
\RequirePackage{21-IU8-math}
\RequirePackage{22-IU8-algorithms}

\makeglossaries
