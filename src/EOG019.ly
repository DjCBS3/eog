\include "common/global.ily"
\paper {
  \include "common/paper.ily"
  %ragged-bottom = ##t
  %ragged-last-bottom = ##t
  %systems-per-page = ##f
  %page-count = ##f
}

\header{
  title = "It Is Finished"
  subsubtitle = "(7. 5. D.)"
  %meter = "7.5.D."
  %poet = "James Proctor"
  composer = "Ira D. Sankey"
  %copyright = ""
  tagline = ##f
}

% for fermata in MIDI
ta = { \tempo 4=90 }
tb = { \tempo 4=45 }

patternAA = { c4 c4 c4 c4   | c4. c8 c2      } %

patternBA = { c4 c4 c4 c4   | c1             } %
patternBB = { c4( c4) c4 c4 | c1             } %
patternBC = { c4 ~ c4 c4 c4 | c1             } %

patternCA = { c4. c8 c4 c4  | c4. c8 c4( c4) } %
patternCB = { c4. c8 c4 c4  | c4. c8 c2      } %
patternCC = { c4. c8 c4 c4  | c4 c4 c2      } %
patternCD = { c4. c8 c4 c4  | c4 c4 c4( c4) } %

patternDA = { c4 c4 c4. c8  | c1             } %
patternDB = { c4. c8 c4 c4  | c1             } %

global = {
  \include "common/overrides.ily"
  \override Staff.TimeSignature #'style = #'()
  \time 4/4
  \override Score.MetronomeMark #'transparent = ##t % hide all fermata changes too
  \ta
  \key a \major
  %\partial 4
  \autoBeamOff
}

notesSoprano = {
\global
\relative c' {

  \changePitch \patternAA { e e e e      | a b cis     }
  \changePitch \patternBA { d d gis, gis | a           }
  \changePitch \patternAA { e e e e      | a b cis     }
  \changePitch \patternBC { d d gis, gis | a           }

  << s^\markup { \small \caps "Refrain"  }
  \changePitch \patternCA { e' d cis b   | a gis fis e } >>
  \changePitch \patternDA { e a b cis    | b           }
  \changePitch \patternCD { cis cis b a  | gis fis e a }
  \changePitch \patternDB { b a cis b    | a           }

  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternAA { cis cis cis cis | e e e       }
  \changePitch \patternBA { fis fis d d     | cis         }
  \changePitch \patternAA { cis cis cis cis | e e e       }
  \changePitch \patternBC { fis fis d d     | cis         }

  \changePitch \patternCA { cis' b a gis    | fis e d cis }
  \changePitch \patternDA { cis e e e       | e           }
  \changePitch \patternCD { e e d cis       | e d cis e   }
  \changePitch \patternDB { d cis e d       | cis         }

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternAA { a a a a     | a gis a }
  \changePitch \patternBA { a b b b     | a       }
  \changePitch \patternAA { a a a a     | a gis a }
  \changePitch \patternBB { a b b b     | a       }

  \changePitch \patternCB { a a a a     | a a a   }
  \changePitch \patternDA { a a gis a   | gis     }
  \changePitch \patternCC { a a a a     | a a a   }
  \changePitch \patternDB { gis a a gis | a       }

}
}

notesBass = {
\global
\relative f, {

  \changePitch \patternAA { a a a a   | cis e a   }
  \changePitch \patternBA { d, b e e  | a,        }
  \changePitch \patternAA { a a a a   | cis e a   }
  \changePitch \patternBB { d, b e e  | a,        }

  \changePitch \patternCB { a a a a   | a a a     }
  \changePitch \patternDA { a cis e e | e         }
  \changePitch \patternCD { a, a a a  | d d a cis }
  \changePitch \patternDB { e e e e   | a,        }

}
}

Refrain = \lyricmode {

“It is fin -- ished!” yes, in -- deed,
Fin -- ished ev -- ’ry jot;
Sin -- ner, this is all you need,
Tell me, is it not?

}

wordsA = \lyricmode {
\set stanza = "1."

Noth -- ing, ei -- ther great or small— \bar "."
Noth -- ing, sin -- ner, no; \bar "." \break
Je -- sus did it, did it all, \bar "."
Long, long a -- go. \bar "." \break

}

wordsB = \lyricmode {
\set stanza = "2."

When He, from His loft -- y throne,
Stooped to do and die,
Ev -- ’ry -- thing was full -- y done;
% XXX this doesn't look quite right
{ \mon } Heark -- en { \moff } to His cry—

\Refrain

}

wordsC = \lyricmode {
\set stanza = "3."

Wear -- y, work -- ing, bur -- dened one,
Where -- fore toil you so?
Cease your do -- ing; all was done
Long, long a -- go.

}

wordsD = \lyricmode {
\set stanza = "4."

Till to Je -- sus’ work you cling,
By a sim -- ple faith,
“Do -- ing” is a dead -- ly thing—
{ \mon } “Do -- ing” { \moff } ends in death.

}

wordsE = \lyricmode {
\set stanza = "5."

Cast your dead -- ly “do -- ing” down—
Down at Je -- sus’ feet;
Stand “in Him,” “in Him” a -- lone,
{ \mon } Glo -- rious -- ly { \moff } com -- plete.

}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \set ChoirStaff.systemStartDelimiter = #'SystemStartBar
      \context Voice  = sopranos { \voiceOne << \notesSoprano >> }
      \context Voice  = altos { \voiceTwo << \notesAlto >> }
    >>

		\new Lyrics = one
		\new Lyrics = two
		\new Lyrics = three
		\new Lyrics = four
		\new Lyrics = five

    \new Staff = men <<
      \clef bass
      \context Voice  = tenors { \voiceOne << \notesTenor >> }
      \context Voice  = basses { \voiceTwo << \notesBass >> }
    >>

		\context Lyrics = one   \lyricsto sopranos \wordsA
		\context Lyrics = two   \lyricsto sopranos \wordsB
		\context Lyrics = three \lyricsto sopranos \wordsC
		\context Lyrics = four  \lyricsto sopranos \wordsD
		\context Lyrics = five  \lyricsto sopranos \wordsE
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
