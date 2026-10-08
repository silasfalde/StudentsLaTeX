# Custom commands and environments from latex_custom_classes.
# This is the source of truth. After editing, regenerate the LaTeX Workshop
# JSON with: python3 intellisense/generate-json.py
# The text inside [] / {} / || is the placeholder shown in the snippet.

# Classes
\documentclass[options]{assignment}
\documentclass[options]{essay}
\documentclass[options]{notes}
\documentclass[options]{coverletter}
\documentclass[options]{presentation}

# Class commands
\class{class name}
\titlelogo{logo content}
\subtitle{subtitle}
\instructor{instructor name}
\term{term}
\headerlogo{logo content}
\manuscript{title}{details}
\suggestedref{name}{title or affiliation}{email}

# Cross references (cleveref, loaded by assignment, essay, and notes)
\cref{label}
\Cref{label}

# Boxed environments (studentboxes, loaded by assignment and notes)
\begin{definition}[name]
\begin{theorem}[name]
\begin{lemma}[name]
\begin{proposition}[name]
\begin{corollary}[name]
\begin{example}[name]
\begin{remark}
\begin{note}
\begin{warning}
\begin{proof}[name]

# Assignment environments
\begin{problem}
\begin{context}
\begin{solution}

# Math commands
\diff
\prob
\stddev
\expect
\variance
\entropy
\infoGain
\pdf
\cdf
\covariance
\binomialdist
\bernoullidist
\normaldist
\gammadist
\poissondist
\uniformdist
\betadist
\exp
\ln
\mse
\mle
\sign
\Loss
\Risk
\RSS
\SSreg
\floor{expression}
\ceil{expression}
\softmax
\magnitude{expression}
\norm{expression}
\BigO
\argmax
\reward
\utility

# Programming listings
\begin{lstlisting}[options]
\lstset{style}
\lstinputlisting[options]{file}
\lstinline|code|
