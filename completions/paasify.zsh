if [[ ! -o interactive ]]; then
    return
fi

compctl -K _paasify paasify

_paasify() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(paasify commands)"
  else
    completions="$(paasify completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
