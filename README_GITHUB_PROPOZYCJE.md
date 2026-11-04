# 🚀 Repozytoria GitHub dla Automatyzacji n8n

Propozycja profesjonalnych nazw repozytoriów, struktury plików oraz gotowe opisy `README.md` (w języku polskim i angielskim, zoptymalizowane pod profil developera AI / Automation Engineera).

---

## 📁 Projekt 1: Inteligentny Agent AI (Kwalifikacja Leadów)

### Proponowane nazwy repozytorium (wybierz jedną):
1. **`n8n-ai-lead-qualification-agent`** ⭐ *(Rekomendowana – czytelna, profesjonalna, dobrze pozycjonuje się na GitHubie)*
2. **`hubspot-n8n-ai-agent`**
3. **`ai-lead-triage-pipeline`**

---

### Plik: `README.md` (wklej do folderu `kwalifikacja Leadów` lub repozytorium)

```markdown
# 🤖 n8n AI Lead Qualification Agent

> Produkcyjny workflow w **n8n** integrujący skrzynkę pocztową, modele LLM (Google Gemini / OpenAI), arkusze Google Sheets oraz HubSpot CRM z wbudowaną architekturą bezpieczeństwa i obsługą błędów.

![Schemat workflow](./kwalifikacja_leadow.png)

---

## 🎯 Problem biznesowy
Ręczna kwalifikacja zapytań ofertowych spływających przez formularze www jest czasochłonna, podatna na błędy i spowalnia czas pierwszej reakcji do klienta (First Response Time). Ponadto przesyłanie surowych danych bezpośrednio do zewnętrznych LLM niesie ze sobą ryzyko ataków typu *Prompt Injection* oraz niepotrzebnego wycieku wrażliwych danych kontaktowych.

## 💡 Rozwiązanie
Zbudowany pipeline działa w pełni autonomicznie w tle:
1. **Odbiór zgłoszenia:** Trigger Gmail nasłuchuje na nowe wiadomości z formularza kontaktowego.
2. **Data Privacy & Sanitization (Node JS):** 
   - Oddzielenie danych osobowych (imię, telefon, e-mail) od treści pytania przekazywanego do modelu AI.
   - Ochrona przed atakami typu Prompt Injection (blokowanie fraz typu `ignore previous instructions`, `system prompt`).
   - Normalizacja numerów telefonów (format E.164 / +48).
3. **Analiza LLM (Structured Output):**
   - Model językowy (Gemini 3.5 Flash / OpenAI) analizuje intencję klienta (`wycena`, `wsparcie`, `spam`), szacuje budżet, ocenia sentyment i przygotowuje gotowy szkic odpowiedzi wg bazy wiedzy firmy.
   - Wymuszenie ścisłego formatu JSON (brak halucynacji formatowania).
4. **Zapis i synchronizacja:**
   - Logowanie zgłoszenia do bazy w Google Sheets (z kontrolą duplikatów po ID).
   - Automatyczne utworzenie kontaktu oraz transakcji (Deal) w HubSpot CRM ze sformatowanym podsumowaniem AI.
5. **Mechanizm odporności na awarie (Fault Tolerance):**
   - Weryfikacja poprawności odpowiedzi AI.
   - Pętla ponawiania z licznikiem (do 3 prób) z odstępem czasowym.
   - Kanał typu Dead-Letter: powiadomienie na kanale Discord w przypadku trwałej awarii API modelu.

---

## 🛠️ Stack technologiczny
- **Orkiestracja:** n8n (Code Nodes, Logic Flow, Loops, Error Handling)
- **Modele LLM:** Google Gemini Flash / OpenAI API (Structured JSON Prompting)
- **Integracje API:** Gmail API, Google Sheets API, HubSpot CRM REST API, Discord Webhooks
- **Język skryptowy:** JavaScript (Node.js) wewnątrz węzłów n8n

---

## 📋 Struktura zwracanego obiektu JSON z LLM
```json
{
  "intencja": "wycena | wsparcie_techniczne | oferta_pracy | spam | inne",
  "temat_glowny": "Krótkie podsumowanie problemu (max 6 słów)",
  "szacowany_budzet": "Wykryta kwota lub 'nieokreślony'",
  "sentyment": "pozytywny | neutralny | negatywny",
  "kluczowe_pytania": ["Lista konkretnych wymagań klienta"],
  "propozycja_odpowiedzi": "Gotowy szkic wiadomości e-mail"
}
```

---

## 🚀 Jak uruchomić u siebie
1. Zaimportuj plik `.json` do swojej instancji n8n.
2. Skonfiguruj poświadczenia (Credentials) dla:
   - Gmail OAuth2
   - Google Gemini API / OpenAI API
   - Google Sheets OAuth2
   - HubSpot App Token
   - Discord Webhook
3. Zaktualizuj ID arkusza Google Sheets oraz Pipeline ID w HubSpot.
4. Aktywuj workflow.
```

---
---

