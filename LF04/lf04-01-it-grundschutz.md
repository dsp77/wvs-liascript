<!--
author:   Günter Dannoritzer
version:  1.0.0
date:     28.09.2026
language: de
narrator: Deutsch Female
comment:  LF4: Schutzbedarfsanalyse im eigenen Arbeitsbereich durchführen. Überarbeitung und Aufteilung der ursprünglichen Datei it-grundschutz.md.
tags:     LiaScript, LF4, IT-Grundschutz
attribute: Lizenz: [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)

logo:     02_img/logo-it-grundschutz.png

-->

# Schutzbedarfsanalyse im eigenen Arbeitsbereich

> **Ausgangssituation:** Sie arbeiten im Vertrieb eines Unternehmens. An Ihrem Arbeitsplatz bearbeiten Sie Kundendaten und Angebote im CRM[^1], lesen E-Mails und speichern Dateien. Was wäre die Folge, wenn jemand diese Informationen liest, unbemerkt verändert oder Sie längere Zeit nicht darauf zugreifen können?

[^1]: Customer-Relationship-Management (CRM)

**Lernziel:** Sie können die Informationen, Anwendungen und Geräte Ihres Arbeitsbereichs erfassen, den Schutzbedarf für Vertraulichkeit, Integrität und Verfügbarkeit begründen und passende Schutzmaßnahmen vorschlagen.

1. Was muss geschützt werden?
2. Wie groß wäre der Schaden bei einer Verletzung der drei Grundwerte?
3. Welche Anwendungen und Geräte benötigen deshalb welchen Schutz?

## IT-Grundschutz als Orientierung

Der [IT-Grundschutz des BSI](https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/IT-Grundschutz/it-grundschutz_node.html)[^2] beschreibt ein systematisches Vorgehen für Informationssicherheit. In diesem Lernfeld nutzen wir einen Ausschnitt: **Geltungsbereich bestimmen → Struktur erfassen → Schutzbedarf feststellen → Maßnahmen ableiten**. Ein vollständiges Informationssicherheitsmanagementsystem ist hier nicht Gegenstand der Aufgabe.

[^2]: Bundesamt für Sicherheit in der Informationstechnik (BSI)

### Zwei verschiedene Fragen im IT-Grundschutz

Der BSI-Standard 200-2 beschreibt drei **Vorgehensweisen zur Absicherung einer Organisation**. Sie helfen bei der Entscheidung, womit ein Sicherheitsprozess beginnt und wie weit der betrachtete Informationsverbund zunächst abgesichert wird:

| Vorgehensweise | Wozu dient sie? |
|---|---|
| **Basis-Absicherung** | Einstieg: grundlegende Sicherheitsanforderungen für den gesamten betrachteten Informationsverbund zügig umsetzen. |
| **Standard-Absicherung** | Umfassende, systematische Absicherung des gesamten betrachteten Informationsverbundes nach IT-Grundschutz. |
| **Kern-Absicherung** | Einstieg bei besonders wichtigen Prozessen und den dafür erforderlichen Teilen des Informationsverbundes; weitere Bereiche können später folgen. |

Daneben steht die **Schutzbedarfsfeststellung**. Sie fragt für Informationen, Anwendungen und Systeme: *Wie groß wäre der Schaden, wenn Vertraulichkeit, Integrität oder Verfügbarkeit verletzt werden?* Das Ergebnis wird für **jeden dieser drei Grundwerte** als „normal“, „hoch“ oder „sehr hoch“ begründet. Diese Kategorien beschreiben die mögliche Schadenshöhe; sie bezeichnen **keine** der drei Absicherungsvarianten.

**Warum beginnen wir hier mit V/I/A?** LF4 verlangt eine Schutzbedarfsanalyse im eigenen Arbeitsbereich. Deshalb üben wir den Schritt der Schutzbedarfsfeststellung an einem Arbeitsplatz. Wir führen dabei **keine vollständige Basis-, Standard- oder Kern-Absicherung** durch. Die Betrachtung nach Vertraulichkeit, Integrität und Verfügbarkeit gehört zur IT-Grundschutz-Methodik und wird insbesondere für die umfassende Standard-Absicherung benötigt; sie ist keine vierte Vorgehensweise namens „VIA“. Der begründete Schutzbedarf hilft anschließend, angemessene Sicherheitsanforderungen und Maßnahmen auszuwählen.

