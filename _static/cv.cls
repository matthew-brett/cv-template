\ProvidesClass{cv}

\LoadClass[11pt,letterpaper]{article} % Font size and paper type
\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}
\usepackage{changepage}
\usepackage{needspace}
\usepackage{xparse}

% Defines the rSection environment for the large sections within the CV
% Optional arguments from
% http://tex.stackexchange.com/questions/11349/how-do-you-define-your-environment-such-as-to-use-for-some-parameters
% Indentation trick from
% http://tex.stackexchange.com/questions/35933/indenting-a-whole-paragraph
\NewDocumentEnvironment{cvSection}{m O{}}{
    % 1 input argument - section name
    % 1 optional argument - extra markup at end of section
  \Needspace{6\baselineskip}
  {\bf \MakeUppercase{#1}}#2 % Section title plus any extra stuff
  \sectionskip
  \sectionlineskip
  \hrule % Horizontal line
  \begin{adjustwidth}{0.5cm}{}
  }
  {\end{adjustwidth}
}

% A subsection of the CV, within a main section.  Extra indentation.
\NewDocumentEnvironment{cvSubSection}{m O{}}{
    % 1 input argument - subsection name
    % 1 optional argument - extra markup at end of subsection name
    \Needspace{4\baselineskip}
    {\em #1}#2
    \begin{adjustwidth}{0.5cm}{}
    }
    {\end{adjustwidth}
}

\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\sectionskip{\medskip} % The space after the heading section
