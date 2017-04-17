# consider
> quickly check source comments for subtle racism/sexism/ableism

Quickly check source code for common racist/sexist/ableist terms, that one might
be being used without realizing it.

Doesn't check for blatant stuff, because if you are using that, you have bigger
problems. Instead just the sort of things that might unwillingly slip into
source code comments of otherwise reasonably aware developers.

Relies on ripgrep[1] to be installed, since it is WAY faster than anything else
in the universe for searching large codebases.

[1]: https://github.com/BurntSushi/ripgrep

_This is really just a quick shell script for my own personal use, but putting
it online in case others find it helpful!_
