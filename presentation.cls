\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentation}[2024-11-10]
\LoadClass{beamer}

\usetheme{AnnArbor}
\usecolortheme{wolverine}
% \useinnertheme{circles}
% \useoutertheme{infolines}

\RequirePackage{
  geometry,
  amsmath,
  siunitx, 
  pgfplots, 
  booktabs, 
  mdframed, 
  tcolorbox,
}


% Names
\author{Silas Falde}
\institute{University of Michigan}

% Options
\input{subj_options.tex}
\ProcessOptions\relax

% Option Commands
\input{subj_commands.tex}

% Other Commands
\input{math_commands.tex}

% Plots
\pgfplotsset{width=0.8\textwidth,compat=1.9}
\usepgfplotslibrary{external}
% \tikzexternalize
% \usepgfplotslibrary{fillbetween}

\endinput
