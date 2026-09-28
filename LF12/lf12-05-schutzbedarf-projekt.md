<!--
author:   Günter Dannoritzer
version:  1.0.0
date:     28.09.20026
language: de
narrator: Deutsch Female
comment:  LF12b: Projektbezogene Schutzbedarfsfeststellung und Schutzmaßnahmen in der Fachrichtung Systemintegration.
tags:     LiaScript, LF12b, Abschlussprojekt, Systemintegration
attribute: Lizenz: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)

logo: ../02_img/logo-schutzbedarf-projekt.png
-->

# Informationssicherheit im Systemintegrationsprojekt

> **Ausgangssituation:** Das Beispielunternehmen aus [LF4](../LF04/it-grundschutz.md) und [LF11b](../LF11b/schutzbedarf-vernetzte-systeme.md) migriert seinen Fileserver auf eine virtualisierte Plattform. Ihre Aufgabe ist ein **abgegrenzter Projektausschnitt** mit begründeten Sicherheitsentscheidungen und nachweisbarer Umsetzung.

**Lernziel:** Sie können Schutzbedarf für projektbetroffene Informationen, Dienste und Systeme begründen, konkrete Schwachstellen untersuchen, Maßnahmen auswählen, umsetzen, prüfen und verständlich dokumentieren.

## Bezug zur Abschlussprüfung FISI

