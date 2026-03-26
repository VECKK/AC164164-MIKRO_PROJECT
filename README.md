# Wielofunkcyjny system wbudowany IoT z modułem autoryzacji

Projekt zrealizowany na platformie mikrokontrolerowej ze zintegrowanym modułem sieciowym (płytka AC164164). System pełni funkcję inteligentnego terminala domowego, łącząc autoryzację dostępu, komunikację sieciową (IoT) oraz sterowanie urządzeniami zewnętrznymi.
Całość stworzona na przedmiot Aplikacje Mikrokontrolerów na kierunku Mikroelektronika w technice i medycynie wydziału EAIiIB na AGH.
Autorzy: Łukasz Gąsecki, Wiktoria Borycka, Kacper Kierzek

## 🚀 Główne funkcjonalności

* **Wielopoziomowa kontrola dostępu:** Logowanie do systemu z wykorzystaniem profili użytkowników, zabezpieczone czytnikiem zbliżeniowym RFID oraz weryfikacją kodem PIN wpisywanym na ekranie dotykowym.
* **Stacja informacyjna (REST API):** Asynchroniczne pobieranie aktualnych danych pogodowych z serwera zewnętrznego za pomocą modułu Wi-Fi i ich prezentacja na interfejsie graficznym.
* **Powiadomienia e-mail (SMTP):** Zautomatyzowany klient wysyłający spersonalizowane wiadomości z prognozą pogody do zalogowanego użytkownika.
* **Smart Home:** Sterowanie oświetleniem (inteligentna żarówka) z poziomu interfejsu urządzenia.

## 🛠 Wymagania sprzętowe

Do uruchomienia projektu potrzebne są następujące komponenty:
* **Płytka ewaluacyjna:** AC164164 (zawierająca układ z rodziny PIC oraz kontroler sieciowy ATWINC1500).
* **Wyświetlacz:** Moduł TFT LCD (sterownik ILI9341) ze zintegrowanym panelem dotykowym (komunikacja SPI).
* **Moduł RFID:** Czytnik PN532 (komunikacja I2C).
* **Elementy wykonawcze:** Inteligentna żarówka zgodna z protokołem używanym w projekcie.

## 💻 Środowisko i narzędzia

* **IDE:** MPLAB X IDE
* **Kompilator:** XC16 
* **Konfiguracja peryferiów:** Microchip Code Configurator (MCC)
* **Protokoły:** SPI (Ekran), I2C (RFID), TCP/IP (WINC1500 - HTTP, SMTP)

## 📁 Struktura projektu

Główny kod aplikacji znajduje się w katalogu `AC164164_mikroproject.X/`. Najważniejsze moduły to:

* `main.c` – Maszyna stanów zarządzająca główną pętlą programu, przełączaniem ekranów i obsługą zdarzeń.
* `mcc_generated_files/` – Warstwa abstrakcji sprzętu (HAL), sterowniki wygenerowane przez MCC (zegary, timery, stos Wi-Fi WINC1500, drivery I2C/SPI).
* `ILI9341_files/` – Biblioteki do obsługi wyświetlacza graficznego (`tft_gfx.c`) oraz warstwy dotykowej (`touch_sensor.c`).
* `RFID/` – Sterowniki układu PN532 do odczytu tagów i kart zbliżeniowych (`pn532.c`).
* `BULB/` – Moduł odpowiedzialny za komunikację z inteligentną żarówką (`bulb.c`).
* `mcc_generated_files/examples/` – Wyodrębniona logika biznesowa i sieciowa:
    * `wifi_connection.c` – Ustanawianie połączenia z punktem dostępowym.
    * `user_manager.c` – Zarządzanie profilami, PIN-ami i przypisanymi tagami RFID.
    * `weather_client.c` – Formatowanie zapytań HTTP i parsowanie odpowiedzi API.
    * `email_client.c` – Zestawianie bezpiecznego połączenia i wysyłka wiadomości SMTP.
    * `city_menu.c` – Obsługa interfejsu graficznego dla wyboru lokalizacji.
