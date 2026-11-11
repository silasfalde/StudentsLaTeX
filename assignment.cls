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
{\normalfont\Large\bfseries\color{studentsaccent}}
{\thesection}{1em}{}

\newif\ifstudents@headingpending
\if@nobox\else
  \AddToHook{para/begin}{\global\students@headingpendingfalse}
  \newcommand{\students@headingbox}[2]{%
    \begingroup
    \setlength{\fboxsep}{0pt}%
    \sbox{\@tempboxa}{\colorbox{black!10}{%
      \parbox{\dimexpr\linewidth-2.5pt\relax}{%
        \vspace{0.5em}%
        \hspace*{0.8em}%
        \parbox{\dimexpr\linewidth-1.6em\relax}{#1#2}%
        \vspace{0.5em}%
      }%
    }}%
    \textcolor{black}{\vrule width 2.5pt height \ht\@tempboxa depth \dp\@tempboxa}%
    \usebox{\@tempboxa}%
    \endgroup
  }
  \titleformat{\section}[block]
    {\normalfont\Large\bfseries\color{studentsaccent}}
    {}{0pt}{\students@headingbox{\ifttl@label\thesection\hspace{1em}\fi}}
    [\global\students@headingpendingtrue]
  \titlespacing{\section}{0pt}{3.5ex plus 1ex minus .2ex}{0.6em}
\fi

% With newpages, each section starts a new page; the title and table of
% contents share the first page, and a first section directly after the
% title stays on that page.
\newif\if@tocshown
\let\students@origtoc\tableofcontents
\renewcommand{\tableofcontents}{%
  \begingroup\let\sectionbreak\relax\students@origtoc\endgroup
  \global\@tocshowntrue}
\if@newpages
  \newcommand{\sectionbreak}{%
    \ifnum\value{section}>0 \clearpage
    \else\if@tocshown\clearpage\fi\fi}
\fi

% Problem statements
\newenvironment{problem}
{\par\ignorespaces}
{\par}
\if@nobox\else
  \students@box{problem}{black}{black!5}
  \AddToHook{env/problem/before}[students]{%
    \ifstudents@headingpending
      % Cancel the spacing and overlap slightly to avoid a visible seam.
      \if@nobreak\vspace{\dimexpr-0.6em-\parskip-\lineskip-0.5pt\relax}\fi
    \fi
    \global\students@headingpendingfalse
  }
  \DeclareHookRule{env/problem/before}{students}{before}{tcolorbox}
\fi
\newenvironment{context}
{\begin{problem}}
{\end{problem}}
\newenvironment{solution}
{\par\ignorespaces}
{\par}

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

\if@nobox\else
  \titleformat{\subsection}[block]
    {\normalfont\large\bfseries\color{studentsaccentsoft}}
    {}{0pt}{\students@headingbox{\ifttl@label\thesubsection)\hspace{0.5em}\fi}}
    [\global\students@headingpendingtrue]
  \titlespacing{\subsection}{0pt}{0.5em plus 1em}{0.6em}
  \titleformat{\subsubsection}[block]
    {\normalfont\normalsize\bfseries\color{studentsaccentsoft}\itshape}
    {}{0pt}{\students@headingbox{\ifttl@label\thesubsubsection)\hspace{1em}\fi}}
    [\global\students@headingpendingtrue]
  \titlespacing{\subsubsection}{0pt}{0em plus 1em}{0.6em}
\fi

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
