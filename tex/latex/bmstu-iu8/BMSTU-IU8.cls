% Author: CatInCosmicSpace
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BMSTU-IU8}[2024/10/28 IU8 class]

\LoadClass{article}

\DeclareOption{diploma}{
    \def\termsAndDefinitionsLine{В настоящем отчете о выпускной квалификационной работе специалиста
    применяют следующие термины с соответствующими определениями:}
    \def\abbreviationsLine{В настоящем отчете о выпускной квалификационной работе специалиста
    применяют следующие сокращения и обозначения:}
    \def\fillTitle{\fillDiplomaTitle}
}
\DeclareOption{research}{
    \def\termsAndDefinitionsLine{В настоящем отчете о НИР
    применяют следующие термины с соответствующими определениями:}
    \def\abbreviationsLine{В настоящем отчете о НИР
    применяют следующие сокращения и обозначения:}
    \def\fillTitle{\fillResearchTitle}
}
\DeclareOption{practice}{
	\def\termsAndDefinitionsLine{В настоящем отчёте о практике
		применяют следующие термины с соответствующими определениями:}
	\def\abbreviationsLine{В настоящем отчёте о практике
		применяют следующие сокращения и обозначения:}
	\def\fillTitle{\fillPracticeTitle}
}
\DeclareOption{ordinary}{
	\def\termsAndDefinitionsLine{В настоящем документе
		применяют следующие термины с соответствующими определениями:}
	\def\abbreviationsLine{В настоящем документе
		применяют следующие сокращения и обозначения:}
	\def\fillTitle{\fillOrdinaryTitle}
}

\ExecuteOptions{diploma}
\ProcessOptions

\RequirePackage[T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[russian]{babel}
\RequirePackage{hyphsubst}

\RequirePackage{IU8-01-base}
\RequirePackage{IU8-02-construction}
\RequirePackage{IU8-03-numbering}
\RequirePackage{IU8-04-section-numbering}
\RequirePackage{IU8-05-figures}
\RequirePackage{IU8-06-tables}
\RequirePackage{IU8-07-footnotes}
\RequirePackage{IU8-08-formulas}
\RequirePackage{IU8-09-cites}
\RequirePackage{IU8-10-titlepage}
\RequirePackage{IU8-11-performers}
\RequirePackage{IU8-12-abstract}
\RequirePackage{IU8-13-contents}
\RequirePackage{IU8-14-terms-and-definitions}
\RequirePackage{IU8-15-list-of-abbreviations}
\RequirePackage{IU8-16-references}
\RequirePackage{IU8-17-appendices}
\RequirePackage{IU8-18-extra}
\RequirePackage{IU8-19-counters}
\RequirePackage{IU8-20-listing}
\RequirePackage{IU8-21-math}
\RequirePackage{IU8-22-algorithms}

\RequirePackage{csquotes}

\makeglossaries
