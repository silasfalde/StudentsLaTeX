\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentation}[2026/10/08 v2.0 Presentation class]
\LoadClass{beamer}

\RequirePackage{
	amsthm,
	amsmath,
	amssymb,
	xcolor,
	geometry,
	graphicx,
	csvsimple,
	tikz,
	inputenc,
}

% Keep the shared serif fonts instead of Beamer's sans-serif defaults
\usefonttheme{professionalfonts}
\usefonttheme{serif}

% Shared style (palette and fonts)
\RequirePackage{studentstyle}

\InputIfFileExists{math-commands.tex}{}{%
	\ClassWarning{presentation}{math-commands.tex not found}}
\InputIfFileExists{programming-commands.tex}{}{%
	\ClassWarning{presentation}{programming-commands.tex not found}}

\usetheme{Berlin}
\usetikzlibrary{shapes.symbols}

% Colors: deep green structure, with the header bars shading darker
\setbeamercolor{structure}{fg=studentsaccent}
\setbeamercolor{palette primary}{bg=studentsaccent, fg=white}
\setbeamercolor{palette secondary}{bg=studentsaccent!85!black, fg=white}
\setbeamercolor{palette tertiary}{bg=studentsaccent!70!black, fg=white}
\setbeamercolor{palette quaternary}{bg=studentsaccent!55!black, fg=white}
\setbeamercolor{block title}{bg=studentsaccent, fg=white}
\setbeamercolor{block body}{bg=studentsaccentlight, fg=black}
\setbeamercolor{block title example}{bg=studentsslate, fg=white}
\setbeamercolor{block body example}{bg=studentsslatelight, fg=black}
\setbeamercolor{block title alerted}{bg=studentsred, fg=white}
\setbeamercolor{block body alerted}{bg=studentsredlight, fg=black}
\setbeamercolor{title}{fg=studentsaccent}
\setbeamercolor{frametitle}{fg=white}
\setbeamercolor{item}{fg=studentsaccent}

\AtBeginSection[]
{
	\begin{frame}
		\frametitle{Table of Contents}
		\tableofcontents[currentsection]
	\end{frame}
}

\setbeamertemplate{navigation symbols}{}

\endinput
