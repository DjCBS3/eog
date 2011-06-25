\paper {
  #(set-paper-size "letter")
  indent        = 0\cm
  top-margin    = 1\cm
  bottom-margin = 1\cm
  left-margin   = 1\cm
  right-margin  = 1\cm
    %annotate-spacing = ##t
    %systems-per-page = 4
    %page-count = 1
}

\include "inc/changePitch.ly"

\header{
  title = "Behold the Saviour At the Door"
  subsubtitle = "(St. Catherine. 6-8s.)"
  %meter = "6-8s."
  poet = "Joseph Grigg"
  composer = "J. G. Walton"
  %copyright = ""
  tagline = ##f
}

patternA = { c4 c4 c4 \noBreak | c4( c4) c4 \noBreak | c4( c4) c4 \noBreak | c2. \break } % Soprano 1
patternB = { c4 c4 c4 \noBreak | c2      c4 \noBreak | c4( c4) c4 \noBreak | c2. \break } % Soprano 2
patternC = { c4 c4 c4 \noBreak | c2      c4 \noBreak | c2      c4 \noBreak | c2. \break } % Alto 1 & Tenor / Bass 2
patternD = { c4 c4 c4 \noBreak | c2      c4 \noBreak | c2      c4 \noBreak | c2. \break } % Alto 2
patternE = { c4 c4 c4 \noBreak | c4( c4) c4 \noBreak | c2      c4 \noBreak | c2. \break } % Tenor / Bass 1

patternR = { c4 c4 c4 \noBreak | c2      c4 \noBreak | c2      c4 \noBreak | c2. \break } % Soprano / Alto / Bass Refrain
patternS = { c4 c4 c4 \noBreak | c2      c4 \noBreak | c4( c4) c4 \noBreak | c2. \break } % Tenor Refrain

global = {
  %\autoBeamOff
  \override Staff.TimeSignature #'style = #'() \time 3/4
  % TODO \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 4)
  \once \override Score.MetronomeMark #'transparent = ##t
  \tempo 4 = 96
  \key aes \major
  %\partial 4.
}

notesSoprano = {
\global
\relative c'' {

  \changePitch \patternA { c bes aes   | aes g aes | bes f g   | aes } 
  \changePitch \patternB { aes g f     | ees aes   | aes g aes | bes } 
  \changePitch \patternA { c bes aes   | aes g aes | bes f g   | aes } 
  \changePitch \patternB { aes g f     | ees c'    | bes c bes | aes } 
  
  << s^\markup { \small \caps "Refrain" }
  \changePitch \patternR { des des des | c c       | bes bes   | c   } >>
  \changePitch \patternR { c bes aes   | f aes     | bes bes   | aes } 
  \bar "|."

}
}

notesAlto = {
\global
\relative e' {

  \changePitch \patternC { ees ees ees | ees ees | f ees | ees } 
  \changePitch \patternD { f ees des   | c ees   | d d   | ees } 
  \changePitch \patternC { ees ees ees | ees ees | f ees | ees } 
  \changePitch \patternD { f ees des   | c ees   | d des | c   } 

  \changePitch \patternR { f f f       | ees aes | g g   | aes } 
  \changePitch \patternR { ees ees ees | f f     | g ees | ees } 

}
}

notesTenor = {
\global
\relative a {

  \changePitch \patternE { aes des c   | c des c | des bes     | c   } 
  \changePitch \patternC { aes aes aes | aes aes | bes aes     | g   } 
  \changePitch \patternE { aes des c   | c des c | des bes     | c   } 
  \changePitch \patternC { aes aes aes | aes aes | aes g       | aes } 

  \changePitch \patternR { aes aes aes | aes ees | ees' ees    | ees } 
  \changePitch \patternS { ees des c   | des c   | ees bes des | c   } 

}
}

notesBass = {
\global
\relative f {

  \changePitch \patternE { aes aes aes | aes bes aes | des, ees | aes, } 
  \changePitch \patternC { des des des | aes c       | bes bes  | ees  } 
  \changePitch \patternE { aes aes aes | aes bes aes | des, ees | aes, } 
  \changePitch \patternC { des des f   | aes f       | bes, ees | aes, } 

  \changePitch \patternR { des des des | aes aes     | ees' ees | aes  } 
  \changePitch \patternR { aes aes aes | des, f      | ees ees  | aes, } 

}
}

Refrain = \lyricmode {

  O -- pen the door, He’ll en -- ter in,
  And sup with you, and you with Him.

}

wordsA = \lyricmode {
\set stanza = "1."

  Be -- hold the Sav -- iour at the door!
  He gen -- tly knocks— has knocked be -- fore;
  Has wait -- ed long— is wait -- ing still:
  You use no oth -- er friend so ill.

}

wordsB = \lyricmode {
\set stanza = "2."

  O love -- ly at -- ti -- tude! He stands
  With o -- pen heart and out -- stretched hands;
  O match -- less kind -- ness! and He shows
  His match -- less kind -- ness to His foes.
  \Refrain
}

wordsC = \lyricmode {
\set stanza = "3."

  Ad -- mit Him, ere His an -- ger burn,
  Lest He de -- part and ne’er re -- turn;
  Ad -- mit Him, or the hour’s at hand
  When at His door de -- nied you’ll stand.

}

wordsD = \lyricmode {
\set stanza = "4."

  Ad -- mit Him, for the hu -- man breast
  He’er en -- ter -- tained so kind a guest;
  No mor -- tal tongue their joys can tell,
  With whom He con -- de -- scends to dwell.

}

% TODO: use http://lsr.dsi.unimi.it/LSR/Snippet?id=653

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
    \context {
      \Score
      % **** Turns off bar numbering
      \remove "Bar_number_engraver"
    }
    \context {
      \Lyrics
      % **** Prevents lyrics from running too close together
      \override LyricSpace #'minimum-distance = #0.6
      % **** Makes the text of lyrics a little smaller
      %\override LyricText #'font-size = #-0.5
      % **** Moves lines of lyrics closer together
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
    }
  }
  \midi{
% from http://old.nabble.com/Issue-1647-in-lilypond%3A-MIDI-skips-note-if-the-pitch-is-already-sounding-in-the-same-channel-td31563955.html
%%{% begin workaround 
% I find the workaround to be essential for proof-hearing piano pieces 
     \context { 
       \Score 
       %% Begin: for versions >2.13.54 
       % assign one MIDI channel to each Staff_performer 
       midiChannelMapping = #'staff 
       %% End: for versions >2.13.54 
     } 
     % create a different Staff_performer (sic) for each *Voice* 
     % so that you get one MIDI channel per Voice 
     \context { 
       \Staff 
       \remove "Staff_performer" 
     } 
     \context { 
       \Voice 
       \consists "Staff_performer" 
     } 
%%}% end workaround 
  
  }
}

\version "2.14.1"  % necessary for upgrading to future LilyPond versions.

% vi:set et ts=2 sw=2 ai nocindent syntax=lilypond
