<!--
author:   Günter Dannoritzer
email:    g.dannoritzer@wvs-ffm.de
version:  0.1.1
date:     11.04.2025
language: de
narrator: Deutsch Female

comment:  Datensicherung und Wiederherstellung

icon:    https://raw.githubusercontent.com/dsp77/wvs-liascript/0938e2e0ce751e270e3e36b8ecfeb09044a41aa0/wvs-logo.png
logo:     02_img/logo-backup.jpg

tags:     LiaScript, Backup, Recovery, WORM, RTO, RPO, Datensicherung, Archivierung, Revisionssicherheit

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js

attribute: Lizenz: [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)
-->
# Backupverfahren

Die **klassischen Datensicherungsmethoden** – **Vollbackup**, **differenzielles Backup** und **inkrementelles Backup** – sind grundlegende Konzepte der IT-Administration. Sie unterscheiden sich darin, **was** und **wie viel** gesichert wird, und wirken sich auf **Speicherplatz, Dauer und Wiederherstellungszeit** aus.

## 1. Vollbackup (Full Backup)

Es wird eine **komplette Kopie aller zu sichernden Daten** erstellt – unabhängig davon, ob sich etwas geändert hat.

Vorteile:

- Einfach zu verwalten.
- **Schnellste Wiederherstellung**, weil alles in einem Satz enthalten ist.

Nachteile:

- Benötigt **viel Speicherplatz**.
- Dauert relativ lange.

>Beispiel Vollbackup
>
>> Jeden Sonntag wird der gesamte Serverinhalt als Vollbackup gespeichert.


## 2. Differenzielles Backup

- Es werden **alle Änderungen seit dem letzten Vollbackup** gesichert – egal, wie viele differenzielle Backups seither gemacht wurden.

Vorteile:

- Schneller als ein Vollbackup.
- **Nur zwei Sicherungen** nötig zur Wiederherstellung: Vollbackup + letztes differenzielles Backup.

Nachteile:

- Backup-Größe **wächst mit der Zeit**, je weiter das letzte Vollbackup zurückliegt.

> Beispiel Differenzielles Backup
>
>> Montag: Vollbackup
>>
>> Dienstag: Es wird alles gesichert, was sich **seit Montag** geändert hat
>>
>> Mittwoch: Auch alles seit Montag
>>
>> usw.


## 3. Inkrementelles Backup

- Es werden **nur die Daten gesichert, die sich seit dem letzten Backup (egal welcher Art)** geändert haben.

Vorteile:

- **Sehr effizient** in Bezug auf Zeit und Speicherplatz.
- Ideal für tägliche oder sogar stündliche Sicherungen.

Nachteile:

- **Langsamere Wiederherstellung**, da mehrere inkrementelle Backups wiederhergestellt werden müssen.
- Aufwendiger in der Verwaltung.

> Beispiel Inkrementelles Backup
>
>> Montag: Vollbackup
>>
>> Dienstag: Nur Änderungen seit Montag
>>
>> Mittwoch: Nur Änderungen seit Dienstag
>>
>> usw.


## Vergleichstabelle

| Merkmal                   | **Vollbackup**           | **Differenzielles Backup**       | **Inkrementelles Backup**         |
|---------------------------|--------------------------|----------------------------------|-----------------------------------|
| Was wird gesichert?       | Alle Daten                | Änderungen seit letztem Vollbackup | Änderungen seit letztem Backup     |
| Speicherbedarf            | Hoch                      | Mittel (steigend mit der Zeit)    | Gering                            |
| Sicherungsdauer           | Lang                      | Mittel                            | Kurz                              |
| Wiederherstellungsdauer   | Kurz                      | Mittel                            | Lang                              |
| Wiederherstellung braucht | 1 Backup                  | 2 Backups                         | Vollbackup + alle Inkremente      |


> Merksatz zum Voll-, Differenziellen- und Inkrementellen-Backup
>
>> 🔁 **Vollbackup** sichert alles.  
>>
>> ➕ **Differenziell** sichert alles seit dem letzten Vollbackup.
>>
>> ➕➕ **Inkrementell** sichert nur das, was sich seit dem **letzten Backup überhaupt** geändert hat.


