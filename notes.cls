\ProvidesClass{notes}

\RequirePackage{xkeyval}

\newif\if@compact
\newcount\notes@columns
\notes@columns=2\relax

\DeclareOptionX{compact}{\@compacttrue}
\DeclareOptionX{columns}{\notes@columns=#1\relax}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{extreport}}

\ProcessOptionsX\relax

\LoadClass{extreport}

\RequirePackage{
  geometry,
  graphicx,
  titlesec,
  xcolor,
  tcolorbox,
  stmaryrd,
  amsmath,
  amssymb,
  enumitem,
}

\input{math-commands.tex}
\input{programming-commands.tex}

\usepackage[colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue]{hyperref}

% Names
\newcommand{\@class}{}
\newcommand{\class}[1]{\renewcommand{\@class}{#1}}
\newcommand{\@titlelogo}{}
\newcommand{\titlelogo}[1]{\renewcommand{\@titlelogo}{#1}}

% Chapters
\titleformat{\chapter}{\normalfont\large\bfseries}{\thechapter}{0.5em}{}[\titlerule]
\titleclass{\chapter}{straight}
\titlespacing{\chapter}{0pt}{1.5em plus 1em}{0.5em plus 0.5em}

% Sections
\titleformat{\section}[block]{\normalfont\normalsize\bfseries}{\thesection}{1em}{}
\titlespacing{\section}{0pt}{1.5em plus 1em}{0.5em plus 1em}

% Subsections
\titleformat{\subsection}[block]{\normalfont\small\bfseries}{\thesubsection}{1em}{}

% Itemize and Enumerate
\setlist[itemize]{itemsep=0em}
\setlist[enumerate]{itemsep=0em}


% Geometry
\setlength{\parindent}{0pt}
\geometry{margin=1in}

% Title
\renewcommand{\maketitle}{{
    \centering
    \vspace*{1cm}

    \ifx\@titlelogo\@empty\else
      \@titlelogo
      \vspace{1cm}
    \fi

    {\Huge\bfseries
      \ifx\@class\@empty\else\@class : \fi
      \@title \par}
    \vspace{0.5cm}

    {\Large \@author \par}

    \vfill

    {\large\today\par}
    \newpage
  }}

\if@compact
  \usepackage{mathptmx}
  \setlength{\parskip}{0cm}
  \setlength{\parindent}{0em}
  \geometry{margin=0.2in}
  \pagenumbering{gobble}
  \usepackage{multicol}
  \setlength{\columnsep}{1em}
  \setlength{\columnwidth}{0.3\textwidth}
  \AtBeginDocument{\begin{multicols*}{\the\notes@columns}}
  \AtEndDocument{\end{multicols*}}
  \setlist[itemize]{leftmargin=1em,itemsep=-5pt plus 1fill}
  \setlist[enumerate]{leftmargin=1em,itemsep=-5pt plus 1fill}
  \renewcommand{\part}[1]{} % make the part command do nothing
  \titlespacing{\chapter}{0pt}{0.5em plus 1em}{0.5em plus 0.5em}
\fi

\endinput
