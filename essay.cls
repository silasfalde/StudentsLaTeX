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

\newcommand{\@class}{}
\newcommand{\class}[1]{\renewcommand{\@class}{#1}}
\newcommand{\@titlelogo}{}
\newcommand{\titlelogo}[1]{\renewcommand{\@titlelogo}{#1}}

\usepackage[colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue]{hyperref}

% Title
\renewcommand{\maketitle}{{
            \centering
            \vspace*{1cm}

            \ifx\@titlelogo\@empty\else
                \@titlelogo
                \vspace{1cm}
            \fi

            {\Huge\bfseries \@title \par}
            \vspace{0.5cm}

            {\Large \@author \par}

            \vfill

            {\large\today\par}
            \newpage
        }}