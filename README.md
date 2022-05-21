# misc.swift

Some useful things for Swift development:

* [Wildmatch](Sources/Commons/Wildmatch.swift): Simple wrapper around [davvid/wildmatch][wildmatch].
* [Fzy](Sources/Commons/Fzy.swift): Simple wrapper around [match functions][fzy-functions] of
  [jhawthorn/fzy][fzy].

We use [Nimble](https://github.com/Quick/Nimble) for assertions in tests.

## Develop

To update the dependencies, get the submodules and copy necessary files to the `Sources` folder:

```bash
git submodule update --init
./bin/prepare.sh
```


[wildmatch]: https://github.com/davvid/wildmatch
[fzy-functions]: https://github.com/jhawthorn/fzy/blob/master/src/match.h
[fzy]: https://github.com/jhawthorn/fzy
