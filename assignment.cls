\ProvidesClass{assignment}[2025/04/16 v1.0 Assignment class]

\newif\if@newpages
\DeclareOption{newpages}{\@newpagestrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extreport}}

\ProcessOptions\relax

\LoadClass{article}

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
\input{math-commands}
\input{programming-commands}

% Variables
\author{Silas Falde}
\newcommand{\class}[1]{\newcommand{\@class}{#1}}

% Page layout
\geometry{margin=1in}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5em}

% Sections
\titleformat{\section}[block]{\if@newpages\clearpage\fi\normalfont\Large\bfseries}{\thesection}{1em}{}

% Subsections
\renewcommand{\thesubsection}{\Alph{subsection}}
\titleformat{\subsection}[block]
{\normalfont\normalsize\bfseries}{\thesubsection)}{1em}{}

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