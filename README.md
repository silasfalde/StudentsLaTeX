# Custom LaTeX Classes

A small collection of LaTeX classes and shared command files for assignments,
essays, notes, cover letters, and presentations.

## Installation

The repository is already arranged as a local TeX tree:

```text
texmf/
└── tex/latex/latex_custom_classes/
    ├── assignment.cls
    ├── coverletter.cls
    ├── essay.cls
    ├── intellisense/
    │   ├── latex-custom-classes.cwl
    │   └── latex-custom-classes.json
    ├── math-commands.tex
    ├── notes.cls
    ├── presentation.cls
    └── programming-commands.tex
```

To use the classes, make the directory containing `assignment.cls` and the
other files visible to TeX. For a local TeX tree, set `TEXMFHOME` to the
parent `texmf` directory, or copy/link this tree into your existing TeX
installation. Verify that TeX can find a class with:

```sh
kpsewhich assignment.cls
```

If `kpsewhich` does not find the class, refresh the file database if your TeX
installation requires it, or set `TEXINPUTS` while compiling:

```sh
TEXINPUTS="$HOME/texmf/tex/latex/latex_custom_classes//:" pdflatex document.tex
```

The classes load their own dependencies, so a reasonably complete LaTeX
installation is required. The `essay`, `notes`, and `presentation` classes
expect an `umich-logo.png` file when their title pages are created. Put that
file in the document directory or make it available through TeX's search
path.

## Editor Completion

The `intellisense` directory contains completion metadata for the custom
commands and environments in this repository. It includes the class commands
(`\class`, `\headerlogo`, `\manuscript`, and `\suggestedref`), the `problem`
and `context` environments, the shared math commands, and the listings
commands and `pseudo` language.

LaTeX Workshop can load the JSON file globally, which makes completion work in
documents located in other repositories and directories. Add the following to
your VS Code user `settings.json`, changing the path if this repository is
located elsewhere:

```json
{
  "latex-workshop.intellisense.package.dirs": [
    "/home/silas-falde/texmf/tex/latex/latex_custom_classes/intellisense"
  ],
  "latex-workshop.intellisense.package.extra": [
    "latex-custom-classes"
  ]
}
```

Restart or reload VS Code after changing the settings. The completion data is
loaded for every LaTeX project, so typing `\problem`, `\begin{problem}`, or
commands such as `\expectation` will provide suggestions even when the class
or command definitions are outside the current project directory.

The `.cwl` file is the source-format equivalent for editors such as TeXstudio.
It can also be regenerated into the JSON format if the custom commands or
classes change. Keep the two files synchronized when extending the repository.

## Assignment Class

Use `assignment` for homework and problem sets. It is based on the standard
`article` class and sets one-inch margins, no paragraph indentation, and a
small paragraph gap.

```latex
\documentclass[arabicsubsec]{assignment}

\title{Homework 1}
\class{Probability}
\author{Your Name}

\begin{document}
\maketitle

\section{Random Variables}

\begin{problem}
Suppose you roll a die and let $X$ be the number of spots. What is
$\expectation[X]$?
\end{problem}

The solution goes here.

\end{document}
```

### Assignment options

- `newpages`: start each section on a new page.
- `arabicsubsec`: number subsections as `1.1`, `1.2`, and so on. Without it,
  subsection labels use capital letters, such as `1.A`.
- `arabicsubsubsec`: number subsubsections with Arabic numerals. Without it,
  subsubsection labels use uppercase Roman numerals.

The class also accepts options supported by the underlying article class.

### Problem statements

The optional `problem` environment places an unnumbered statement in a
light-gray, page-breakable card, visually separating it from its solution:

```latex
\begin{problem}
What are the possible values of $Z$? What is the probability of each value?
\end{problem}

Here is the solution.
```

`context` is an equivalent alias when the introductory material is better
described as context:

```latex
\begin{context}
Let $X$ be the outcome of a die roll.
\end{context}
```

The assignment class automatically loads `amsmath`, `amssymb`, `amsthm`,
`siunitx`, `graphicx`, `csvsimple`, `titlesec`, `enumerate`, `xcolor`, and
`hyperref`. It also loads both shared command files described below.

## Essay Class

Use `essay` for essays with a title page. It is based on `article`, uses
three-quarter-inch margins, and formats `\maketitle` as a dedicated title
page with the University of Michigan logo.

```latex
\documentclass{essay}

\title{An Essay Title}
\class{English 101}
\author{Your Name}

\begin{document}
\maketitle

\section{Introduction}
Your essay begins here.

\end{document}
```