# Begriffe

In diesem Abschnitt sollen einige Begriffe erklärt werden.

 * Datensicherung vs. Archivierung - was ist der Unterschied?
 * Recovery Time Objective (RTO) und Recovery Point Objective (RPO)


## Datensicherung vs. Archivierung

Die Begriffe **Datensicherung** und **Archivierung** werden oft verwechselt, meinen aber **grundverschiedene Dinge**.

## Datensicherung (Backup)

Zweck der Datensicherung ist der **Schutz vor Datenverlust** – z. B. durch Hardware-Fehler, Ransomware, Benutzerfehler oder Systemabstürze.

Merkmale der Datensicherung sind:

- Erstellt **Kopien aktiver Daten** (z. B. auf einem Server oder PC).
- Dient der **Wiederherstellung (Recovery)** im Notfall.
- In der Regel **kurzfristig** und **regelmäßig wiederholt** (täglich, stündlich usw.).
- Alte Sicherungen werden oft **überschrieben oder gelöscht**.

>Beispiel der Datensicherung
>
>> Ein Unternehmen sichert jeden Abend alle Dateien auf dem Fileserver, damit sie im Notfall schnell wiederhergestellt werden können.

## Archivierung

Zweck der Archivierung ist die **Langfristige Aufbewahrung** von Daten – z. B. zur **Erfüllung gesetzlicher Pflichten** oder zur **Dokumentation von Geschäftsprozessen**.

Merkmale der Archivierung sind:

- Bezieht sich auf **abgeschlossene, unveränderliche Informationen** (z. B. Rechnungen, Verträge, E-Mails).
- Ziel ist **Langzeitverfügbarkeit**, oft über viele Jahre.
- Daten müssen **unveränderbar (revisionssicher)** gespeichert sein.
- Keine regelmäßige Überschreibung.

> Beispiel für Archivierung
>
>> Ein Unternehmen archiviert alle Ausgangsrechnungen für 10 Jahre, wie es die Abgabenordnung (§ 147 AO) vorschreibt.

## Vergleich: Backup vs. Archivierung

| Merkmal                  | **Datensicherung**                   | **Archivierung**                       |
|--------------------------|--------------------------------------|----------------------------------------|
| Ziel                     | Schutz vor Datenverlust              | Langfristige Aufbewahrung              |
| Zugriff                  | Häufig, bei Bedarf (z. B. Notfall)   | Selten, nur bei Bedarf oder Prüfung    |
| Veränderbarkeit          | Daten können überschrieben werden    | Daten müssen unveränderbar sein        |
| Aufbewahrungsdauer       | Kurzfristig                          | Langfristig (oft gesetzlich geregelt)  |
| Typische Formate         | System-Images, Dateikopien           | PDF/A, TIFF, E-Mails, XML              |
| Gesetzliche Grundlage    | optional oder betrieblich geregelt   | gesetzlich vorgeschrieben (z. B. GoBD) |


>Merksatz: Backup vs Archivierung
>
>> **Backup ist für den Notfall – Archivierung ist für die Ewigkeit.**


## Recovery Time Objective (RTO), Recovery Point Objective (RPO)

Recovery Time Objective (RTO) und Recovery Point Objective (RPO) sind zentrale Konzepte im Bereich der Datensicherung und Wiederherstellung (Disaster Recovery). Sie helfen Unternehmen, ihre Anforderungen an Verfügbarkeit und Datenintegrität im Falle eines Ausfalls oder Angriffs zu definieren.

### Recovery Time Objective (RTO)

RTO beantwortet die Frage: „Wie schnell muss ein System oder Dienst nach einem Ausfall wieder funktionsfähig sein?“

>Definition RTO:
>
>>Die maximale Zeit, die ein System oder eine Anwendung ausfallen darf, bevor es zu akzeptablen oder inakzeptablen Geschäftsfolgen kommt.

