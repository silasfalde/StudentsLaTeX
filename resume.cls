\ProvidesClass{resume}[2022/12/17 v3.0 Resume class]
\LoadClass[12pt]{article}

\RequirePackage{
	parskip,
	array,
	ifthen,
	graphicx,
	geometry, 
	amsmath, 
	% ebgaramond
}

% Options 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\geometry{
	top=0.4in, % Top margin
	bottom=0.6in, % Bottom margin
	left=0.5in, % Left margin
	right=0.5in, % Right margin
	% showframe, % Uncomment to show how the type block is set on the page
}

% Name
\newcommand{\name}[1]{\renewcommand{\name}{#1}}
\name{Silas M. Falde}

\newcommand{\printname}{
	\begingroup
		\hfil{\MakeUppercase{\huge\bfseries\name}}\hfil % Style and output the user's name
		\bigskip\break % Vertical whitespace below name
	\endgroup
}

% Addresses
\newcommand{\addressSep}{$\ \diamond\ $}
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

\newcommand{\address}[1]{
	\@ifundefined{@addressone}{ % If the first address line has not been set yet, set it
		\def \@addressone {#1}
	}{
		\@ifundefined{@addresstwo}{ % If the second address line has not been set yet, set it
			\def \@addresstwo {#1}
		}{ % Otherwise, set the third address line
			\def \@addressthree {#1}
		}%
	}
}

\newcommand{\printaddress}[1]{
	\begingroup
		\def \\ {\addressSep\ } % Redefine newlines (\\) to the address separator symbol so multiple lines of each address are output as a single line
		\centerline{#1} % Output the centered address line
	\endgroup
	\par % End the paragraph to ensure correct spacing between lines
	\smallskip % Vertical whitespace between address lines
}

% Header
\let\ori@document=\document % Store the original \document command
\renewcommand{\document}{
	\ori@document  % Output the original \document command but add to it below
	\printname % Output the user's name
	\@ifundefined{@addressone}{}{\printaddress{\@addressone}} % Output the first address if specified
	\@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}} % Output the second address if specified
	\@ifundefined{@addressthree}{}{\printaddress{\@addressthree}} % Output the third address if specified
}

% Section
\newenvironment{rSection}[1]{
	\medskip
	\MakeUppercase{\textbf{#1}}
	\medskip
	\hrule
	\begin{list}{}{
		\setlength{\leftmargin}{1.5em}
	}
	\item[]
	\end{list}
}

% Subsection
\newenvironment{rSubsection}[4]{ % 4 parameters: title, timeframe, description and additional info
	\textbf{#1} \hfill {#2}
	\ifthenelse{\equal{#3}{}}{}{
		\\
		\textit{#3} \hfill \textit{#4}
	}
	\smallskip
	\begin{list}{$\boldsymbol{\cdot}$}{\leftmargin=1em}
		\setlength{\itemsep}{-0.3em} \vspace{-0.5em} % Reduce vertical spacing between items in the list for a tighter look
}{
	\end{list}
	\vspace{0.5em}
}

\pagenumbering{gobble} % Remove page number