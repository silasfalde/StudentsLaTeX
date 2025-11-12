\ProvidesClass{assignment}[2025/04/16 v1.0 Assignment class]

\newif\if@newpages
\DeclareOption{newpages}{\@newpagestrue}
\newif\if@arabicsubsec
\DeclareOption{arabicsubsec}{\@arabicsubsectrue}
\newif\if@arabicsubsubsec
\DeclareOption{arabicsubsubsec}{\@arabicsubsubsectrue}

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
  enumerate,
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
\setlength{\parskip}{0.75em}

% Sections
\titleformat{\section}[block]{\if@newpages\clearpage\fi\normalfont\Large\bfseries}{\thesection}{1em}{}

% Subsections
\renewcommand{\thesubsection}{\thesection.\if@arabicsubsec\arabic{subsection}\else\Alph{subsection}\fi}
\titleformat{\subsection}[block]
{\normalfont\large\bfseries}{\thesubsection)}{0em}{\noindent\hrule height 0.8pt\relax\vspace{-1.5em}}
\titlespacing{\subsection}{0pt}{0.5em plus 1em}{0em plus 1em}

% Subsubsections
\renewcommand{\thesubsubsection}{\thesubsection.\if@arabicsubsubsec\arabic{subsubsection}\else\Roman{subsubsection}\fi}
\titleformat{\subsubsection}[block]
{\normalfont\normalsize\bfseries\textit}{\thesubsubsection)}{1em}{}
\titlespacing{\subsubsection}{0pt}{0em plus 1em}{0em plus 1em}

% Title
\renewcommand{\maketitle}{
  \begin{center}
    \LARGE\@title\vspace{1em}\\
    \Large\@class\vspace{1em}\\
    \normalsize\@author\vspace{1em}\\
    \normalsize\today
  \end{center}
}