[Quelle: BSI-Standard 200-2 – IT-Grundschutz-Methodik](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Grundschutz/BSI_Standards/standard_200_2.pdf?__blob=publicationFile&v=2)


## Geltungsbereich und Strukturanalyse

Unser Geltungsbereich ist **der Arbeitsplatz einer Person im Vertrieb**, einschließlich der dort genutzten Informationen und Anwendungen. Abhängigkeiten von zentralen Diensten werden genannt, aber die gesamte Server- und Netzinfrastruktur wird hier noch nicht bewertet.

| Kennung | Typ | Objekt | Wofür wird es gebraucht? |
|---|---|---|---|
| I1 | Information | Kundendaten | Kontakte und Verträge bearbeiten |
| I2 | Information | Angebote | Preise und Zusagen nachvollziehen |
| I3 | Information | Interne E-Mails | Abstimmung im Team |
| A1 | Anwendung | CRM | I1 und I2 bearbeiten |
| A2 | Anwendung | E-Mail und Office | I2 und I3 bearbeiten |
| C1 | IT-System | Arbeitsplatz-PC | A1 und A2 nutzen |
| R1 | Raum | Büroarbeitsplatz | C1 und Ausdrucke aufbewahren |

**Schnittstellen zum Umfeld:** Anmeldung, Netzwerk und zentrale Dateiablage werden benötigt. Welche Server, Switches und Leitungen dahinterstehen, untersuchen wir in [LF11b](../LF11b/schutzbedarf-vernetzte-systeme.md).

### Arbeitsauftrag: den eigenen Arbeitsbereich erfassen

Erstellen Sie eine ähnliche Tabelle für Ihren eigenen oder einen vorgegebenen Arbeitsplatz. Beginnen Sie bei **Informationen**, ordnen Sie dann Anwendungen und Geräte zu. Halten Sie Annahmen fest, etwa ob Kundendaten lokal gespeichert werden oder nur im CRM angezeigt werden.

## Drei Grundwerte und mögliche Schäden

- **Vertraulichkeit:** Unberechtigte erfahren Informationen.
- **Integrität:** Daten oder Einstellungen sind unbemerkt falsch oder verändert.
- **Verfügbarkeit:** Informationen oder Dienste stehen nicht rechtzeitig zur Verfügung.

Schutzbedarf beschreibt das **Ausmaß möglicher Schäden**, nicht die Wahrscheinlichkeit eines Angriffs. Fragen Sie für jeden Grundwert: *Was passiert konkret, wenn dieser Grundwert verletzt wird?*

| Kategorie | Typische Schadensauswirkung |
|---|---|
| normal | begrenzt und überschaubar |
| hoch | beträchtlich |
| sehr hoch | existenziell bedrohlich oder katastrophal |

Die Grenzen zwischen den Kategorien werden für die betrachtete Organisation festgelegt. Eine Einstufung benötigt daher **ein Schadensszenario und eine nachvollziehbare Begründung**. Eine personenbezogene Information ist nicht automatisch für alle drei Grundwerte „hoch“.

