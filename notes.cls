\ProvidesClass{notes}
\LoadClass[10pt]{report}
\RequirePackage{
  graphicx,
  geometry,
  titlesec,
  xcolor,
  amsmath,
  amsthm,
  tcolorbox,
  siunitx
}

% Names
\renewcommand{\title}[1]{\gdef\@title{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\newcommand{\professor}[1]{ \newcommand{\professorloc}{#1} }
\newcommand{\class}[1]{ \newcommand{\classlocal}{#1} }
\author{Silas Falde}
\date{\today}

% Options
\input{subj_options.tex}
\input{class_options.tex}
\ProcessOptions\relax

% Option Commands
\input{subj_commands.tex}
\input{class_commands.tex}
\title{\classlocal \ Notes}

% Math Commands
\input{math_commands.tex}

% Theorems
\theoremstyle{definition}
\newtheorem{definition}{Definition}
\theoremstyle{definition}
\newtheorem{theorem}{Theorem}
\theoremstyle{definition}
\newtheorem{law}{Law}
\theoremstyle{remark}

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

% Paragraphs
\setlength{\parindent}{0pt}

% Geometry
\geometry{margin=1in}

\renewcommand{\maketitle}{{
  \centering
  \vspace*{1cm} % Adds vertical space

  \includegraphics[width=0.4\textwidth]{umich_logo.png}
  \vspace{1cm}

  {\Huge\bfseries \@title \par}
  \vspace{0.5cm}

  {\Large \@author \par}
  % {\Large \@semester \par}

  \vfill
  
  {\large\today\par}
}}

\endinput
