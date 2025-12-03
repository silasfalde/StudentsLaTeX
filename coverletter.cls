\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coverletter}[2024/11/16 cover letter style, lp586@cam.ac.uk]

%% Based on the eletter2 class
%% https://www.overleaf.com/latex/templates/ntu-eee-letterhead/qfxzzmxfpcnq

%% Define default font size as 12pt
\RequirePackage{kvoptions}
\DeclareStringOption[12pt]{fontsize}
\ProcessKeyvalOptions{coverletter}\relax
\PassOptionsToClass{\coverletter@fontsize}{letter}

%%% Load the letter class
\DeclareOption*{\expandafter\PassOptionsToClass\expandafter{\CurrentOption}{letter}}
\ProcessOptions\relax
\LoadClass{letter}

%%% Load the required packages
\RequirePackage{graphicx}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumerate}
\RequirePackage{hyperref}
\RequirePackage{geometry}

%%% Define commands
\newif\ifCL@headerlogo\CL@headerlogofalse
\newcommand{\@headerlogo}{}
\newcommand{\headerlogo}[1]{\renewcommand{\@headerlogo}{#1}\CL@headerlogotrue}
\headerlogo{\includegraphics[height=1cm]{umich-logo.png}}


\newcommand{\manuscript}[2]{%
  \smallskip%
  \begin{center}%
    \textbf{#1}\\[\smallskipamount]
    {\small #2}
  \end{center}%
  \smallskip%
}

\newcommand{\suggestedref}[3]{%
  \textbf{#1}, #2%
  \begin{itemize}
    \item email: \href{mailto:#3}{\uline{#3}}
  \end{itemize}
}

%%% Style opening and closing
\renewcommand{\opening}[1]{\ifx\@empty\fromaddress
    \thispagestyle{firstpage}%
    {\raggedleft\@date\par}%
  \else  % home address
    \thispagestyle{empty}%
    {\raggedleft%
      \ifCL@headerlogo\@headerlogo\\*[1cm]%
      \else%no header logo
      \fi%
      \begin{tabular}{l@{}}\ignorespaces%
        \fromaddress \\*[1em]%
        \@date\end{tabular}\par}%
  \fi%
  \vspace{-3\parskip}%
  {\raggedright \toname \\ \toaddress \par}%
  \vspace{1\parskip}%
  #1\par\nobreak}

\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
  \stopbreaks
  \noindent
  \raggedright
  \ignorespaces #1\\[2\medskipamount]%
  \ifx\@empty\fromsig
    \fromname
  \else \fromsig \fi\strut%
  \par}

%%% Style the geometry
\geometry{
  a4paper,
  total={210mm,297mm},
  headsep=0mm,
  textwidth=160mm,
  textheight=265mm,
  left=25mm,
  top=8mm,
  footskip=12mm
}

\setlength{\parindent}{0mm}
\setlength{\parskip}{5mm}

%% Set up hyperref
\hypersetup{
  colorlinks=true,
  urlcolor=blue,
}