## 📁 Projekt 2: Automatyczne Maile i Obsługa Rezerwacji (Sala Zabaw)

### Proponowane nazwy repozytorium (wybierz jedną):
1. **`n8n-booking-lifecycle-automation`** ⭐ *(Rekomendowana – brzmi bardzo inżyniersko i biznesowo)*
2. **`event-booking-n8n-workflow`**
3. **`n8n-crm-email-scheduler`**

---

### Plik: `README.md` (wklej do folderu `Automatyczne Maile` lub repozytorium)

```markdown
# 🎈 n8n Event Booking & Communication Lifecycle Automation

> Kompleksowy system automatyzacji obsługi klienta i rezerwacji eventowych (sala zabaw / urodziny) zbudowany w **n8n**, integrujący formularze Webhook, Google Calendar, dynamiczne generowanie HTML, harmonogramowanie follow-upów oraz powiadomienia Discord.

![Schemat workflow](./automatyczne_maile.png)

---

## 🎯 Problem biznesowy
Przy obsłudze rezerwacji eventowych (np. przyjęcia urodzinowe) kluczowe jest natychmiastowe potwierdzenie, personalizacja komunikacji zależna od płci dziecka, precyzyjne harmonogramowanie wiadomości przed i po evencie (T-7 dni, T-2 dni, badanie satysfakcji, ponowienie oferty za rok) oraz powiadamianie obsługi obiektu bez konieczności ciągłego sprawdzania maila.

## 💡 Rozwiązanie
Workflow realizuje pełny cykl życia rezerwacji (Lifecycle Marketing & Operations):
1. **Przyjęcie zgłoszenia:** Webhook z formularza www przyjmuje dane zamówienia (pakiet, data, dodatki, dane solenizanta).
2. **Zaawansowana logika biznesowa (JavaScript Code Node):**
   - **Algorytm detekcji płci solenizanta:** Analiza imienia z uwzględnieniem wyjątków języka polskiego (np. Kuba, Kosma, Barnaba), pozwalająca na gramatycznie poprawną odmianę zwrotów (`syna / córki`, `Solenizanta / Solenizantki`).
   - **Dynamiczne generowanie harmonogramu powiadomień:** Automatyczne wyliczenie dat etapowych:
     - `T-7 dni` – mail organizacyjny z dopięciem menu i liczby gości,
     - `T-2 dni` – przypomnienie SMS/email przed samym wydarzeniem,
     - `T+1 dzień` – ankieta satysfakcji i prośba o opinię w Google,
     - `T+11 miesięcy` – reaktywacja klienta ze zniżką na kolejne urodziny.
3. **Generowanie szkicu wiadomości (HTML Draft):**
   - Złożenie spersonalizowanego maila HTML i zapisanie go jako wersja robocza w Gmail do szybkiej weryfikacji i wysyłki przez obsługę.
4. **Kanał powiadomień operacyjnych:**
   - Natychmiastowy alert na Discord dla zespołu z kompletem szczegółów zamówienia i linkiem do akceptacji draftu.
5. **Synchronizacja bazy i kalendarza:**
   - Zapis do Google Sheets z unikalnym ID zapytania (`cf-ray`).
   - Obsługa równoległego triggera z Google Calendar do potwierdzania statusów na osi czasu.

---

## 🛠️ Stack technologiczny
- **Narzędzie:** n8n
- **Integracje:** Webhook, Gmail (Drafts & Messages), Google Calendar, Google Sheets, Discord Webhooks
- **Język:** JavaScript / Node.js (przetwarzanie dat, regex, odmiana gramatyczna)

---

## 🚀 Jak uruchomić u siebie
1. Zaimportuj plik `.json` do instancji n8n.
2. Podepnij webhook pod swój formularz rezerwacyjny (np. Elementor, Contact Form 7, Typeform).
3. Dodaj uprawnienia do konta Google (Gmail, Sheets, Calendar) oraz webhook Discorda.
4. Dostosuj szablony HTML maili pod swoją markę.
```

---

## 💡 Wskazówki: Jak to umieścić na GitHubie

1. **Jeden profil – dwa osobne repozytoria:**
   - Zrób 2 publiczne repozytoria:
     - `n8n-ai-lead-qualification-agent`
     - `n8n-booking-lifecycle-automation`
2. **Pliki w każdym repozytorium:**
   - `README.md` (z treści powyżej)
   - `workflow.json` (przemianowany odpowiedni plik `.json`)
   - `screenshot.png` (zrzut ekranu z n8n podlinkowany w nagłówku README)
3. **Przypnij (Pin) oba repozytoria** na swoim profilu głównym GitHub.
4. **W CV i listach/odpowiedziach:**
   Zamiast pisać ogólny link `github.com/twoj-profil`, możesz podać bezpośredni link do repozytorium z agentem:
   `https://github.com/twoj-login/n8n-ai-lead-qualification-agent` – rekruter od razu widzi architekturę, screen i czysty kod.
