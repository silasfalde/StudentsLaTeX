# Custom LaTeX Classes for Students

A ready-to-use collection of LaTeX classes and shared command files for
writing school documents: assignments, essays, notes, cover letters, and
presentations. Install it once, and every document you write can use these
classes without copying files into each project or redefining commands from
scratch.

## Contents

| File | Purpose |
| --- | --- |
| `assignment.cls` | Homework and problem sets |
| `essay.cls` | Essays with a title page |
| `notes.cls` | Chaptered course notes, including a compact layout for automatic exam note generation |
| `coverletter.cls` | Professional cover letters |
| `presentation.cls` | Beamer slide decks |
| `math-commands.tex` | Shared math/statistics notation, loaded by the classes above |
| `programming-commands.tex` | Shared code-listing style and a `pseudo` language, loaded by the classes above |
| `intellisense/` | Editor completion metadata for the custom commands and environments |
| `snippets/` | VS Code snippets for quickly starting documents that use these classes |

## Requirements

A working LaTeX distribution is required:

- **macOS**: [MacTeX](https://tug.org/mactex/)
- **Windows**: [MiKTeX](https://miktex.org/) or [TeX Live](https://tug.org/texlive/)
- **Linux**: [TeX Live](https://tug.org/texlive/) (usually available via your
  package manager, e.g. `texlive-full`)

The classes load their own package dependencies (`amsmath`, `graphicx`,
`hyperref`, etc.), so a reasonably complete distribution such as the ones
above is recommended. All author, course, institution, and logo details
belong in each document, so the classes can be reused without editing their
source files.

## Installation

TeX looks for classes and packages in your personal TeX tree, commonly
referred to by the `TEXMFHOME` variable. Installing this repository means
placing it inside that tree, in a `tex/latex` subdirectory. Run
`kpsewhich -var-value TEXMFHOME` to see the location your installation
expects; if it isn't set, use the defaults below.

Clone or download this repository into that location:

```sh
git clone <this-repository-url> custom-classes
```

### macOS

Default `TEXMFHOME`: `~/Library/texmf`

```sh
mkdir -p ~/Library/texmf/tex/latex
git clone <this-repository-url> ~/Library/texmf/tex/latex/custom-classes
```

### Linux

Default `TEXMFHOME`: `~/texmf`

```sh
mkdir -p ~/texmf/tex/latex
git clone <this-repository-url> ~/texmf/tex/latex/custom-classes
```

### Windows

Default `TEXMFHOME` (MiKTeX): `%USERPROFILE%\texmf`

```powershell
mkdir "$env:USERPROFILE\texmf\tex\latex"
git clone <this-repository-url> "$env:USERPROFILE\texmf\tex\latex\custom-classes"
```

With MiKTeX, you can also add a custom root folder through **MiKTeX
Console → Settings → Directories** instead of using the default location.

### Verifying the install

After placing the files, confirm TeX can find them:

```sh
kpsewhich assignment.cls
```

If nothing is printed, refresh your TeX installation's file name database
(e.g. `mktexlsr` or MiKTeX Console's "Refresh file name database" button), or
compile with `TEXINPUTS` pointed directly at the classes:

```sh
TEXINPUTS="/path/to/custom-classes//:" pdflatex document.tex
```

## Recommended VS Code Extensions

These extensions turn VS Code into a full LaTeX editor and pair well with the
classes in this repository:

- **[LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)**
  — compiles and formats documents, renders PDF previews, and provides
  general LaTeX language support. This is the extension used for the editor
  completion setup below.
- **[LaTeX](https://marketplace.visualstudio.com/items?itemName=torn4dom4n.latex-support)**
  — adds LaTeX snippets for common environments and commands, speeding up
  everyday writing.
- **[LaTeX Sympy Calculator](https://marketplace.visualstudio.com/items?itemName=xyz0826.latex-sympy-calculator)**
  — evaluates and simplifies math expressions written in LaTeX directly in
  the editor, useful for checking work on assignments and notes.

## Editor Completion

The `intellisense` directory contains completion metadata for the custom
commands and environments in this repository. It includes the class commands
(`\class`, `\headerlogo`, `\manuscript`, and `\suggestedref`), the `problem`
and `context` environments, the shared math commands, and the listings
commands and `pseudo` language.

LaTeX Workshop can load the JSON file globally, which makes completion work in
documents located in other repositories and directories. Add the following to
your VS Code user `settings.json`, replacing the path with wherever you
installed this repository:

```json
{
  "latex-workshop.intellisense.package.dirs": [
    "/path/to/custom-classes/intellisense"
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

## Snippets

`snippets/latex.code-snippets` provides prefixes (`notes`, `coverletter`,
`latex-assignment`) that scaffold a barebones document for the corresponding
class. VS Code cannot load user snippets from an arbitrary path, so install
the file with one of the two options below.

### Global snippets (all projects)

Copy or symlink the file into your VS Code profile's snippets folder so it
applies everywhere. Symlinking keeps it up to date when you pull changes to
this repository.

- **macOS**: `~/Library/Application Support/Code/User/snippets/`
- **Linux**: `~/.config/Code/User/snippets/`
- **Windows**: `%APPDATA%\Code\User\snippets\`

```sh
ln -s /path/to/custom-classes/snippets/latex.code-snippets \
  "$HOME/Library/Application Support/Code/User/snippets/latex.code-snippets"
```

If you use a non-default VS Code profile, the folder is nested under
`User/profiles/<profile-id>/snippets/` instead of `User/snippets/`.

### Workspace snippets (single project)

Copy the file into a project's `.vscode/` folder instead if you only want the
snippets available there:

```sh
mkdir -p .vscode
cp /path/to/custom-classes/snippets/latex.code-snippets .vscode/
```

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
page.

```latex
\documentclass{essay}

\title{An Essay Title}
\author{Your Name}
% Optional: \titlelogo{\includegraphics[width=0.4\textwidth]{institution-logo.png}}

\begin{document}
\maketitle

\section{Introduction}
Your essay begins here.

\end{document}
```

The class loads `parskip`, `array`, `ifthen`, `graphicx`, `geometry`,
`amsmath`, `spacingtricks`, `pdflscape`, and `hyperref`. Add an optional
document-specific title logo with `\titlelogo{...}`.

## Notes Class

Use `notes` for longer notes organized with chapters. It is based on
`extreport`, uses one-inch margins, and formats chapters and sections as
compact bold headings.

```latex
\documentclass[compact,columns=2]{notes}

\title{Course Notes}
\class{Course or Subject}
\author{Your Name}
% Optional: \titlelogo{\includegraphics[width=0.4\textwidth]{institution-logo.png}}

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
shared command files. Add an optional document-specific title logo with
`\titlelogo{...}`.

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
`Berlin` theme, and inserts a table-of-contents frame at the beginning of
each section.

```latex
\documentclass{presentation}

\title{Presentation Title}
\author{Your Name}
\institute{Your Institution}
% Optional: \logo{\includegraphics[height=0.25cm]{institution-logo.png}}

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

The class removes Beamer navigation symbols and loads `amsthm`, `amsmath`,
`amssymb`, `xcolor`, `geometry`, `graphicx`, `csvsimple`, `tikz`, and
`inputenc`. It also loads both shared command files. Set `\institute{...}`
and `\logo{...}` in an individual document when needed.

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
