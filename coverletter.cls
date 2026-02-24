%% ============================================================================
%% coverletter.cls - Custom LaTeX Class for Professional Cover Letters
%% ============================================================================
%% 
%% DESCRIPTION:
%% A LaTeX document class for creating professional cover letters with custom
%% styling, optional header logos, and formatted contact information.
%% Based on the standard letter class with additional formatting features.
%%
%% AUTHOR: lp586@cam.ac.uk
%% DATE: 2024/11/16
%%
%% ============================================================================
%% USAGE INSTRUCTIONS:
%% ============================================================================
%%
%% 1. BASIC DOCUMENT SETUP:
%%    \documentclass{coverletter}
%%    \begin{document}
%%    ...
%%    \end{document}
%%
%% 2. SETTING FONT SIZE (optional):
%%    \documentclass[fontsize=11pt]{coverletter}  % default is 12pt
%%
%% 3. SENDER INFORMATION:
%%    \name{Your Full Name}
%%    \address{Your Street \\ Your City, Postal Code}
%%    \date{\today}
%%
%% 4. RECIPIENT INFORMATION:
%%    Inside the document, use:
%%    \begin{letter}{Recipient Name \\ Company \\ Address}
%%
%% 5. OPTIONAL HEADER LOGO:
%%    \headerlogo{\includegraphics[height=1cm]{your-logo.png}}
%%    (Default: umich-logo.png at 1cm height)
%%
%% 6. LETTER CONTENT:
%%    \opening{Dear Sir or Madam,}
%%    Your letter body text goes here...
%%    \closing{Yours sincerely,}
%%    \end{letter}
%%
%% 7. MANUSCRIPT/POSITION SECTION (optional):
%%    \manuscript{Title of Position}{Additional Details}
%%
%% 8. SUGGESTED REFERENCE (optional):
%%    \suggestedref{Referee Name}{Title/Affiliation}{email@example.com}
%%
%% ============================================================================
%% PAGE LAYOUT:
%% - A4 paper format
%% - 160mm text width, 265mm text height
%% - 25mm left margin, 8mm top margin
%% - 12mm footer skip
%% ============================================================================

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