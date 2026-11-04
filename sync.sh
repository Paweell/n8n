#!/bin/bash

# Skrypt synchronizacji repozytorium n8n z GitHubem

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR" || exit 1

echo "=========================================="
echo "🚀 Aktualizacja repozytorium n8n -> GitHub"
echo "=========================================="

# 1. Sprawdzenie czy są lokalne zmiany do zatwierdzenia (uncommitted)
HAS_CHANGES=$(git status --porcelain)

if [ -n "$HAS_CHANGES" ]; then
    echo "📋 Wykryto nowe/zmodyfikowane pliki:"
    git status -s

    if [ -z "$1" ]; then
        read -p "Wpisz opis zmian (commit message) [Aktualizacja workflow]: " MSG
        if [ -z "$MSG" ]; then
            MSG="Aktualizacja workflow"
        fi
    else
        MSG="$1"
    fi

    echo "📦 Tworzenie commita: $MSG"
    git add .
    git commit -m "$MSG"
else
    echo "ℹ️ Drzewo robocze czyste (brak nowych zmian w plikach)."
fi

# 2. Sprawdzenie czy lokalna gałąź ma commity do wysłania na serwer
echo "⬆️ Wysyłanie commitów na GitHuba (origin main)..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ Repozytorium jest w pełni zsynchronizowane z https://github.com/Paweell/n8n.git"
else
    echo "⚠️ Błąd podczas pushowania. Upewnij się, że masz uprawnienia do repozytorium (SSH/Token)."
fi
