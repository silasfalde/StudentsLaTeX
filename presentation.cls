\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentation}[2024/12/25 Presentation class]
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

\input{math-commands}
\input{programming-commands}

\usetheme{Berlin}
\usetikzlibrary{shapes.symbols}

\AtBeginSection[]
{
	\begin{frame}
		\frametitle{Table of Contents}
		\tableofcontents[currentsection]
	\end{frame}
}

\setbeamertemplate{navigation symbols}{}

