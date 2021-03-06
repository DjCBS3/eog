\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "Yet There Is Room"
  subsubtitle = "(10. 10. 10.)"
  %meter = "10.10.10."
  poet = "Dr. H. Bonar"
  composer = "Ira D. Sankey"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 2=72 }
tb = { \tempo 2=36 }

patternAA = { c2 c4. c8 c2 r4 c4 | c4. c8 c4 c4 c1 }
patternAB = { c2 c4. c8 c2 c2    | c4. c8 c4 c4 c1 }

patternBA = { c1 c2 r2 | c1 c2 r4 c4 | c2. c4 c2 c | c1 r1 }

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 4/2
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key f \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c'' {

  % XXX too much vspace
  << s^\markup { \italic "Slow, with expression." }
  \changePitch \patternAA { c b c a f | a a g f g } >>
  \changePitch \patternAB { bes c g bes a | g c b d c }

  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternBA { c a | c^\markup { \dynamic p } a f^\markup { \dynamic mf } | a bes a g | f r } >>

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { a gis a f c | f f c c e  }
  \changePitch \patternAB { e e e g f | e e f f e }

  \changePitch \patternBA { f f | f f c | f f f e | f r}

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { c d c c a | c c bes a c }
  \changePitch \patternAB { c g c c c | c c d b c }

  \changePitch \patternBA { a c | a c a | c d c bes | a r }

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternAA { f f f f f | f f e f c }
  \changePitch \patternAB { c c c f f | g g g g c, }

  \changePitch \patternBA { f f | f f f | f bes, c c | < f f, > r }

}
}

Refrain = \lyricmode {

Room, room, still room! O, en -- ter, en -- ter now!

}

LastRefrain = \lyricmode {

{ \italicsOn }
No room! no room! O, woe -- ful cry!— “No room!”
{ \italicsOff }

}

wordsA = \lyricmode {
\set stanza = "1."

“Yet there is room!” The Lamb’s bright hall of song, \bar "."
With its fair glo -- ry, beck -- ons thee a -- long; \bar "."

\Refrain

}

wordsB = \lyricmode {
\set stanza = "2."

Day is de -- clin -- ing, and the sun is low;
The shad -- ows length -- en, light makes haste to go.

}

wordsC = \lyricmode {
\set stanza = "3."

The brid -- al hall is fill -- ing for the feast:
Pass in! pass in! and be the Bride -- groom’s guest.
{ \skip 4 \markup { \italic "(Last verse only)" } }

}

wordsD = \lyricmode {
\set stanza = "4."

It fills, it fills, that hall of ju -- bi -- lee!
Make haste, make haste; ’tis not too full for thee.

\LastRefrain

}

wordsE = \markuplines {

\line { Yet there is room! Still open stands the gate, }
\line { The gate is love; it is not yet too late.      }

}

wordsF = \markuplines {

\line { Pass in! pass in! That banquet is for thee; }
\line { That cup of everlasting love is free.       }

}

wordsG = \markuplines {

\line { Louder and sweeter sounds the loving call:    }
\line { Come, lingerer, come; enter that festal hall. }

}

wordsH = \markuplines {

\line { Ere night that gate may close, and seal thy doom: } 
\line { Then the last low, long cry, “No room! no room!”  } % XXX original does not have closing quote

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
      %\context Lyrics = five  \lyricsto sopranos \wordsE
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

\markup { \fill-line { \column {
  \line{ \bold 5 \column { \wordsE } } \vspace #0.4
  \line{ \bold 6 \column { \wordsF } } \vspace #0.4
  \line{ \bold 7 \column { \wordsG } } \vspace #0.4
  \line{ \bold 8 \column { \wordsH } } %\vspace #0.4
} } }


\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
