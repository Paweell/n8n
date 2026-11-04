#!/bin/bash

# Prosty skrypt do szybkiej aktualizacji repozytorium n8n na GitHubie

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR" || exit 1

echo "=========================================="
echo "🚀 Aktualizacja repozytorium n8n -> GitHub"
echo "=========================================="

# Sprawdzenie zmian
if [ -z "$(git status --porcelain)" ]; then
    echo "ℹ️ Brak nowych zmian do wysłania."
    exit 0
fi

git status -s

# Pobranie opisu commita
if [ -z "$1" ]; then
    read -p "Wpisz opis zmian (commit message) [Aktualizacja workflow]: " MSG
    if [ -z "$MSG" ]; then
        MSG="Aktualizacja workflow"
    fi
else
    MSG="$1"
fi

echo "📦 Dodawanie plików i tworzenie commita..."
git add .
git commit -m "$MSG"

echo "⬆️ Wysyłanie na GitHuba (branch: main)..."
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ Zmiany pomyślnie wysłane na https://github.com/Paweell/n8n.git"
else
    echo "⚠️ Błąd podczas pushowania. Upewnij się, że masz skonfigurowany klucz SSH / token GitHub."
fi
