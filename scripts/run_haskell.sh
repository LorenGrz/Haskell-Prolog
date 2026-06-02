#!/usr/bin/env bash
set -euo pipefail

# Desde la raíz del repo
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [ "${1:-}" = "all" ]; then
  shopt -s nullglob
  for hs in */*.hs; do
    echo "=== Ejecutando $hs ==="
    runghc "$hs"
    echo
  done
  exit 0
fi

if [ -z "${1:-}" ]; then
  echo "Uso: $0 <carpeta> | all"
  exit 1
fi

target="$1"
shopt -s nullglob
files=("$target"/*.hs)
if [ ${#files[@]} -eq 0 ]; then
  echo "No se encontró ningún archivo .hs en la carpeta '$target'"
  exit 2
fi

for f in "${files[@]}"; do
  echo "=== Ejecutando $f ==="
  runghc "$f"
  echo
done