Beispiel:

Wenn das RTO für eine Buchhaltungssoftware bei 4 Stunden liegt, muss sie spätestens 4 Stunden nach einem Ausfall wieder nutzbar sein.

Einflussfaktoren:

 * Technische Möglichkeiten zur Wiederherstellung.
 * Toleranz des Unternehmens gegenüber Ausfallzeiten.
 * Bedeutung des betroffenen Systems für das Tagesgeschäft.

### Recovery Point Objective (RPO)

RPO beantwortet die Frage: „Wie viele Daten darf ich im schlimmsten Fall verlieren?“

>Definition RPO:
>
>>Der maximal tolerierbare Zeitraum an Datenverlust, gemessen in Zeit – also wie alt die Daten sein dürfen, die im Notfall wiederhergestellt werden.

Beispiel:

Ein RPO von 30 Minuten bedeutet, dass im Ernstfall maximal 30 Minuten an Datenverlust akzeptabel sind (z. B. bei einem Backup alle 30 Minuten).

Einflussfaktoren:

 * Häufigkeit der Datensicherung.
 * Änderungsrate der Daten.
 * Bedeutung der Daten für den Geschäftsbetrieb.

### RTO vs. RPO – Unterschied auf einen Blick

| Kriterium | RTO | RPO |
|-----------|-----|-----|
| Fokus | Wiederherstellungszeit | Datenverlustzeit |
| Ziel | Minimierung der Ausfallzeit | Minimierung des Datenverlusts |
| Frage | Wie schnell wieder online? | Wie viel darf verloren gehen? |
| Beispielwert | 2 Stunden | 15 Minuten |


# Revisionssicherung Speicherung von Daten

Die **revisionssichere Archivierung von Daten** ist ein zentraler Bestandteil der IT-gestützten Informationsverwaltung – besonders im Hinblick auf rechtliche Anforderungen, Compliance und steuerliche Prüfungen.

**Revisionssicherheit** bedeutet, dass digitale Daten so archiviert werden, dass sie:

 1. **vollständig**
 2. **unveränderbar**
 3. **nachvollziehbar**
 4. **auffindbar**
 5. **maschinell lesbar** und
 6. **zeitgerecht archiviert**

sind – über den gesamten Aufbewahrungszeitraum hinweg.

Ziel der Revisionssicherheit ist es, die Daten jederzeit so verfügbar zu halten, wie sie ursprünglich erzeugt oder empfangen wurden – besonders im Hinblick auf **Steuerprüfungen**, **Compliance-Vorgaben** und **rechtliche Nachweispflichten**.

## Rechtliche Grundlagen (Deutschland)

In Deutschland ergeben sich die Anforderungen an die revisionssichere Archivierung aus mehreren Gesetzen und Vorschriften.

1. **Abgabenordnung (AO)**

   - § 147 AO: Regelung zur Aufbewahrungspflicht von steuerlich relevanten Unterlagen.
   - Gibt Fristen vor (z. B. 6 bzw. 10 Jahre Aufbewahrung).

 2. **Handelsgesetzbuch (HGB)**

   - § 238 und § 257 HGB: Ordnungsmäßigkeit der Buchführung und Archivierungspflichten.

 3. **GoBD – „Grundsätze zur ordnungsmäßigen Führung und Aufbewahrung von Büchern, Aufzeichnungen und Unterlagen in elektronischer Form sowie zum Datenzugriff“**

   - Herausgegeben vom Bundesministerium der Finanzen (BMF).
   - Definiert **technische und organisatorische Anforderungen** an elektronische Archivsysteme.
   - Enthält zentrale Anforderungen wie:

     - Nachvollziehbarkeit & Nachprüfbarkeit
     - Vollständigkeit
     - Richtigkeit
     - Zeitgerechte Erfassung
     - Unveränderbarkeit

## Technische Umsetzung für Revisionssicherheit

Typische Maßnahmen in IT-Systemen:

