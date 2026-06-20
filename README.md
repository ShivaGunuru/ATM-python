# 🏧 ATM Simulation — Python

![Python](https://img.shields.io/badge/Python-3.8%2B-blue?logo=python&logoColor=white)
![openpyxl](https://img.shields.io/badge/openpyxl-Excel%20DB-green)
![License](https://img.shields.io/badge/license-MIT-green)

> A terminal-based ATM simulation built in Python — supports PIN authentication, balance enquiry, cash withdrawal, deposit, fund transfer, PIN reset, and transaction history. User data stored in Excel via `openpyxl`.

---

## 📌 Table of Contents

- [About](#about)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Folder Structure](#folder-structure)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Security Notes](#security-notes)
- [About the Author](#about-the-author)

---

## About

A command-line ATM machine simulation that mimics real banking operations. Users authenticate via a 4-digit PIN (3 attempts before lockout). All account data — PINs, balances, and transaction history — is persisted using an Excel spreadsheet (`database.xlsx`) and flat text files, managed through Python's `openpyxl` library.

Built as a Python programming project at GITAM University.

---

## Features

| Option | Feature               | Description                                          |
|--------|-----------------------|------------------------------------------------------|
| `0`    | Check Balance         | Display current account balance                      |
| `1`    | Transaction History   | View full log from `transactions.txt`                |
| `2`    | Withdraw              | Deduct amount with balance validation                |
| `3`    | Deposit               | Add funds to account                                 |
| `4`    | Transfer              | Send funds to a registered account number            |
| `5`    | Reset PIN             | Update 4-digit PIN with validation                   |
| `6`    | Mini Statement        | Print recent transactions                            |
| `7`    | Quit                  | Exit gracefully                                      |

**Authentication:**
- 4-digit PIN required (range: 1000–9999)
- 3 failed attempts → account locked, program exits
- PIN input masked via `getpass`

---

## Tech Stack

| Component       | Technology           |
|-----------------|----------------------|
| Language        | Python 3.8+          |
| Excel DB        | `openpyxl`           |
| PIN masking     | `getpass` (stdlib)   |
| Data storage    | `.xlsx` + `.txt`     |

---

## Getting Started

### Prerequisites

- Python 3.8+
- pip

### Installation

```bash
# Clone
git clone https://github.com/ShivaGunuru/ATM-python.git
cd ATM-python

# Install dependencies
pip install -r requirements.txt
```

### Initialize the Database

```bash
python src/excelcreate.py
```

This creates `data/database.xlsx` and `data/pin.txt` with seed data.

### Run

```bash
python src/interface.py
```

---

## Usage

```
Please enter your 4-digit PIN (Attempts left: 3): ****

Welcome! Thank you for choosing our ATM services.

Please choose from the below listed options:
0. Check Balance       1. Transaction History
2. Withdraw            3. Deposit
4. Transfer            5. Reset PIN
6. Mini Statement      7. Quit
```

---

## Security Notes

**Important:** The following files contain sensitive runtime data and must never be committed to version control.

Add this `.gitignore`:

```gitignore
# Runtime data — never commit
data/pin.txt
data/database.xlsx
data/transactions.txt
dumpins.txt

# Junk files
get-pip.py
2C7F3000
__pycache__/
*.pyc
venv/
.env
```

> `pin.txt` and `database.xlsx` are currently committed in the repo. Remove them from tracking:
> ```bash
> git rm --cached pin.txt database.xlsx transactions.txt dumpins.txt get-pip.py 2C7F3000
> ```

---

## About the Author

**Gunuru Venkata Shiva Kumar**
B.Tech CSE | GITAM University, Visakhapatnam (CGPA: 8.99)
Backend Developer — Java, Spring Boot, Python

- 📧 shiva.gunuru@gmail.com
- 🔗 [GitHub](https://github.com/ShivaGunuru)
- 🔗 [LinkedIn](https://linkedin.com/in/shiva-gunuru)
