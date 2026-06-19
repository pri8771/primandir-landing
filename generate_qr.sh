#!/usr/bin/env bash
# Generate a QR code for the tracked Digital Temple waitlist URL.
# Prefers no new dependency: uses `qrencode` if present, otherwise prints a
# free manual process and the exact URL to paste. No paid services.
set -euo pipefail

URL="https://share-na2.hsforms.com/2gvDkJfGJRAiBXt5oMio0hQ42qy01?utm_source=qr&utm_medium=qr&utm_campaign=beta_waitlist_v1"
OUT="primandir_waitlist_qr.png"

if command -v qrencode >/dev/null 2>&1; then
  qrencode -o "$OUT" -s 10 -m 2 "$URL"
  echo "QR written to: $(pwd)/$OUT"
  echo "Encodes: $URL"
elif command -v python3 >/dev/null 2>&1 && python3 -c "import qrcode" >/dev/null 2>&1; then
  python3 - "$URL" "$OUT" <<'PY'
import sys, qrcode
qrcode.make(sys.argv[1]).save(sys.argv[2])
print("QR written to:", sys.argv[2])
print("Encodes:", sys.argv[1])
PY
else
  cat <<EOF
No QR generator found locally (neither 'qrencode' nor python 'qrcode').

Free options (pick one):
  1) Install qrencode, then re-run this script:
       brew install qrencode
  2) Install the Python lib, then re-run:
       python3 -m pip install qrcode[pil]
  3) Generate manually with any free QR generator and paste this exact URL:

$URL

Save the PNG/SVG at high resolution for print, and test-scan it before use.
EOF
fi
