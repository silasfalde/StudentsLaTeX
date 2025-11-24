\ProvidesClass{notes}

\newif\if@compact
\DeclareOption{compact}{\@compacttrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extreport}}

\ProcessOptions\relax

\LoadClass{extreport}

\RequirePackage{
  geometry,
  graphicx,
  titlesec,
  xcolor,
  tcolorbox,
  amsthm,
  stmaryrd,
  amsmath,
  amssymb,
}

\input{math-commands.tex}
\input{programming-commands.tex}

\usepackage[colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue]{hyperref}

\newtheorem{theorem}{Theorem}[chapter]

% Names
\newcommand{\class}[1]{\newcommand{\@class}{#1}}
\author{Silas Falde}

% Chapters
\titleformat{\chapter}{\normalfont\large\bfseries}{\thechapter}{0.5em}{}[\titlerule]
\titleclass{\chapter}{straight}
\titlespacing{\chapter}{0pt}{1.5em plus 1em}{0.5em plus 0.5em}

% Sections
\titleformat{\section}[block]{\normalfont\normalsize\bfseries}{\thesection}{1em}{}
\titlespacing{\section}{0pt}{1.5em plus 1em}{0.5em plus 1em}

% Subsections
\titleformat{\subsection}[block]{\normalfont\small\bfseries}{\thesubsection}{1em}{}


% Geometry
\setlength{\parindent}{0pt}
\geometry{margin=1in}

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

\if@compact
  \setlength{\parskip}{0em plus 1fill}
  \geometry{margin=0.25in}
  \pagenumbering{gobble}
  \usepackage{multicol}
  \setlength{\columnsep}{1em}
  \setlength{\columnwidth}{0.3\textwidth}
  \AtBeginDocument{\begin{multicols*}{3}}
      \AtEndDocument{\end{multicols*}}
  \usepackage{enumitem}
  \setlist[itemize]{leftmargin=1.5em,itemsep=0em plus 1fill}
  \setlist[enumerate]{leftmargin=1.5em,itemsep=0em plus 1fill}
  \renewcommand{\part}[1]{} % make the part command do nothing
  \titlespacing{\chapter}{0pt}{0.5em plus 1em}{0.5em plus 0.5em}
\fi

\endinput
