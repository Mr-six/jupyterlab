#!/bin/bash

CMD="jupyter lab --allow-root --ip=0.0.0.0 --no-browser"

if [[ -v PASSWORD ]]; then
  PASSWORD=$(python -c "import IPython; print(IPython.lib.security.passwd('$PASSWORD'))")
  CMD="$CMD --NotebookApp.token='' --NotebookApp.password='${PASSWORD}'"
fi

if [[ -v GIT_URL ]]; then
  git clone $GIT_URL /notebooks
fi

if [ -f /notebooks/packages.txt ]; then
  echo "INFO: Found packages.txt file in folder /notebooks. Executing it to install apt packages."
  apt-get update
  cat packages.txt | xargs apt-get install -y
fi

if [ -f /notebooks/requirements.txt ]; then
  echo "INFO: Found requirements.txt file in folder /notebooks. Installing via \"pip install -r requirements.txt\""
  pip install -r requirements.txt
fi

if [ -f /notebooks/extensions.txt ]; then
  echo "INFO: Found extensions.txt file in folder /notebooks. Installing via \"jupyter extension install --user\""
  cat extensions.txt | xargs -I {} jupyter {} install --user
fi

echo
echo "Installed software:"
python --version
pip --version
jupyter --version
echo "Node $(node --version)"
echo "NPM $(npm -v)"

echo
exec $CMD "$@"