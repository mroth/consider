# consider
> quickly check source comments for subtle racism/sexism/ableism

Quickly check source code for common racist/sexist/ableist terms, that one might
be being used without realizing it.

Doesn't check for blatant racist stuff, because if you are using that, you have
bigger problems. Instead just the sort of things that might unwittingly slip
into source code comments of otherwise reasonably aware developers.

Relies on [ripgrep][1] to be installed, since it is WAY faster than anything else
in the universe for searching large codebases.

[1]: https://github.com/BurntSushi/ripgrep

_This is really just a quick shell script for my own personal use, but putting
it online in case others find it helpful!_

<img alt="screenshot"
     src="https://cloud.githubusercontent.com/assets/40650/25104962/8e8b8f8c-2390-11e7-8352-95e82c638e93.png"
     width="597"
     height="271" />
