<!--
author:   Günter Dannoritzer
version:  1.0.0
date:     28.09.2026
language: de
narrator: Deutsch Female
comment:  LF11b: Schutzbedarf von Servern, Diensten, Netzen und Virtualisierung im Informationsverbund.
tags:     LiaScript, LF11b, IT-Grundschutz
attribute: Lizenz: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)

logo: ../02_img/logo-schutzbedarf.png
-->

# Schutzbedarf vernetzter Systeme

> **Ausgangssituation:** In [LF4](../LF04/lf04-01-it-grundschutz.md) haben Sie den Vertriebsarbeitsplatz untersucht. Nun fragen Sie, welche Dienste und Systeme hinter CRM, Anmeldung und Dateiablage stehen und welche Folgen ein gemeinsamer Ausfall hätte.

**Lernziel:** Sie können einen Informationsverbund abgrenzen, Abhängigkeiten erfassen, Schutzbedarf auf Dienste, Server, Netze und Räume übertragen und Kumulation sowie Verteilung begründet prüfen.

## Informationsverbund und Strukturanalyse

Ein Informationsverbund umfasst zusammengehörige Geschäftsprozesse, Informationen, Anwendungen, IT-Systeme, Kommunikationsverbindungen und Räume. Für die Übung betrachten wir den Vertrieb des Beispielunternehmens und seine zentralen Dienste. Dokumentieren Sie, welche Informationen **wo** verarbeitet werden und welche Komponente für welchen Dienst erforderlich ist.

| Kennung | Zielobjekt | Rolle im Beispiel | Abhängigkeit |
|---|---|---|---|
| C1–C10 | zehn Vertriebs-PCs | CRM und Dateiablage nutzen | Switch, Anmeldung, Serverdienste |
| N1 | Access-Switch | Client-Verbindungen | Uplink zum Servernetz |
| N2 | Firewall/Router | Übergang zu anderen Netzen | Netzsegmentierung und Routing |
| H1–H3 | drei Virtualisierungshosts | betreiben virtuelle Server | Storage und Managementnetz |
| V1 | Verzeichnisdienst | Anmeldung | H1–H3 und Netzwerk |
| V2 | Fileserver | Angebote bereitstellen | H1–H3, Storage und Netzwerk |
| V3 | Maildienst | Kommunikation | H1–H3 und Netzwerk |
| B1 | Backup-System | Wiederherstellung | Backupdaten und getrennte Zugänge |
| R1 | Serverraum | Hardware unterbringen | Strom, Zutritt, Klima |

Dies ist eine **logische Übersicht**, kein vollständiger Netzwerkplan. Prüfen Sie vor einer echten Bewertung die konkreten Betriebs- und Ausfallabhängigkeiten.

### Anwendungs- und Systemzuordnung

| Anwendung/Dienst | Vertriebs-PC | V1 | V2 | V3 | B1 |
|---|:---:|:---:|:---:|:---:|:---:|
| CRM-Client | x | | | | |
| Anmeldung | x | x | | | |
| Dateiablage | x | | x | | |
| E-Mail | x | | | x | |
| Datensicherung | | | x | x | x |

**Arbeitsauftrag:** Ergänzen Sie den tatsächlichen Standort des CRM-Servers und die Verbindung zu ihm. Ohne diese Angabe lässt sich sein Schutzbedarf nicht sauber auf die Infrastruktur übertragen.

## Schutzbedarf aus LF4 weiterführen

Ausgangspunkt sind die Folgen einer Verletzung von **Vertraulichkeit, Integrität und Verfügbarkeit** bei Informationen und Prozessen. Über Anwendungen und Abhängigkeiten werden Anforderungen für Systeme, Netze und Räume bestimmt. Für jeden Grundwert ist zu fragen, ob der Schadensfall auf dem betrachteten Objekt tatsächlich eintreten kann und welche Alternativen bestehen.

| Zielobjekt | V* | I* | A* | Beispielbegründung |
|---|---|---|---|---|
| Kundendaten | hoch | hoch | normal | Annahmen aus LF4 für einen einzelnen Arbeitsplatz |
| Vertriebsangebote gesamt | hoch | hoch | hoch | Ausfall aller zehn Arbeitsplätze blockiert hier einen zeitkritischen Vertriebsprozess |
| V2 Fileserver | hoch | hoch | hoch | stellt Angebote für alle zehn Arbeitsplätze bereit |
| N1 Access-Switch | normal** | hoch | hoch | Ausfall unterbricht hier sämtliche Vertriebsverbindungen |
| B1 Backup-System | hoch | hoch | hoch | gespeicherte Kopien und Wiederherstellung sind zu schützen |

\* V = Vertraulichkeit, I = Integrität, A = Verfügbarkeit. ** Für N1 kann Vertraulichkeit bei mitlesbaren Daten oder besonderer Netzarchitektur höher liegen. Die Zahlen sind **begründete Beispielannahmen**, keine allgemeingültigen Klassifikationen.

### Maximalprinzip und gemeinsame Abhängigkeiten

