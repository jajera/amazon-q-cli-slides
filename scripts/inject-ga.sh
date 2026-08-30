#!/usr/bin/env bash
# Inject GA4 gtag into Marp HTML output (idempotent).
set -euo pipefail

HTML="${1:-docs/index.html}"
GA_ID="${GA_MEASUREMENT_ID:-G-6GP64SX615}"

if [[ ! -f "$HTML" ]]; then
  echo "Missing $HTML" >&2
  exit 1
fi

if grep -q "googletagmanager.com/gtag/js?id=${GA_ID}" "$HTML"; then
  echo "GA already present in $HTML"
  exit 0
fi

python3 - "$HTML" "$GA_ID" <<'PY'
import sys
from pathlib import Path

path = Path(sys.argv[1])
ga_id = sys.argv[2]
html = path.read_text(encoding="utf-8")
snippet = f"""<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id={ga_id}"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){{dataLayer.push(arguments);}}
  gtag('js', new Date());
  gtag('config', '{ga_id}');
</script>
"""
if "</head>" not in html:
    raise SystemExit("No </head> in HTML")
path.write_text(html.replace("</head>", snippet + "</head>", 1), encoding="utf-8")
print(f"Injected {ga_id} into {path}")
PY
