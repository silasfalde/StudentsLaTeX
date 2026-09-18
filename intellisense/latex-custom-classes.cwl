# Custom commands and environments from latex_custom_classes.
# Use this file with TeXstudio or convert it to LaTeX Workshop JSON data.

# Classes
\documentclass[options]{assignment}
\documentclass[options]{essay}
\documentclass[options]{notes}
\documentclass[options]{coverletter}
\documentclass[options]{presentation}

# Class commands
\class{class name}
	itlelogo{logo content}
\headerlogo{logo content}
\manuscript{title}{details}
\suggestedref{name}{title or affiliation}{email}

# Assignment environments
\begin{problem}
\begin{context}

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
\begin{lstlisting}[language=pseudo]
\lstset{style=mystyle}
\lstinputlisting[options]{file}
\lstinline|code|
