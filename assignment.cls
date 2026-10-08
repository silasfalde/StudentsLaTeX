\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2026/10/08 v2.0 Assignment class]

\newif\if@newpages
\DeclareOption{newpages}{\@newpagestrue}
\newif\if@arabicsubsec
\DeclareOption{arabicsubsec}{\@arabicsubsectrue}
\newif\if@arabicsubsubsec
\DeclareOption{arabicsubsubsec}{\@arabicsubsubsectrue}
\newif\if@nobox
\DeclareOption{nobox}{\@noboxtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass{article}

\RequirePackage{
  amsmath,
  amssymb,
  geometry,
  graphicx,
  csvsimple,
  titlesec,
  enumerate,
  enumitem,
  siunitx,
}

% Shared style (palette, fonts), boxed environments, and layout
\RequirePackage{studentstyle}
\if@nobox
  \RequirePackage[nobox]{studentboxes}
\else
  \RequirePackage{studentboxes}
\fi
\RequirePackage{studentlayout}

% Load custom commands
\InputIfFileExists{math-commands.tex}{}{%
  \ClassWarning{assignment}{math-commands.tex not found}}
\InputIfFileExists{programming-commands.tex}{}{%
  \ClassWarning{assignment}{programming-commands.tex not found}}

% Page layout
\geometry{margin=1in}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.75em}
\StudentsRunningHeader

% Sections
\StudentsHeadings{\Large}{\large}
\titleformat{\section}[block]
  {\if@newpages\clearpage\fi\normalfont\Large\bfseries\color{studentsaccent}}
  {\thesection}{1em}{}

% Problem statements
\newenvironment{problem}
{\paragraph{\textcolor{studentsaccent}{Problem.}}}
{}
\newenvironment{context}
{\begin{problem}}
{\end{problem}}
\newenvironment{solution}
{\paragraph{\textcolor{studentsaccentsoft}{Solution.}}}
{}

% Subsections
\renewcommand{\thesubsection}{\thesection.\if@arabicsubsec\arabic{subsection}\else\Alph{subsection}\fi}
\titleformat{\subsection}[block]
  {\normalfont\large\bfseries\color{studentsaccentsoft}}
  {\thesubsection)}{0.5em}{}
\titlespacing{\subsection}{0pt}{0.5em plus 1em}{0em plus 1em}

% Subsubsections
\renewcommand{\thesubsubsection}{\thesubsection.\if@arabicsubsubsec\arabic{subsubsection}\else\Roman{subsubsection}\fi}
\titleformat{\subsubsection}[block]
  {\normalfont\normalsize\bfseries\color{studentsaccentsoft}\textit}
  {\thesubsubsection)}{1em}{}
\titlespacing{\subsubsection}{0pt}{0em plus 1em}{0em plus 1em}

% Lists
\setlist[itemize,1]{label=\textcolor{studentsaccent}{\textbullet}}
\setlist[itemize,2]{label=\textcolor{studentsaccent}{\textendash}}

% Title
\renewcommand{\maketitle}{%
  \thispagestyle{studentsfirst}%
  \begin{center}
    {\color{studentsaccent}\rule{\textwidth}{0.8pt}\par}
    \vspace{0.8em}
    \ifx\@class\@empty\else
      {\large\scshape\color{studentsaccent}\@class\par}
      \vspace{0.4em}
    \fi
    {\LARGE\bfseries\@title\par}
    \ifx\@subtitle\@empty\else
      \vspace{0.3em}
      {\large\itshape\@subtitle\par}
    \fi
    \vspace{0.8em}
    {\normalsize\@author\par}
    \vspace{0.2em}
    {\normalsize\@date\par}
    \vspace{0.8em}
    {\color{studentsaccent}\rule{\textwidth}{0.8pt}\par}
  \end{center}
}

% Links load last
\StudentsLoadLinks
\StudentsLoadCleveref

\endinput
