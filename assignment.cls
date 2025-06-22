\ProvidesClass{assignment}[2025/04/16 v1.0 Assignment class]
\LoadClass[10pt,letterpaper]{article}

\newif\if@sectionnewpage
\DeclareOption{sectionnewpage}{\@sectionnewpagetrue}
\ProcessOptions\relax

\RequirePackage{
  amsthm,
  amsmath,
  amssymb,
  xcolor,
  geometry,
  graphicx,
  csvsimple,
  titlesec,
}

\usepackage[colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue]{hyperref}

% Load custom commands
\input{statistics-commands}
\input{programming-commands}

% Variables
\author{Silas Falde}
\newcommand{\class}[1]{\newcommand{\@class}{#1}}

% Page layout
\geometry{margin=1in}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5em}

% Sections
\titleformat{\section}[block]{\if@sectionnewpage\clearpage\fi\normalfont\Large\bfseries}{\thesection}{1em}{}

% Subsubsections
\renewcommand{\thesubsubsection}{\Alph{subsubsection}}
\titleformat{\subsubsection}[block]
{\normalfont\normalsize\bfseries}{\thesubsubsection.}{1em}{}

% Title
\renewcommand{\maketitle}{
  \begin{center}
    \LARGE\@title\vspace{1em}\\
    \Large\@class\vspace{1em}\\
    \normalsize\@author\vspace{1em}\\
    \normalsize\today
  \end{center}
}

\endinput