\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "Vain Is The Thought of Man"
  subsubtitle = "(Moreland. S. M.)"
  %meter = "S.M."
  poet = "Mary Bowley"
  %composer = ""
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=110 }
tb = { \tempo 4=55  }

patternAA = { c2 c4 c4 | c2 c2 | c1 }
patternAB = { c2 c4 c4 | c2 c2 | c4 c4 c2 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key g \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternAA { g a b | c a | b }
  \changePitch \patternAA { d e d | b g | a }
  \changePitch \patternAB { b c b | g b | a g a }
  \changePitch \patternAA { d b g | e fis | g }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { d d d | e d | d }
  \changePitch \patternAA { g g g | d cis | d }
  \changePitch \patternAB { d e d | b d | d cis d }
  \changePitch \patternAA { d d d | c c | b }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { b a g | g fis | g }
  \changePitch \patternAA { g g g | g a | fis }
  \changePitch \patternAB { g g g | g g | a a fis }
  \changePitch \patternAA { g g g | c a | g }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { g fis g | c, d | g, }
  \changePitch \patternAA { b c b | g e' | d }
  \changePitch \patternAB { g, g g | g g' | fis e d }
  \changePitch \patternAA { b b b | c d | g, }

}
}

wordsA = \lyricmode {
\set stanza = "1."

Vain is the tho’t of man \bar "."
To mer -- it heav’n by prayer; \bar "."
’Tis on -- ly Je -- sus’ pre -- cious blood \bar "."
Can give ad -- mis -- sion there. \bar "."

}

wordsB = \lyricmode {
\set stanza = "2."

Could cease -- less prayers as -- cend,
Could tears for -- ev -- er flow,
The soul were still un -- blest, un -- saved,
And peace could nev -- er know.

}

wordsC = \lyricmode {
\set stanza = "3."

But faith’s one look at Christ
Ex -- pir -- ing on the tree—
One heart -- be -- liev -- ing glance at Him
Can set the sin -- ner free.

}

wordsD = \lyricmode {
\set stanza = "4."

None can with -- out the blood
Of Je -- sus be for -- giv’n;
’Tis rest -- ing on the blood a -- lone
That fits the soul for heav’n.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
      \context Lyrics = one   \lyricsto sopranos \wordsA
      \context Lyrics = two   \lyricsto sopranos \wordsB
      \context Lyrics = three \lyricsto sopranos \wordsC
      \context Lyrics = four  \lyricsto sopranos \wordsD
    >>
    \context Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>
  >>
  \layout {
    \include "common/layout.ily"
  }
  \midi{
    \include "common/midi.ily"
  }
}

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
