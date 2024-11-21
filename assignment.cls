\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2024/11/14]
\LoadClass[10pt, letterpaper]{article}

\RequirePackage{
  geometry,
  amsmath,
  siunitx, 
  pgfplots, 
  booktabs, 
  mdframed, 
  tcolorbox,
  wrapfig,
}

\usepgfplotslibrary{fillbetween}

% Names
\newcommand{\professor}[1]{\gdef\@professor{#1}}
\newcommand{\class}[1]{\gdef\@class{#1}}
\author{Silas Falde}
\date{\today}

% Options
\input{subj_options.tex}
\input{class_options.tex}
\ProcessOptions\relax

% Option Commands
\input{subj_commands.tex}
\input{class_commands.tex}

% Math Commands
\input{math_commands.tex}

\renewcommand{\maketitle}{
  \begin{titlepage}
    \centering \vspace*{2cm}
    {\Huge \@title \par}
    {\huge \@class \par}
    \vfill
    {\Large \@author \par}
    {\large \@date \par}
    \vspace*{2cm}
    \thispagestyle{empty}
  \thispagestyle{empty}
  \end{titlepage} 
  \setcounter{page}{1} 
  \pagenumbering{arabic}
}

% Margins
\geometry{left=1in,right=1in,top=1in,bottom=1in}

% Paragraphs
\setlength{\parindent}{0in}
\setlength{\parskip}{1em}

% Plots
\pgfplotsset{width=0.8\textwidth,compat=1.9}
\usepgfplotslibrary{external}
% \tikzexternalize

% Exercise
\newcounter{exercise}
\newcommand{\exercise}[2]{
  \newpage
  \refstepcounter{exercise}
  \vspace{1em}
  \begin{mdframed}
    \boxed{\theexercise} #1
  \end{mdframed}
  \vspace{10pt}
  #2
}

% Parts
\renewcommand{\part}[3]{
  \hrule\nopagebreak\vspace{-8pt}\nopagebreak
  #1) #2 \nopagebreak\\
  \nopagebreak\vspace{-8pt}\hrule
  #3
  \vspace{1.5em}
}

% Note
\newenvironment{note}{
  \begin{tcolorbox}[colback=black!5!white,colframe=black,title={\centering{Note}}]
  }{
  \end{tcolorbox}
}

\endinput
