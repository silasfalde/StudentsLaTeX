\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2019/03/19]
\LoadClass[12pt, letterpaper]{article}

\RequirePackage{
    geometry,
    amsmath,
    xcolor,
    enumitem,
    siunitx, 
    pgfplots, 
    booktabs, 
    etoolbox, 
    xparse, 
    mdframed
}

\usepgfplotslibrary{fillbetween}

% Names
\renewcommand{\title}[1]{\gdef\@title{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\newcommand{\professor}[1]{ \newcommand{\professorloc}{#1} }
\newcommand{\class}[1]{ \newcommand{\classlocal}{#1} }
\author{Silas Falde}

% Options
\input{subj_options.tex}
\input{class_options.tex}
\ProcessOptions\relax

% Option Commands
\input{subj_commands.tex}
\input{class_commands.tex}

% Math Commands
\input{math_commands.tex}

% Margins
\geometry{left=1in,right=1in,top=1in,bottom=1in}

% Plots
\pgfplotsset{width=0.8\textwidth,compat=1.9}
\usepgfplotslibrary{external}
% \tikzexternalize

% Exercises
\newlist{exercises}{enumerate}{2}
\setlist[exercises,1]{label=\boxed{\arabic{exercisesi}}, leftmargin=0pt}
\setlist[exercises,2]{label=\alph{exercisesii}), leftmargin=\parindent}

% Problem Statement Environment
\newenvironment{problem}[1][Problem]{
  \begin{mdframed}
    \textbf{#1}
}{
  \end{mdframed}
}

\endinput