- Schreibgeschützte Archivspeicher (WORM – Write Once, Read Many)
- Protokollierung aller Zugriffe und Änderungen
- Versionierung von Dokumenten
- Zeitstempelung und digitale Signaturen
- Zugriffsrechte und Benutzerverwaltung
- Regelmäßige Prüfprotokolle und Audit-Trails


# Moderne Backup-Technologien

Das Thema Datensicherung und Ransomware ist besonders aktuell, weil klassische Sicherungsmethoden oft nicht mehr ausreichen, um vor modernen Angriffen – insbesondere Ransomware – zu schützen.

Ransomware verschlüsselt Daten auf Systemen und versucht auch gezielt, Backups zu infizieren oder zu löschen. Deshalb sind besondere Schutzmaßnahmen notwendig. Ein zentraler Ansatz ist die sogenannte Air-Gap-Technologie.

Air-Gap bedeutet im wörtlichen Sinne eine „Luftlücke“ – also eine physische oder logische Trennung zwischen dem produktiven IT-System und der gesicherten Kopie der Daten. Ziel ist, dass Angreifer nicht direkt auf die Backup-Daten zugreifen können, selbst wenn das Produktivsystem kompromittiert ist.

Hier sind die wichtigsten Ansätze im Überblick:

## Physischer Air-Gap (Offline-Backup)

Backups werden auf Wechseldatenträgern wie Tapes oder externen Festplatten erstellt. Diese Datenträger werden nach dem Backup physisch getrennt vom Netzwerk (z. B. in einem Safe gelagert).

Vorteile:

 * Sehr sicher gegen Ransomware (kein Zugriff möglich).
 * Geeignet für langfristige Archivierung.

Nachteile:

 * Manuell aufwändiger.
 * Langsamere Wiederherstellung.

## Logischer Air-Gap (Isolierte Netzwerke oder getrennte Systeme)

Die Backup-Infrastruktur ist logisch vom Produktivsystem getrennt, z. B. durch Firewalls, dedizierte Netzwerke oder Benutzerrechte. Kein permanenter Netzwerkzugang zum Backup-Server.

Vorteile:

 * Schnellere Wiederherstellung möglich als bei Offline-Backups.
 * Gute Balance zwischen Sicherheit und Effizienz.

Nachteile:

 * Komplexere Einrichtung und Pflege.
 * Angreifer könnten sich dennoch mit genug Zeit und Kenntnis Zugang verschaffen.

## Immutable Backups (Unveränderliche Backups)

Backups werden so gespeichert, dass sie nicht verändert oder gelöscht werden können – auch nicht durch Admins. Oft in Cloud-Speichern oder spezialisierten Backup-Systemen implementiert.

Vorteile:

 * Schutz gegen unbefugte Änderungen.
 * Oft automatisiert und Cloud-geeignet.

Nachteile:

 * Vertrauenswürdigkeit des Backup-Systems oder Cloud-Anbieters erforderlich.
 * Meist kein echter Air-Gap im engeren Sinne, aber sehr effektiv gegen Ransomware.

## Cloud-Air-Gap-Lösungen (z. B. Backup-as-a-Service)

Backups werden in einer Cloud-Umgebung gespeichert, die logisch vom internen Netzwerk getrennt ist. Anbieter setzen Sicherheitsmaßnahmen wie Zugriffsrestriktionen, MFA und Immutable Storage ein.

Vorteile:

 * Skalierbar und flexibel.
 * Automatisierung möglich.*

Nachteile:

 * Abhängigkeit vom Anbieter.
 * Datenschutz- und Compliance-Fragen (z. B. DSGVO).

## Snapshots mit Air-Gap-Charakter (z. B. in SAN-/NAS-Systemen)

Speichersysteme können regelmäßige Snapshots erstellen, die unveränderlich sind.Zugriff auf diese Snapshots ist begrenzt oder verzögert (z. B. zeitgesteuert).

Vorteile:

 * Schnelle Wiederherstellung.
 * Teilweise automatisierbar.

Nachteile:

 * Oft nur begrenzter Schutz (wenn Angreifer auch das Storage-System kompromittieren).
