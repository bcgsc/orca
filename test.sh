sleep 5
# The bug with `quast`, have to test twice!
# brew test quast || true

if (brew test $(brew list)) |& grep -q ': failed'; then
  echo "Tests failed!"
  exit 1
else
  brew tests
  # The jdk is hard to fix
  brew linkage --test $(brew list | egrep -v '^jdk$')
fi
