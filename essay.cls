\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{essay}[2026/10/08 v2.0 Essay class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass{article}

\RequirePackage{
    parskip,
    array,
    ifthen,
    graphicx,
    geometry,
    amsmath,
    spacingtricks,
    pdflscape,
    titlesec,
}

% Shared style (palette, fonts) and layout
\RequirePackage{studentstyle}
\RequirePackage{studentlayout}

\geometry{margin=0.75in}

\StudentsHeadings{\Large}{\large}
\StudentsRunningHeader

% Title
\renewcommand{\maketitle}{\StudentsTitlePage}

% Links load last
\StudentsLoadLinks
\StudentsLoadCleveref

\endinput
