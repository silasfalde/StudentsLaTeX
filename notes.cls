\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2026/10/08 v2.0 Notes class]

\RequirePackage{xkeyval}

\newif\if@compact
\newif\if@nobox
\newcount\notes@columns
\notes@columns=2\relax

\DeclareOptionX{compact}{\@compacttrue}
\DeclareOptionX{nobox}{\@noboxtrue}
\DeclareOptionX{columns}{\notes@columns=#1\relax}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{extreport}}

\ProcessOptionsX\relax

\LoadClass{extreport}

\RequirePackage{
  geometry,
  graphicx,
  stmaryrd,
  amsmath,
  amssymb,
  enumitem,
}

% Shared style (palette, fonts) and boxed environments
\if@compact
  \RequirePackage[ptm]{studentstyle}
  \RequirePackage[nobox]{studentboxes}
\else
  \RequirePackage{studentstyle}
  \if@nobox
    \RequirePackage[nobox]{studentboxes}
  \else
    \RequirePackage{studentboxes}
  \fi
\fi

\RequirePackage{studentlayout}

\InputIfFileExists{math-commands.tex}{}{%
  \ClassWarning{notes}{math-commands.tex not found}}
\InputIfFileExists{programming-commands.tex}{}{%
  \ClassWarning{notes}{programming-commands.tex not found}}

% Headings (full-size layout is larger than the compact one)
\titleclass{\chapter}{straight}
\if@compact
  \newcommand{\notes@chaptersize}{\large}
  \newcommand{\notes@sectionsize}{\normalsize}
  \newcommand{\notes@subsectionsize}{\small}
\else
  \newcommand{\notes@chaptersize}{\LARGE}
  \newcommand{\notes@sectionsize}{\Large}
  \newcommand{\notes@subsectionsize}{\large}
\fi

\titleformat{\chapter}
  {\normalfont\notes@chaptersize\bfseries\scshape}
  {\thechapter}{0.5em}{}
  [{\titlerule[0.8pt]}]
\titlespacing{\chapter}{0pt}{1.5em plus 1em}{0.5em plus 0.5em}

\StudentsHeadings{\notes@sectionsize}{\notes@subsectionsize}
\titlespacing{\section}{0pt}{1.5em plus 1em}{0.5em plus 1em}

% Itemize and Enumerate
\setlist[itemize,1]{itemsep=0em, label=\textcolor{studentsaccent}{\textbullet}}
\setlist[itemize,2]{itemsep=0em, label=\textcolor{studentsaccent}{\textendash}}
\setlist[enumerate]{itemsep=0em, label=\textcolor{studentsaccent}{\arabic*.}}

% Page layout
\setlength{\parindent}{0pt}
\geometry{margin=1in}
\if@compact\else
  \setlength{\parskip}{0.5em plus 0.1em}
  \linespread{1.05}
\fi

% Header and footer
\if@compact
  \pagestyle{empty}
\else
  \StudentsRunningHeader
\fi

% Title
\renewcommand{\maketitle}{\StudentsTitlePage}

% Links load after all other packages but before the compact document hooks
\StudentsLoadLinks
\StudentsLoadCleveref

\if@compact
  \setlength{\parskip}{0cm}
  \setlength{\parindent}{0em}
  \geometry{margin=0.2in}
  \pagenumbering{gobble}
  \RequirePackage{multicol}
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
