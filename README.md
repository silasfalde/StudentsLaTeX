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
| `studentstyle.sty` | Shared style guide: deep green palette, Libertinus fonts, `microtype`, `hyperref`/`cleveref` setup |
| `studentlayout.sty` | Shared layout for `notes`, `assignment`, and `essay`: metadata commands, title page, running header, and heading styles |
| `studentboxes.sty` | Shared boxed `definition`, `theorem`, `lemma`, `proposition`, `corollary`, `example`, `remark`, `note`, `warning`, and `proof` environments |
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
(`\class`, `\titlelogo`, `\subtitle`, `\instructor`, `\term`, `\headerlogo`,
`\manuscript`, and `\suggestedref`), `\cref`, the boxed environments
(`definition`, `theorem`, `proof`, and so on), the `problem`, `context`, and
`solution` environments, the shared math commands, and the listings commands
and `pseudo` language.

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
commands such as `\expect` will provide suggestions even when the class
or command definitions are outside the current project directory.

### Updating completion data

`intellisense/latex-custom-classes.cwl` is the source of truth. Do not edit
the JSON by hand. After adding, renaming, or removing a command or
environment:

1. Edit `latex-custom-classes.cwl`. Each line is a macro (`\name{placeholder}`)
   or an environment (`\begin{name}[placeholder]`). The text inside `[]`,
   `{}`, or `||` becomes the tab-stop placeholder. `#` lines are comments.
2. Run `python3 intellisense/generate-json.py` to regenerate
   `latex-custom-classes.json`. Run it with `--check` to confirm the JSON is
   up to date.
3. Reload VS Code.

The `.cwl` file can also be used directly by editors such as TeXstudio.

## Snippets

`snippets/latex.code-snippets` provides document prefixes (`notes`,
`cheatsheet`, `assignment`, `essay`, `presentation`, `coverletter`) that
scaffold a document for the corresponding class, and environment prefixes
for the boxed environments (`defn`, `thm`, `lem`, `prop`, `cor`, `exm`,
`rmk`, `nte`, `wrn`, `prf`). VS Code cannot load user snippets from an
arbitrary path, so install the file with one of the two options below.

