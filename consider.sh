#!/bin/zsh
#
# Name:     consider
# Author:   Matthew Rothenberg (https://github.com/mroth)
# Version:  v0.1.0
#
# Quickly check source code for common racist/sexist/ableist terms, that
# one might be being used without realizing it.
#
# Doesn't check for blatant racist stuff, because if you are using that, you
# have bigger problems. Instead just the sort of things that might
# unwittingly slip into source code comments of otherwise reasonably aware
# developers.
#
# Relies on ripgrep[1] to be installed, since it is WAY faster than anything else
# in the universe for searching large codebases.
#
# [1]: https://github.com/BurntSushi/ripgrep

WORDS=(
    crazy
    dumb
    lame
    loony
    lunatic
    ghetto
    idiot
    insane
    insanity
    maniac
    psycho
    retard
    sane
    sanity
    spaz
    stupid
)

SUGGESTIONS=$(cat <<EOF
Here are some substitutions I personally like to consider in the context of
code (note these are a bit different than oft-suggested substitutions, since
the context the words are used in code comments is typically a bit different.)

  [crazy, insane, loony...]   -> "wacky", "unexpected", "incomprehensible"
  [sane, sanity check...]     -> "reasonable", "coherent", "clarity check"
  [dumb, stupid, retarded...] -> "poorly written"
  [ghetto]                    -> "hacky"
EOF
)

# check if ripgrep is installed
if ! type rg > /dev/null; then
    echo "$(tput bold)ripgrep is not installed!$(tput sgr0)"
    echo '`brew install ripgrep` first (or see https://github.com/BurntSushi/ripgrep)'
    exit 1
fi

# combine the wordlist array into a string joined by a "|" character
# (so we can use it as an regex easily in next step)
WORDR="${(j:|:)WORDS}"

# check for terms, case insensitive, with Unicode word boundary beforehand
rg -e "(?i:\b(${WORDR}))" "$@"

if [ $? -eq 0 ]; then
    print $MATCHES
    echo "$(tput bold)Possible poor word choices (see above), review with the following in mind:$(tput sgr0)"
    print $SUGGESTIONS
    exit 1
else
    exit 0
fi
