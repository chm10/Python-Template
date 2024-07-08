
set -e

exec "$@"

jupyter-lab --no-browser --ip 0.0.0.0 --port 8888 --NotebookApp.token='' --NotebookApp.password='' --notebook-dir=$(pwd) --allow-root