To add or change a snippet, edit `snippets/latex.code-snippets` directly. Each
entry has a `prefix` (what you type), a `body` (one string per line), and a
`description`. Use `${1:placeholder}` for tab stops and `$0` for the final
cursor position. Backslashes must be doubled (`\\begin`, and `\\\\` for a
LaTeX line break). The file allows `//` comments. Reload VS Code if a change
does not appear.

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
small paragraph gap. It follows the shared style: a ruled title block, green
section headings, a running header, and the boxed environments described under
[Shared Style](#shared-style).

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
$\expect[X]$?
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
- `nobox`: draw the theorem-style environments as plain headed paragraphs.

The class also accepts options supported by the underlying article class.

### Problem statements

The optional `problem` environment places an unnumbered statement under a
green "Problem." label. The optional `solution` environment adds a lighter
green "Solution." label. Neither uses a box, so lists, tables, and page breaks
work freely:

```latex
\begin{problem}
What are the possible values of $Z$? What is the probability of each value?
\end{problem}
\begin{solution}
Here is the solution.
\end{solution}
```

`context` is an equivalent alias for `problem` when the introductory material
is better described as context:

```latex
\begin{context}
Let $X$ be the outcome of a die roll.
\end{context}
```

The assignment class automatically loads `amsmath`, `amssymb`, `amsthm`,
`siunitx`, `graphicx`, `csvsimple`, `titlesec`, `enumerate`, `enumitem`,
`tcolorbox`, `xcolor`, `hyperref`, and `cleveref`. It also loads both shared
command files described below.

## Essay Class

Use `essay` for essays with a title page. It is based on `article`, uses
three-quarter-inch margins, formats `\maketitle` as a dedicated title page,
and follows the shared style: green headings, Libertinus fonts, and a running
header with the class name and title. Options are passed to `article`, so
`11pt` or `12pt` work.

```latex
\documentclass{essay}

\title{An Essay Title}
\author{Your Name}
% Optional: \class{Course} \subtitle{...} \instructor{...} \term{Fall 2026}
% Optional: \titlelogo{\includegraphics[width=0.4\textwidth]{institution-logo.png}}

\begin{document}
\maketitle

\section{Introduction}
Your essay begins here.

\end{document}
```

The class loads `parskip`, `array`, `ifthen`, `graphicx`, `geometry`,
`amsmath`, `spacingtricks`, `pdflscape`, `titlesec`, `hyperref`, and
`cleveref`.

## Notes Class

Use `notes` for longer notes organized with chapters. It is based on
`extreport`, uses one-inch margins, and follows the shared style
(`studentstyle`): black small-caps chapter headings with a rule, green section
headings and lighter green subsections, Libertinus fonts, a running header
and page-number footer, and
boxed theorem-style environments (`studentboxes`).

```latex
\documentclass[compact,columns=2]{notes}

\title{Course Notes}
\class{Course or Subject}
\author{Your Name}
% Optional: \subtitle{...} \instructor{...} \term{Fall 2026} \date{...}
% Optional: \titlelogo{\includegraphics[width=0.4\textwidth]{institution-logo.png}}

\begin{document}
\maketitle

\chapter{Foundations}
\section{Events}
These are my notes.

\begin{definition}[Name]\label{def:name}
A boxed definition.
\end{definition}

\begin{theorem}[Name]
A boxed theorem, referenced with \cref{def:name}.
\end{theorem}
\begin{proof}
Ends with a green square.
\end{proof}

\end{document}
```

### Notes options

- `compact`: use a very compact two-column layout, remove page numbering and
  headers, reduce margins to `0.2in`, use Times fonts, draw the theorem-style
  environments without boxes, and tighten list spacing.
- `columns=<number>`: choose the number of columns used with `compact`. The
  default is `2`.
- `nobox`: draw the theorem-style environments as plain headed paragraphs.

### Environments

`definition`, `theorem`, `lemma`, `proposition`, `corollary`, and `example`
share one counter numbered within chapters (for example, Theorem 2.3).
`remark`, `note`, and `warning` are unnumbered. All accept an optional name,
such as `\begin{theorem}[Cramér--Rao]`, and work with `\label` and `\cref`.

The notes class loads `tcolorbox`, `stmaryrd`, `amsmath`, `amssymb`,
`enumitem`, `titlesec`, `xcolor`, `graphicx`, `geometry`, `hyperref`, and
`cleveref`, along with both shared command files. Add an optional
document-specific title logo with `\titlelogo{...}`.

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
`ulem`, `enumerate`, `hyperref`, and `geometry`. It uses the shared fonts and
accent colour: a thin green rule under the sender block, and green position
titles, referee names, and links.

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

The class removes Beamer navigation symbols, uses serif Libertinus fonts, and
recolours the `Berlin` theme and blocks with the shared green palette. It loads `amsthm`, `amsmath`,
`amssymb`, `xcolor`, `geometry`, `graphicx`, `csvsimple`, `tikz`, and
`inputenc`. It also loads both shared command files. Set `\institute{...}`
and `\logo{...}` in an individual document when needed. Beamer provides its
own `theorem`, `definition`, and `example` blocks, so `studentboxes` is not
loaded.

## Shared Style

All classes follow one style guide, implemented in three shared packages:

| Package | Contents |
| --- | --- |
| `studentstyle.sty` | Colour palette, fonts, `microtype`, and the `\StudentsLoadLinks` / `\StudentsLoadCleveref` loaders |
| `studentlayout.sty` | `\class`, `\titlelogo`, `\subtitle`, `\instructor`, `\term`, `\StudentsTitlePage`, `\StudentsRunningHeader`, and `\StudentsHeadings` |
| `studentboxes.sty` | The boxed theorem-style environments and `proof` |

The look is classic academic: Libertinus serif text and math, a deep green
accent, small-caps chapter titles, and coloured boxes with a bar on the left.
Headings follow a fixed colour scheme: chapters are black, sections use the
full accent colour, and subsections and deeper levels use a lighter tint
(`studentsaccentsoft`).

### Changing the style

- **Accent colour:** edit `studentsgreen` in `studentstyle.sty`. The accent
  (`studentsaccent`), its light tint used in boxes (`studentsaccentlight`), and
  the lighter heading tint (`studentsaccentsoft`, the accent mixed with white)
  are derived from the `\colorlet` lines just below. The `Berlin` colours in
  `presentation.cls` also use the accent.
- **Box colours:** the brown, slate, gold, and red pairs (full and light) are
  defined in `studentstyle.sty` and assigned to environments in
  `studentboxes.sty`.
- **Lighter or darker subsections:** change the percentage in
  `\colorlet{studentsaccentsoft}{studentsgreen!72!white}`.
- **Fonts:** change the font packages in `studentstyle.sty`. pdfLaTeX uses
  `libertinus-type1` with `libertinust1math`, and XeLaTeX or LuaLaTeX use
  `libertinus-otf`. The `ptm` option switches to Times, which `notes` uses in
  `compact` mode.
- **Title page, running header, and heading sizes:** edit
  `studentlayout.sty`. Change `notes.cls` for notes-only chapter formatting.
- **Boxes:** edit `\students@box` in `studentboxes.sty` for the frame, padding,
  and spacing, or add an environment next to the others there. Remember to add
  new environments and commands to `intellisense/latex-custom-classes.cwl` and
  to `snippets/latex.code-snippets`.
- **New class:** load `studentstyle` (and `studentlayout` or `studentboxes` as
  needed), call `\StudentsLoadLinks` last, and keep headings in the accent
  colours.

The `compact` option of `notes` is deliberately separate from the style: it
keeps the Times fonts, drops the header and boxes, and uses the same accent
colours for headings and bullets.

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
