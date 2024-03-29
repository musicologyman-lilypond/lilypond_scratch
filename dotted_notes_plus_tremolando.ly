\version "2.24.2"

\header {
  tagline = ##f
}

#(define dotShift 2.4)

getExtraDotOffset = #(define-scheme-function
                      (hShift vShift)
                      (number? number?)
                      (cons (- (+ hShift 1) ) vShift))

\paper {
  #(set-paper-size '(cons ( * 6 in ) ( * 5 in )))
}

\book {
  \score {
    \new Staff \new Voice \relative cis {
      \clef bass
      \key b \minor
      <<
        {
          \once \override NoteColumn.force-hshift = #dotShift
          \repeat tremolo 12 {a32 cis}
        }
        \\
        {
          \stemUp
          \once \override Dots.extra-offset = \getExtraDotOffset #dotShift #1
          a2.
        }
        \\
        {
          \stemUp
          \once \override Dots.extra-offset = \getExtraDotOffset #dotShift #0
          \once \override NoteColumn.force-hshift = #0
          cis2.
        }
      >>
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
  }
}