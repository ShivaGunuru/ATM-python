#!/bin/bash
# Run from ATM-python repo root: bash reorganise.sh

set -e   # stop on any error

echo ">>> Creating folder structure..."
mkdir -p src data tests

# ─── Move source files ───────────────────────────────────────────
echo ">>> Moving source files to src/..."
git mv interface.py   src/interface.py
git mv excelcreate.py src/excelcreate.py

# ─── Move tests ──────────────────────────────────────────────────
echo ">>> Moving tests..."
git mv test.py tests/test_atm.py

# ─── Move data files (then gitignore them) ───────────────────────
echo ">>> Moving data files to data/..."
git mv database.xlsx     data/database.xlsx
git mv pin.txt           data/pin.txt
git mv transactions.txt  data/transactions.txt
git mv dumpins.txt       data/dumpins.txt

# ─── Remove junk files from tracking ────────────────────────────
echo ">>> Removing junk files from git tracking..."
git rm --cached get-pip.py 2>/dev/null || true
git rm --cached 2C7F3000   2>/dev/null || true
# Keep them locally if present but don't track
# Optionally delete: rm -f get-pip.py 2C7F3000

# ─── .gitignore ──────────────────────────────────────────────────
echo ">>> Writing .gitignore..."
cat > .gitignore << 'EOF'
# Runtime data — never commit sensitive files
data/pin.txt
data/database.xlsx
data/transactions.txt
data/dumpins.txt

# Junk / bootstrap files
get-pip.py
2C7F3000

# Python
__pycache__/
*.pyc
*.pyo
venv/
.env
EOF

# ─── requirements.txt ────────────────────────────────────────────
echo ">>> Writing requirements.txt..."
cat > requirements.txt << 'EOF'
openpyxl>=3.1.0
EOF

# ─── Fix import paths inside interface.py ────────────────────────
echo ">>> Patching file paths in src/interface.py..."
sed -i 's|open("pin.txt"|open("data/pin.txt"|g'           src/interface.py
sed -i 's|open("transactions.txt"|open("data/transactions.txt"|g' src/interface.py
sed -i 's|load_workbook("database.xlsx")|load_workbook("data/database.xlsx")|g' src/interface.py

# Same patches for excelcreate.py if it references these files
sed -i 's|"database.xlsx"|"data/database.xlsx"|g' src/excelcreate.py
sed -i 's|"pin.txt"|"data/pin.txt"|g'             src/excelcreate.py

# ─── Stage and commit ────────────────────────────────────────────
echo ">>> Staging all changes..."
git add -A

echo ">>> Committing..."
git commit -m "refactor: reorganise folder structure, add .gitignore and requirements.txt"

echo ">>> Pushing..."
git push origin main

echo ""
echo "✅ Done. New structure:"
echo ""
echo "ATM-python/"
echo "├── src/"
echo "│   ├── interface.py"
echo "│   └── excelcreate.py"
echo "├── data/          ← gitignored"
echo "│   ├── database.xlsx"
echo "│   ├── pin.txt"
echo "│   └── transactions.txt"
echo "├── tests/"
echo "│   └── test_atm.py"
echo "├── .gitignore"
echo "├── requirements.txt"
echo "└── README.md"
