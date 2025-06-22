\ProvidesClass{notes}
\LoadClass[letterpaper]{report}

\DeclareOption{9pt}{\PassOptionsToClass{9pt}{report}}
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{report}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{report}}

\newif\if@compact
\DeclareOption{compact}{\@compacttrue}
\ProcessOptions\relax

\RequirePackage{
  geometry,
  graphicx,
  titlesec,
  xcolor,
  tcolorbox,
  amsthm,
  stmaryrd,
  amsmath,
}

\input{statistics-commands.tex}
\input{programming-commands.tex}

\usepackage[colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue]{hyperref}

\newtheorem{theorem}{Theorem}[chapter]

% Names
\newcommand{\class}[1]{\newcommand{\@class}{#1}}
\author{Silas Falde}

% Note Environment
\newenvironment{note}{
  \begin{tcolorbox}[colback=black!5!white,colframe=black,title={\centering{Note}}]
    }{
  \end{tcolorbox}
}

% Sections
\titleformat{\section}
{\normalfont\large\bfseries}{\thesection}{1em}{}
[\titlerule]
\titleformat{\subsection}[runin]
{\normalfont\normalsize\bfseries}{\thesubsection}
{10pt}{}
[.]

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
  \setlength{\parskip}{0.7em}
  \geometry{margin=0.5in, top=0.7in}
  \pagenumbering{gobble}
  \twocolumn
  \setlength{\columnsep}{1.5em}
  \renewcommand{\thesection}{\arabic{section}}
  \usepackage{enumitem}
  \setlist[itemize]{leftmargin=1.5em}
\fi

\endinput
