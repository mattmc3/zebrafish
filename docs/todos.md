# TODOs:

## version 0.4.0

- [ ] Change defaut directories for zshrc.d and zfunctions to not have the
      leading dot when placed in `$ZDOTDIR`
- [ ] change from disabled features zstyle to enabled, but handle reasonable
      defaults if the zstyle is not set
- [x] Remove plugin and prompt functionality - those are out of scope and
      existing tools handle that better.

## Future

- [ ] review ZSH options before 1.0 and make sure they are reasonable defaults
- [ ] review keybindings before 1.0 and make sure they make sense and are all inclusive
- [ ] consider emacs vs vimode support
- [ ] consider command correction support

## version 0.3.0

- [x] Add support for zprompts
- [x] Add support for zplugins
- [x] Review config options and make zstyle easier
- [x] Ensure an 'offline' mode is well supported for servers with no github access

## Notes:

Remember to bumpversion with major, minor, patch as needed:

```shell
bumpversion --allow-dirty minor
```
