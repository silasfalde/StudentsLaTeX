\ProvidesClass{essay}[2024/12/25 Essay class]
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
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extreport}}

\ProcessOptions\relax

\geometry{margin=0.75in}

\newcommand{\class}[1]{\newcommand{\@class}{#1}}
\author{Silas Falde}

\usepackage[colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue]{hyperref}

% Title
\renewcommand{\maketitle}{{
            \centering
            \vspace*{1cm}

            \includegraphics[width=0.4\textwidth]{umich-logo.png}
            \vspace{1cm}

            {\Huge\bfseries \@title \par}
            \vspace{0.5cm}

            {\Large \@author \par}

            \vfill

            {\large\today\par}
            \newpage
        }}