The class loads `parskip`, `array`, `ifthen`, `graphicx`, `geometry`,
`amsmath`, `spacingtricks`, `pdflscape`, and `hyperref`. Its title page uses
`umich-logo.png` at `0.4\textwidth`.

## Notes Class

Use `notes` for longer notes organized with chapters. It is based on
`extreport`, uses one-inch margins, and formats chapters and sections as
compact bold headings.

```latex
\documentclass[compact,columns=2]{notes}

\title{Probability Notes}
\class{Statistics}
\author{Your Name}

\begin{document}
\maketitle

\chapter{Foundations}
\section{Events}
These are my notes.

\end{document}
```

### Notes options

- `compact`: use a very compact two-column layout, remove page numbering,
  reduce margins to `0.2in`, and tighten list spacing.
- `columns=<number>`: choose the number of columns used with `compact`. The
  default is `2`.

The notes class loads `tcolorbox`, `stmaryrd`, `amsmath`, `amssymb`,
`enumitem`, `titlesec`, `xcolor`, `graphicx`, and `geometry`, along with both
shared command files. The normal title page includes `umich-logo.png`.

## Cover Letter Class

Use `coverletter` for professional letters. It is based on the standard
`letter` class, defaults to 12-point text, and configures an A4 page with a
custom text area.

```latex
\documentclass[fontsize=11pt]{coverletter}

\name{Your Name}
\signature{Your Name}
\address{Your Street \\\\ Your City, Postal Code}
\date{\today}

\begin{document}

\begin{letter}{Recipient Name \\\\ Company \\\\ Address}
\opening{Dear Hiring Committee,}

I am writing to apply for the position of ...

\closing{Yours sincerely,}
\end{letter}

\end{document}
```

### Cover letter options and commands

- `fontsize=<size>`: set the font size passed to the underlying `letter`
  class. The default is `12pt`.
- `\headerlogo{...}`: add content, usually an image, above the sender
  information on the first page.
- `\manuscript{title}{details}`: center a manuscript or position title and
  optional details.
- `\suggestedref{name}{title or affiliation}{email}`: add a suggested
  referee and a linked email address.

The class also accepts options supported by `letter` and loads `graphicx`,
`ulem`, `enumerate`, `hyperref`, and `geometry`.

## Presentation Class

Use `presentation` for Beamer slides. It is based on `beamer`, uses the
`Berlin` theme and `wolverine` color theme, and inserts a table-of-contents
frame at the beginning of each section.

```latex
\documentclass{presentation}

\title{Probability}
\author{Your Name}

\begin{document}

\begin{frame}
  \titlepage
\end{frame}

\section{Random Variables}

\begin{frame}{Definition}
  A random variable assigns a value to each outcome.
\end{frame}

\end{document}
```

The class sets the institute to `University of Michigan`, adds a small
`umich-logo.png` logo, removes Beamer navigation symbols, and loads
`amsthm`, `amsmath`, `amssymb`, `xcolor`, `geometry`, `graphicx`, `csvsimple`,
`tikz`, and `inputenc`. It also loads both shared command files.

## Shared Command Files

These files are automatically loaded by `assignment`, `notes`, and
`presentation`. They can also be loaded manually in another document with
`\input{...}`.

### `math-commands.tex`

Provides short commands for common notation:

- Calculus: `\diff`
- Probability and statistics: `\prob`, `\expectation`, `\variance`,
  `\stddev`, `\covariance`, `\pdf`, `\cdf`, `\mse`, and `\mle`
- Distributions: `\binomialdist`, `\bernoullidist`, `\normaldist`,
  `\gammadist`, `\poissondist`, `\uniformdist`, and `\betadist`
- Discrete mathematics: `\floor{...}`, `\ceil{...}`, `\norm{...}`,
  `\magnitude{...}`, `\BigO`, `\argmax`, `\softmax`, `\reward`, and
  `\utility`
- Regression: `\RSS` and `\SSreg`

For example:

```latex
$\expectation[X]$, $\variance(X)$, and $\floor{x}$
```

### `programming-commands.tex`

Loads `listings`, defines a shared `mystyle` listing style, and applies it by
default with `\lstset{style=mystyle}`. The style includes line numbers,
wrapped lines, colored comments and keywords, and a light background.

It also defines a `pseudo` language:

```latex
\begin{lstlisting}[language=pseudo]
function factorial(n)
  if n <= 1 return 1
  return n * factorial(n - 1)
end
\end{lstlisting}
```

## Building Documents

Compile a document with `pdflatex` (or another LaTeX engine compatible with
the packages used by the selected class):

```sh
pdflatex document.tex
```

Run the command twice when cross-references or a table of contents need to be
updated. Keep document-specific source files, images, and generated build
artifacts outside this class directory when possible.
