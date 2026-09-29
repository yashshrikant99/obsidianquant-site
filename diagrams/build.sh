#!/usr/bin/env bash
# Render every .d2 source to SVG (page) and PNG (deck).
set -euo pipefail
cd "$(dirname "$0")"
L=(--layout elk --elk-nodeNodeBetweenLayers 30 --elk-edgeNodeBetweenLayers 18
   --elk-padding "[top=22,left=22,bottom=22,right=22]" --pad 14)
for src in *.d2; do
  n="${src%.d2}"
  d2 "${L[@]}" "$src" "$n.svg" >/dev/null
  d2 "${L[@]}" "$src" "$n.png" >/dev/null
  printf "  %-18s %s\n" "$n" "$(sips -g pixelWidth -g pixelHeight "$n.png" | awk '/pixel/{printf "%s ", $2}')"
done
echo done.
