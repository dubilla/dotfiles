# newrepo [name] — create (or init the current dir as) a git repo and hydrate
# its AGENTS.md with the shared doctrine at birth.
#
# For an existing or freshly-cloned repo, run `agents-sync --here` from inside it.
newrepo() {
  if [ -n "$1" ]; then
    mkdir -p "$1" && cd "$1" || return 1
  fi
  [ -d .git ] || git init >/dev/null
  agents-sync --here
}