[§ 20 FIAusbV](https://www.gesetze-im-internet.de/fiausbv/__20.html) nennt für den Prüfungsbereich „Planen und Umsetzen eines Projektes der Systemintegration“ unter anderem die Analyse von Schwachstellen von IT-Systemen sowie das Vorschlagen und Umsetzen von Schutzmaßnahmen. Die betriebliche Projektarbeit **einschließlich Dokumentation** dauert höchstens **40 Stunden**. Die Verordnung verlangt damit **keine vollständige Schutzbedarfsfeststellung nach BSI für ein ganzes Unternehmen**.

Eine kurze, projektbezogene Schutzbedarfsfeststellung kann die Auswahl und Begründung von Maßnahmen stützen. Prüfen Sie zusätzlich die **aktuellen Vorgaben Ihrer zuständigen IHK** für Antrag und Dokumentation; Bewertungsbögen und Formvorgaben können abweichen. Ein pauschales Zeitbudget von ein bis zwei Stunden für diese Analyse ist keine verbindliche Prüfungsregel.

## Sechs Schritte für den Projektausschnitt

| Schritt | Leitfrage | Nachweis im Projekt |
|---|---|---|
| 1. Abgrenzen | Was gehört zum Auftrag, was sind nur Schnittstellen? | Übersicht und Annahmen |
| 2. Erfassen | Welche Informationen und Dienste sind betroffen? | kurze Objektliste |
| 3. Bewerten | Welche Folgen hätten Verletzungen von V/I/A? | begründete Tabelle |
| 4. Abhängigkeiten prüfen | Welche Server, Netze, Zugänge und Sicherungen sind relevant? | vereinfachter Abhängigkeitsplan |
| 5. Schwachstellen und Maßnahmen | Welche konkrete Schwäche beeinflusst die Lösung? | Maßnahmenentscheidung |
| 6. Umsetzen und prüfen | Was wurde tatsächlich eingerichtet und getestet? | Testprotokoll und Ergebnis |

**Begriffe:** Schutzbedarf beschreibt die Höhe möglicher Schäden; eine Schwachstelle ist eine konkrete Schwäche; eine Gefährdung kann diese ausnutzen oder einen Ausfall auslösen; eine Risikoanalyse bewertet die daraus entstehenden Risiken. Eine Maßnahme senkt oder behandelt das Risiko. Eine reine Schutzbedarfstabelle ersetzt keine Schwachstellenanalyse.

## Musterprojekt: Fileserver-Migration

**Auftrag:** Eine bestehende Dateiablage für zehn Vertriebsarbeitsplätze wird auf einen neuen virtuellen Fileserver migriert. Berechtigungen, administrative Zugänge, Datensicherung und ein Wiederherstellungstest gehören zum Auftrag. Die Erneuerung von Switches, Firewall und der gesamten Virtualisierungsplattform ist **nicht** Teil des Auftrags; ihre Abhängigkeiten und vorhandenen Zusagen werden dokumentiert.

**Annahmen für das Unterrichtsbeispiel:** Die Dateiablage enthält vertrauliche Angebote und Kundendaten. Ein kurzer Ausfall eines Arbeitsplatzes ist überbrückbar; fällt die zentrale Ablage für einen Arbeitstag aus, entstehen beträchtliche Schäden. Backupkopien enthalten die gleichen vertraulichen Inhalte. Der Betrieb legt seine eigenen Schadensgrenzen fest.

| Objekt im Projektausschnitt | Vertraulichkeit | Integrität | Verfügbarkeit | Begründung |
|---|---|---|---|---|
| Geschäftsdaten | hoch | hoch | hoch | Offenlegung, Verfälschung oder eintägiger Gesamtausfall verursachen hier beträchtliche Schäden |
| Neuer Fileserver | hoch | hoch | hoch | verarbeitet und stellt diese Daten zentral bereit |
| Administrationszugang | hoch | sehr hoch* | normal* | manipulierter Zugang könnte im Beispiel weitreichend Daten und Sicherungen verändern |
| Backupdaten und Wiederherstellung | hoch | hoch | hoch | Kopien müssen vertraulich und für eine Wiederherstellung brauchbar sein |
| Storage/Host (Schnittstelle) | zu prüfen | zu prüfen | zu prüfen | gemeinsame Abhängigkeiten und vorhandene Redundanz nachweisen |

\* **Sehr hoch** bzw. **normal** sind nur unter den beschriebenen Annahmen vertretbar. Prüfen Sie insbesondere, ob ein Ausfall des Administrationszugangs die geforderte Wiederherstellungszeit gefährdet. Bei fehlender Grundlage bleibt der Wert offen, bis die Fachverantwortlichen ihn festlegen.

### Von Feststellung zur überprüfbaren Umsetzung

| Feststellung/Schwachstelle | Entscheidung im Auftrag | Prüfbarer Nachweis |
|---|---|---|
| Bestehende Freigaben geben zu viele Rechte | Rollen und Gruppen bereinigen | Test mit berechtigtem und unberechtigtem Konto |
| Gemeinsames Administratorkonto ohne klare Zuordnung | getrennte Admin-Konten, starke Anmeldung nach Unternehmensvorgabe | Rollenprüfung und protokollierter Anmeldetest |
| Backup wurde nie zurückgespielt | Backupziel und Wiederherstellungsverfahren festlegen | Testwiederherstellung einer Datei mit Ergebnis |
| Nur ein Storage-Pfad erkennbar | Abhängigkeit und Restrisiko mit Verantwortlichen klären | dokumentierte Entscheidung oder Maßnahme |

Eine Maßnahme gilt nicht allein deshalb als umgesetzt, weil sie vorgeschlagen wurde. Dokumentieren Sie Konfiguration, Test, Ergebnis und gegebenenfalls ein verbleibendes Risiko. Ein Backup ist keine pauschale Garantie für Verfügbarkeit: Wiederherstellungszeit und Datenstand müssen zum Bedarf passen.

## Muster für einen knappen Dokumentationsauszug

> **Abgrenzung:** Migration der Vertriebsdateiablage auf eine neue VM, inklusive Berechtigungen und Sicherung. Host, Storage und Netz sind bestehende Schnittstellen.  
> **Schutzbedarf:** Geschäftsdaten V/I/A jeweils hoch; ein ganztägiger Ausfall blockiert die Auftragsbearbeitung. Der neue Fileserver übernimmt diesen Bedarf als zentraler Dienst.  
> **Schwachstelle:** Auf dem bisherigen System erhalten mehrere Gruppen Schreibrechte auf alle Angebotsordner.  
> **Entscheidung und Umsetzung:** Rollenbezogene Gruppen und getrennte administrative Konten wurden eingerichtet; Sicherung und Testwiederherstellung wurden ausgeführt.  
> **Prüfung:** Ein berechtigtes Konto konnte ein Angebot ändern; ein fachfremdes Konto wurde abgewiesen. Die ausgewählte Datei wurde aus der Sicherung wiederhergestellt.  
> **Offen:** Die Hochverfügbarkeit des vorhandenen Storage liegt außerhalb des Auftrags und wurde zur Entscheidung an die zuständige Stelle übergeben.

Das ist ein **Lehrbeispiel** und keine allgemeine Vorlage, die unverändert in eine Prüfungsdokumentation übernommen werden sollte. Projektspezifische Messwerte, tatsächliche Konfigurationen und Entscheidungen sind einzutragen.

### Arbeitsauftrag

1. Wählen Sie ein reales oder vorgegebenes Systemintegrationsprojekt und grenzen Sie den Auftrag gegenüber bestehenden Schnittstellen ab.
2. Bestimmen Sie für zwei Informationen oder Dienste V/I/A mit **Schadensszenario** und Annahmen.
3. Leiten Sie daraus den Schutzbedarf projektbetroffener Systeme ab; prüfen Sie gemeinsame Abhängigkeiten aus LF11b.
4. Untersuchen Sie mindestens eine **konkret festgestellte** Schwachstelle. Begründen Sie eine Maßnahme und eine alternative Lösung.
5. Dokumentieren Sie Umsetzung, Test, Ergebnis und offene Risiken auf höchstens einer übersichtlichen Auszugsseite.

**Rückblick:** [LF4 – Arbeitsplatz](../LF04/it-grundschutz.md) erklärt die Grundmethode; [LF11b – vernetzte Systeme](../LF11b/schutzbedarf-vernetzte-systeme.md) ergänzt Infrastruktur und Abhängigkeiten.
