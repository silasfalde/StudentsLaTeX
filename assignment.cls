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
    booktabs
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

% Sections
% \titleformat{\section}
%   {\normalfont\large\bfseries}{\thesection}{1em}{}
%   [\titlerule]

% Exercises
\newlist{exercises}{enumerate}{2}
% \renewcommand{\labelenumi}{Exercise \arabic{enumi}}
\setlist[exercises,1]{label=\boxed{\arabic{exercisesi}}, leftmargin=\parindent,
rightmargin=10pt}
\setlist[exercises,2]{label=\alph{exercisesii}), leftmargin=\parindent, rightmargin=10pt}

% \newenvironment{exercises}{
%     \begin{enumerate}[label = \boxed{\bf\arabic*}]
% }{
%     \end{enumerate}
% }
% \newenvironment{parts}{
%     \begin{enumerate}[label = \alph*)]
% }{
%     \end{enumerate}
% }

% Plots
\pgfplotsset{width=0.8\textwidth,compat=1.9}
\usepgfplotslibrary{external}
% \tikzexternalize

\endinput
