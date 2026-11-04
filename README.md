# ⚡ n8n Workflows & Automation Portfolio

Zbiór produkcyjnych procesów automatyzacji i agentów AI stworzonych w środowisku **n8n**, integrujących systemy CRM, modele LLM, bazy danych oraz narzędzia komunikacyjne.

---

## 📂 Projekty w repozytorium

### 1. 🤖 [Inteligentny Agent AI (Kwalifikacja Leadów)](./kwalifikacja%20Leadów/README.md)
Pipeline kwalifikujący zgłoszenia z formularzy www przy użyciu modelu Gemini Flash / OpenAI, z wbudowaną separacją danych osobowych, ochroną przed prompt injection, formatowaniem JSON oraz synchronizacją z Google Sheets i HubSpot CRM (wraz z obsługą błędów i alertami Discord).

👉 **[Zobacz szczegółowy opis i schemat](./kwalifikacja%20Leadów/README.md)**

---

### 2. 🎈 [Automatyzacja Rezerwacji i Cyklu Komunikacji (Sala Zabaw)](./Automatyczne%20Maile/README.md)
Wieloetapowy proces obsługi rezerwacji eventowych: webhook z formularza, zaawansowana logika odmiany imion w JS (syn/córka), harmonogramowanie powiadomień (T-7, T-2, T+1, T+11m), generowanie szkiców maili HTML w Gmailu oraz alerty operacyjne na Discordzie.

👉 **[Zobacz szczegółowy opis i schemat](./Automatyczne%20Maile/README.md)**

---

## 🛠️ Wykorzystane technologie
- **Orkiestracja:** n8n
- **Modele LLM:** OpenAI API, Google Gemini Flash
- **Integracje API & Webhooki:** HubSpot CRM REST API, Google Sheets API, Gmail API, Google Calendar API, Discord Webhook
- **Języki i logika:** JavaScript / Node.js (Code nodes)

---

## 🔄 Jak aktualizować to repozytorium lokalnie
W katalogu projektu:
```bash
git add .
git commit -m "Aktualizacja workflow"
git push origin main
```
