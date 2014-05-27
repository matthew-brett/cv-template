\ProvidesClass{cv}

\LoadClass[11pt,letterpaper]{article} % Font size and paper type
\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}

% Defines the rSection environment for the large sections within the CV
\newenvironment{cvSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\sectionskip{\medskip} % The space after the heading section