Für eine Komponente ist zunächst je Grundwert der höchste relevante Schutzbedarf der abhängigen Informationen und Anwendungen maßgeblich (**Maximalprinzip**). Ein einziger Switch oder Dienst kann zudem viele Arbeitsplätze gleichzeitig betreffen. Der Gesamtschaden kann deshalb höher sein als beim Ausfall eines einzelnen PCs.

**Aufgabe:** Ein Anmeldedienst bedient Vertrieb und Entwicklung. Beide Bereiche haben für sich eine Verfügbarkeit „normal“. Ein gemeinsamer Ausfall legt die Auftragsannahme und die Entwicklung gleichzeitig still. Begründen Sie, ob die Bewertung des Anmeldedienstes „normal“ bleibt oder „hoch“ wird. Benennen Sie die betriebliche Annahme, von der Ihre Antwort abhängt.

## Kumulation und Verteilung bei Virtualisierung

**Kumulation:** Mehrere VMs mit jeweils begrenzter Schadenswirkung liegen auf einem Host. Fällt er aus oder wird er kompromittiert, sind mehrere Dienste zusammen betroffen; daraus **kann** höherer Schutzbedarf des Hosts folgen.

**Verteilung:** Ein Dienst ist auf mehrere unabhängige Komponenten verteilt. Wenn eine Komponente ausfällt und die anderen den Dienst innerhalb der geforderten Zeit weiterführen, **kann** der Verfügbarkeitsbedarf einer einzelnen Komponente geringer sein. Das muss für den konkreten Aufbau nachgewiesen werden.

| Szenario | Prüfung |
|---|---|
| V1, V2 und V3 gleichzeitig auf H1 | Welche kumulierten Folgen hat der Ausfall von H1? |
| VMs können auf H2/H3 neu starten | Sind Storage, Netz, Kapazität und Startzeit tatsächlich verfügbar? |
| Alle Hosts nutzen ein einziges Storage-System | Bleibt ein gemeinsamer Ausfallpunkt trotz verteilter Hosts? |

**Wichtig:** Ein Cluster senkt nicht pauschal den Schutzbedarf des Dienstes und nicht automatisch die Anforderungen an Vertraulichkeit oder Integrität. Unterscheiden Sie zwischen dem Schutzbedarf des **Dienstes** und dem eines **einzelnen Hosts**. Der [BSI-Standard 200-2](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Grundschutz/BSI_Standards/standard_200_2.pdf?__blob=publicationFile&v=2) behandelt diese Effekte bei der Schutzbedarfsfeststellung für IT-Systeme.

## Anforderungen, Grundschutz-Check und Risikoanalyse

Nach der Schutzbedarfsfeststellung werden für den definierten Informationsverbund passende Anforderungen ermittelt, zum Beispiel mit Bausteinen des [IT-Grundschutz-Kompendiums](https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/IT-Grundschutz/IT-Grundschutz-Kompendium/it-grundschutz-kompendium_node.html). Ein Grundschutz-Check vergleicht die Anforderungen mit dem Istzustand. Daraus können Maßnahmen und ein Umsetzungsplan entstehen.

| Schritt | Leitfrage | Beispiel |
|---|---|---|
| Schutzbedarfsfeststellung | Wie schwer wäre ein Schaden? | Ausfall der Dateiablage: hoch |
| Grundschutz-Check | Welche Anforderungen sind umgesetzt? | Zugriffe getrennt, Backup vorhanden? |
| Risikoanalyse | Welche Gefährdungen und verbleibenden Risiken bestehen? | gemeinsames Storage als Ausfallpunkt |
| Umsetzung | Welche Maßnahme wird eingeführt und geprüft? | unabhängige Sicherung und Wiederherstellungstest |

Bei hohem oder sehr hohem Schutzbedarf sowie weiteren besonderen Gefährdungslagen kann eine ergänzende Risikoanalyse erforderlich sein. Die Entscheidung richtet sich nach der gewählten IT-Grundschutz-Vorgehensweise und dem konkreten Informationsverbund; die Schutzbedarfsfeststellung ersetzt die Risikoanalyse nicht.

### Abschlussaufgabe

1. Zeichnen Sie für den Vertrieb einen Netzwerk- oder Abhängigkeitsplan mit Clients, Switch, Serverdiensten, Hosts, Storage und Backup.
2. Wählen Sie zwei Dienste und zwei Infrastrukturkomponenten. Bewerten Sie jeden Grundwert mit einer Schadensbegründung.
3. Prüfen Sie eine Kumulation und eine mögliche Verteilung. Nennen Sie Annahmen und gemeinsame Ausfallpunkte.
4. Identifizieren Sie eine konkrete Schwachstelle und formulieren Sie eine überprüfbare Maßnahme.

**Nächster Schritt:** [LF12b – Informationssicherheit im Systemintegrationsprojekt](../LF12b/lf12-05-schutzbedarf-projekt.md) überträgt die Methode auf einen begrenzten Kundenauftrag.