[Quelle: BSI-Standard 200-2, Kapitel 8.2](https://www.bsi.bund.de/SharedDocs/Downloads/DE/BSI/Grundschutz/BSI_Standards/standard_200_2.pdf?__blob=publicationFile&v=2)

### Beispiel: Kundendaten am Vertriebsarbeitsplatz

**Annahmen:** Die Datensätze enthalten Kontakt- und Vertragsdaten. Ein Ausfall von zwei Stunden kann nachgearbeitet werden; eine unbemerkte Änderung von Vertragsdaten verursacht erhebliche Fehlentscheidungen. Die Kategorien sind für dieses Unterrichtsbeispiel gesetzt und können bei anderen Rahmenbedingungen anders ausfallen.

| Objekt | Vertraulichkeit | Integrität | Verfügbarkeit |
|---|---|---|---|
| I1 Kundendaten | **hoch:** Offenlegung kann Betroffene und Unternehmen erheblich schädigen | **hoch:** falsche Vertragsdaten können erhebliche Fehler auslösen | **normal:** zwei Stunden Ausfall sind hier überbrückbar |
| I2 Angebote | **hoch:** Preisgabe vertraulicher Konditionen kann beträchtlich schaden | **hoch:** veränderte Preise können zu falschen Zusagen führen | **normal:** Bearbeitung kann kurz warten |
| I3 interne E-Mails | **normal:** im Beispiel ohne besonders sensible Inhalte | **normal:** Fehler sind hier korrigierbar | **normal:** kurze Unterbrechung ist überbrückbar |

**Aufgabe:** Ändern Sie eine Annahme: Was geschieht mit der Verfügbarkeit von I1, wenn der Vertrieb Aufträge innerhalb weniger Minuten bearbeiten muss? Passen Sie Kategorie **und Begründung** an.

## Schutzbedarf von Informationen auf Systeme übertragen

Das CRM verarbeitet Kundendaten. Der Arbeitsplatz-PC zeigt sie an; je nach Arbeitsweise speichert er zudem lokale Kopien. Der Schutzbedarf einer Information ist deshalb bei den abhängigen Objekten zu berücksichtigen. **Nicht jeder Grundwert und nicht jede Komponente wird blind gleich eingestuft:** Die tatsächliche Verarbeitung, Speicherung und Abhängigkeit entscheiden.

| Grundwert | I1 Kundendaten | A1 CRM | C1 Arbeitsplatz-PC | Begründung für C1 |
|---|---|---|---|---|
| Vertraulichkeit | hoch | hoch | hoch | Kundendaten können am PC eingesehen werden |
| Integrität | hoch | hoch | hoch | falsche Eingaben/Änderungen über den PC können Daten verfälschen |
| Verfügbarkeit | normal | normal | normal* | ein kurzer Ausfall dieses Arbeitsplatzes ist laut Annahme überbrückbar |

\* Für CRM und PC können andere Verfügbarkeitswerte gelten, wenn weitere Arbeitsplätze oder kritische Prozesse davon abhängen. Diese Abhängigkeiten werden in LF11b betrachtet.

### Maximalprinzip im kleinen Beispiel

Wenn der PC sowohl wenig sensible E-Mails (**Vertraulichkeit normal**) als auch Kundendaten (**Vertraulichkeit hoch**) verarbeitet, wird für den PC der **höhere Wert** betrachtet. Das gilt jeweils *getrennt* für Vertraulichkeit, Integrität und Verfügbarkeit. Zusätzliche Zusammenhänge können eine eigene Begründung erfordern.

**Kumulation als weiterer Prüfschritt:** Das Maximalprinzip allein kann zu kurz greifen. Wenn der Ausfall **mehrerer** auf demselben PC erledigter Aufgaben *gleichzeitig* einen beträchtlichen Schaden verursacht, kann dessen Schutzbedarf für **Verfügbarkeit** höher sein als der Bedarf jeder Aufgabe für sich. Beispiel: Ein Arbeitstag ohne Angebotsbearbeitung oder ohne Kundenkommunikation hätte jeweils für sich noch begrenzte Folgen (**normal**). Fallen beide Tätigkeiten gleichzeitig für einen Arbeitstag aus und entgehen dadurch wichtige Aufträge, kann der gemeinsame Ausfall **hoch** sein. Die Einstufung folgt aus dieser zusätzlichen Schadensannahme, nicht aus dem bloßen Vorhandensein zweier Anwendungen. Für unseren einzelnen Vertriebs-PC nehmen wir zunächst an, dass ein kurzer Ausfall überbrückbar ist. Ausführliche Kumulations- und Verteilungseffekte bei gemeinsam genutzten Servern behandeln wir in [LF11b](../LF11b/schutzbedarf-vernetzte-systeme.md).

**Aufgabe:** Ergänzen Sie für Ihr Beispiel eine Tabelle mit den Spalten „Objekt“, „Grundwert“, „Kategorie“ und „Schadensbegründung“. Prüfen Sie anschließend, ob Ihre Einstufung des PCs zu den verarbeiteten Informationen passt.

#### Musterlösung zur Aufgabe

Diese Lösung verwendet die oben genannten **Beispielannahmen**: Kundendaten und Angebote werden am PC bearbeitet, interne E-Mails enthalten keine besonders sensiblen Inhalte, und ein kurzer Ausfall dieses einzelnen Arbeitsplatzes ist überbrückbar. Andere betriebliche Annahmen können zu anderen Kategorien führen.

| Objekt | Grundwert | Kategorie | Schadensbegründung |
|---|---|---|---|
| I1 Kundendaten | Vertraulichkeit | hoch | Unbefugte Einsicht in Kontakt- und Vertragsdaten kann beträchtliche Schäden verursachen. |
| I1 Kundendaten | Integrität | hoch | Unbemerkte Änderungen an Vertragsdaten können zu erheblichen Fehlentscheidungen führen. |
| I1 Kundendaten | Verfügbarkeit | normal | Eine Unterbrechung von zwei Stunden kann hier nachgearbeitet werden. |
| I3 interne E-Mails | Vertraulichkeit | normal | Die E-Mails enthalten in diesem Beispiel keine besonders sensiblen Inhalte. |
| I3 interne E-Mails | Integrität | normal | Fehlerhafte Nachrichten können hier rechtzeitig erkannt und korrigiert werden. |
| I3 interne E-Mails | Verfügbarkeit | normal | Eine kurze Unterbrechung ist überbrückbar. |
| C1 Arbeitsplatz-PC | Vertraulichkeit | hoch | Über den PC sind Kundendaten einsehbar; nach dem Maximalprinzip ist „normal“ zu niedrig. |
| C1 Arbeitsplatz-PC | Integrität | hoch | Über den PC können Vertragsdaten geändert werden; die mögliche Schadenshöhe entspricht mindestens I1. |
| C1 Arbeitsplatz-PC | Verfügbarkeit | normal | Der kurze Ausfall dieses PCs ist gemäß Annahme überbrückbar; ein erheblicher gemeinsamer Schaden ist hier nicht belegt. |

**Prüfung:** Für Vertraulichkeit und Integrität übernimmt C1 den höheren Wert der verarbeiteten Informationen. Für Verfügbarkeit bleibt C1 unter den genannten Annahmen „normal“. Ändert sich die Ausfalldauer, fehlt eine Ausweichmöglichkeit oder verursacht der gleichzeitige Ausfall mehrerer Tätigkeiten einen beträchtlichen Schaden, muss die Verfügbarkeit **erneut begründet** werden.

[Quelle zum Maximalprinzip und Kumulationseffekt: BSI-Onlinekurs, Lektion 4.3](https://www.bsi.bund.de/DE/Themen/Unternehmen-und-Organisationen/Standards-und-Zertifizierung/IT-Grundschutz/Zertifizierte-Informationssicherheit/IT-Grundschutzschulung/Online-Kurs-IT-Grundschutz/Lektion_4_Schutzbedarfsfeststellung/Lektion_4_03/Lektion_4_03_node.html)

## Vom Schutzbedarf zu Maßnahmen

Schutzbedarf, Schwachstelle und Maßnahme beantworten verschiedene Fragen:

| Begriff | Leitfrage | Beispiel |
|---|---|---|
| Schutzbedarf | Wie schwer wäre der Schaden? | Offenlegung von Kundendaten: hoch |
| Schwachstelle | Wo besteht eine konkrete Schwäche? | Bildschirm ist von Besuchern einsehbar |
| Maßnahme | Was wird dagegen getan? | Bildschirmposition ändern, Gerät beim Verlassen sperren |

Weitere mögliche Maßnahmen sind passende Berechtigungen, aktuelle Software, verschlüsselte Geräte und geregelte Datensicherung. Wählen und begründen Sie Maßnahmen passend zur **tatsächlichen** Arbeitsweise. Eine **Risikoanalyse** betrachtet Gefährdungen und bewertet, ob Maßnahmen ausreichen; sie ist nicht identisch mit der Schutzbedarfsfeststellung.

### Abschlussaufgabe

1. Erfassen Sie mindestens drei Informationen, zwei Anwendungen und ein Gerät Ihres Arbeitsbereichs.
2. Bestimmen Sie für zwei Informationen alle drei Grundwerte mit Kategorie und konkretem Schadensszenario.
3. Leiten Sie den Schutzbedarf eines Geräts aus seiner Nutzung ab.
4. Nennen Sie zwei konkrete Schwachstellen oder Gefährdungen und jeweils eine begründete Maßnahme.
5. Markieren Sie Annahmen und noch offene Fragen zu zentralen Diensten.

**Weiterlernen:** [LF11b – Schutzbedarf vernetzter Systeme](../LF11b/LF11-07-schutzbedarf-vernetzte-systeme.md) erweitert die Betrachtung auf Server, Netze und Virtualisierung. [LF12b – Informationssicherheit im Systemintegrationsprojekt](../LF12b/lf12-05-schutzbedarf-projekt.md) verwendet einen begrenzten Ausschnitt in der Projektarbeit.
