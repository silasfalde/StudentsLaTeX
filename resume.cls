\ProvidesClass{resume}[2024/12/25 Resume class]
\LoadClass[10pt]{article}

\RequirePackage{
	parskip,
	array,
	ifthen,
	graphicx,
	geometry,
	amsmath,
	spacingtricks,
	hyperref
}

% Hyperref setup
\hypersetup{
	colorlinks=true,
	linkcolor=black,
	citecolor=black,
	urlcolor=black
}


% Options
\newif\if@compact
\DeclareOption{compact}{\@compacttrue}
\ProcessOptions\relax


% Geometry
\geometry{top=0.6in, bottom=0.75in, left=0.75in, right=0.75in}

\if@compact
	\setlength{\parskip}{0pt plus 1fil}
	\linespread{0.7}\selectfont
	\geometry{top=0.3in, bottom=0.4in, left=0.5in, right=0.5in}
	\pagenumbering{gobble}
\fi


% Name
\newcommand{\name}[1]{\renewcommand{\name}{#1}}
\name{Silas M. Falde}

\newcommand{\printname}{
	\begingroup
	\hfil{\MakeUppercase{\huge\bfseries\name}}\hfil
	\medskip\break
	\endgroup
}

% Addresses
\newcommand{\addressSep}{$\ \diamond\ $}
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

\newcommand{\address}[1]{
	\@ifundefined{@addressone}{
		\def \@addressone {#1}
	}{
		\@ifundefined{@addresstwo}{
			\def \@addresstwo {#1}
		}{
			\def \@addressthree {#1}
		}
	}
}

\newcommand{\printaddress}[1]{
\begingroup
\def \\ {\addressSep\ }
\centerline{#1}
\endgroup
\par
\smallskip
}

\address{(517) 539-1532 \\ sfalde05@gmail.com \\ \href{https://silasfalde.net}{www.silasfalde.net}}


% Header
\let\ori@document=\document

\renewcommand{\document}{
	\ori@document
	\printname
	\@ifundefined{@addressone}{}{\printaddress{\@addressone}}
	\@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}}
	\@ifundefined{@addressthree}{}{\printaddress{\@addressthree}}
}


% Sections
\renewcommand{\section}[1]{
	\medskip
	\MakeUppercase{\textbf{#1}}
	\smallskip
	\hrule
}

\newcommand{\experience}[4]{
	\if@compact\smallskip
	\else\medskip\fi
	\textbf{#1}\hfill\textbf{#2}\\
	\textit{#4\hfill#3}
	\smallskip
}


% Environments
\newenvironment{bullets}{
	\begin{list}{$\boldsymbol{\cdot}$}{\leftmargin=1em}
		\setlength{\itemsep}{-0.3em}
		\vspace{-0.5em}
		}{
	\end{list}
}

\newenvironment{items}{
	\begin{tabular}{@{} >{\bfseries}l @{\hspace{2em}} l @{}}
		}{
	\end{tabular}
}
