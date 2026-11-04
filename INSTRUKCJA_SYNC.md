# 🔄 Instrukcja korzystania ze skryptu `sync.sh`

Skrypt `sync.sh` służy do szybkiej synchronizacji lokalnych plików w folderze `profile/n8n` z Twoim zdalnym repozytorium na GitHubie:
👉 **`https://github.com/Paweell/n8n.git`**

Automatyzuje on 3 powtarzalne komendy gita:
1. `git add .` (dodaje wszystkie nowe/zmienione pliki, screeny, workflowy)
2. `git commit -m "opis zmian"` (tworzy punkt w historii z Twoją wiadomością)
3. `git push origin main` (wysyła całość na serwer GitHub)

---

## 🚀 Jak używać skryptu

### Sposób 1: Szybki push z opisem w jednej linijce (Zalecany)
Przejdź do folderu i podaj treść commita w cudzysłowie jako parametr:

```bash
cd /var/www/html/job-tracker/profile/n8n
./sync.sh "Dodano nowy workflow dla leadów"
```

---

### Sposób 2: Tryb interaktywny
Uruchom skrypt bez żadnych parametrów. Skrypt wyświetli zmienione pliki i sam zapyta Cię o opis:

```bash
cd /var/www/html/job-tracker/profile/n8n
./sync.sh
```
Pojawi się prompt:
```text
Wpisz opis zmian (commit message) [Aktualizacja workflow]:
```
- Wpisz własną wiadomość i naciśnij `Enter`.
- Albo po prostu naciśnij `Enter` – ustawi się domyślny opis: *"Aktualizacja workflow"*.

---

## 🛠️ Typowy scenariusz pracy:
1. Eksportujesz nowy proces z n8n jako plik `.json` do podfolderu w `profile/n8n`.
2. Robisz zrzut ekranu schematu `.png`.
3. Otwierasz terminal i wpisujesz:
   ```bash
   cd /var/www/html/job-tracker/profile/n8n
   ./sync.sh "Dodano schemat i json procesu rezerwacji"
   ```
4. Gotowe! Zmiany są od razu widoczne na Twoim profilu GitHub.

---

## ⚠️ Pierwsze uruchomienie / Rozwiązywanie problemów:

### 1. Brak uprawnień do wykonania (Permission denied)
Jeśli skrypt nie chce się uruchomić, nadaj mu uprawnienia wykonywania:
```bash
chmod +x /var/www/html/job-tracker/profile/n8n/sync.sh
```

### 2. Pytanie o login/hasło lub błąd autoryzacji przy pushu
GitHub od 2021 roku nie przyjmuje zwykłych haseł do konta przy komendzie `git push`. Wymaga:
- **Klucza SSH** (zalecane: adres remote w formacie `git@github.com:Paweell/n8n.git`)
- lub **Personal Access Token (PAT)** zamiast hasła (Token generujesz na GitHub: *Settings -> Developer Settings -> Personal access tokens* z uprawnieniem `repo`).

Jeśli chcesz przełączyć repozytorium na klucz SSH:
```bash
git remote set-url origin git@github.com:Paweell/n8n.git
```

### 3. Odrzucenie pierwszego pusha (`non-fast-forward` / `fetch first`)
Jeśli Twoje repozytorium na GitHubie zawierało już jakieś pliki (np. domyślne README utworzone przy zakładaniu repo na www), przy pierwszym razie wykonaj w terminalu:
```bash
cd /var/www/html/job-tracker/profile/n8n
git push -u origin main --force
```
Po tym pierwszym razie każde kolejne użycie `./sync.sh` będzie działać bez problemu.
