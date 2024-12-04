<!--
author:   Günter Dannoritzer
email:    g.dannoritzer@wvs-ffm.de
version:  0.1.0
date:     01.12.2024
language: de
narrator: Deutsch Female

comment:  Umgebungsvariablen um Betriebssystem

icon:    https://raw.githubusercontent.com/dsp77/wvs-liascript/0938e2e0ce751e270e3e36b8ecfeb09044a41aa0/wvs-logo.png
logo:     02_img/logo-environment.jpg

tags:     LiaScript, Umgebungsvariablen, Betriebssystem, Linux, macOS, Windows

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js

attribute: Lizenz: [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)
-->
# Umgebungsvariablen

Umgebungsvariablen in einem Betriebssystem sind dynamische Werte, die Informationen über die Umgebung bereitstellen, in der Programme ausgeführt werden. Diese Informationen können Pfade zu Dateien, Einstellungen oder andere Konfigurationsdaten enthalten.

Umgebungsvariablen dienen einer Vielzahl von Zwecken:

  * Pfadangaben: Sie definieren, wo das System nach ausführbaren Dateien, Bibliotheken oder anderen Ressourcen suchen soll. Ein bekanntes Beispiel ist die Variable PATH, die den Suchpfad für ausführbare Dateien enthält.
 * Konfigurationseinstellungen: Umgebungsvariablen können verwendet werden, um Programmeinstellungen zu speichern, die für mehrere Anwendungen gelten.
 * Benutzerspezifische Einstellungen: Sie ermöglichen es, benutzerspezifische Einstellungen zu speichern, wie z.B. das Home-Verzeichnis.
 * Systeminformationen: Sie können Informationen über das Betriebssystem, den Benutzer oder die Hardware enthalten.

Beispiele für Umgebungsvariablen:

  * PATH: Legt fest, in welchen Verzeichnissen das System nach ausführbaren Dateien sucht.
 * HOME: Gibt das Home-Verzeichnis des aktuellen Benutzers an.
 * TEMP: Speichert den Pfad zu einem temporären Verzeichnis.
 * USERPROFILE: Enthält den Pfad zum Benutzerprofil des aktuellen Benutzers.

Wie funktionieren sie?

  * Setzen: Umgebungsvariablen werden in der Regel beim Start des Betriebssystems oder eines Terminals gesetzt. Sie können aber auch während einer laufenden Sitzung geändert werden.
 * Vererbung: Wenn ein Prozess einen neuen Prozess startet, werden die Umgebungsvariablen in der Regel an den neuen Prozess vererbt.
 * Zugriff: Programme können auf den Wert einer Umgebungsvariablen zugreifen und ihn verwenden.

Warum sind sie wichtig?

  * Flexibilität: Umgebungsvariablen ermöglichen es, die Konfiguration von Anwendungen und des Systems anzupassen, ohne den Quellcode ändern zu müssen.
 * Portabilität: Durch die Verwendung von Umgebungsvariablen können Programme auf verschiedenen Systemen mit unterschiedlichen Konfigurationen ausgeführt werden.
 * Automatisierung: Umgebungsvariablen können in Skripten und Batch-Dateien verwendet werden, um automatisierte Aufgaben auszuführen.

Wo werden sie verwendet?

 * Shell-Scripting: Umgebungsvariablen werden häufig in Shell-Skripten verwendet, um Skripte flexibler und anpassbarer zu machen.
 * Programmierung: Programmiersprachen wie Python, Perl und viele andere bieten Funktionen zum Lesen und Setzen von Umgebungsvariablen.
 * Build-Systeme: Build-Systeme wie Make nutzen Umgebungsvariablen, um Konfigurationsinformationen zu speichern.
 * Containerisierung: In Container-Umgebungen wie Docker werden Umgebungsvariablen häufig verwendet, um die Konfiguration von Containern zu verwalten.

Einheitlich durchgesetzt hat sich, dass Umgebungsvariablen immer mit Großbuchstaben geschrieben werden.

# Anzeigen von Umgebungsvariablen

Mit dem `set`-Befehl in einem Terminal oder der Windows Kommandozeile werden alle Umgebungsvariablen aufgelistet. Einzelne bekannte Umgebungsvariablen können mit dem `echo`-Befehl angezeigt werden. Hierbei ist die unterschiedliche Referenzierung des Variableninhalts unter Windows und Linux/macOS zu beachten. Unter Windows wird der Inhalt mit dem Prozentzeichen `%` referenziert, was vor und hinter der Variablen geschrieben werden muss. Unter Linux/macOS wird ein Dollarzeichen `$` vor die Variable gesetzt. Folgende Kommandos zeigen die entsprechenden Inhalte der Variablen:

| Variable | Windows   | Linux/macOS | Erklärung |
|----------|-----------|-------------|-----------|
| `PATH` | `echo %PATH%` | `echo $PATH` | Zeigt die Suchpfade für ausführbare Programme an. |
| `COMPUTERNAME` | `echo %COMPUTERNAME%` || Zeigt unter Windows den Computernamen an. Unter Linux/macOS `HOSTNAME` |
| `HOSTNAME` || `echo $HOSTNAME` | Zeigt unter Linux/macOS den Computernamen an. |
| `USERNAME` | `echo %USERNAME%` | `echo $USERNAME` | Zeigt den Namen des angemeldeten Benutzers an. |

# Temporäres setzen von Umgebungsvariablen

Mithilfe des `export`-Befehls können Umgebungsvariablen gesetzt oder verändert werden. Zu beachten ist, dass diese Variable dann nur in dem Prozess des Terminals oder Kommandozeile und etwaigen Unterprozessen bekannt ist.

`export HOSTNAME=neuerHostname` setzt bzw. überschreibt den bestehenden Inhalt der Variablen `HOSTNAME`.

Um z.B. in einer Umgebung den Suchpfad für ausführbare Programme zu erweitern, wird die bestehende Variable referenziert und damit der Inhalt erweitert. Beispiel, es soll zusätzlich der Suchpfad `/home/werner/bin` der `PATH`-Variablen hinzugefügt werden.

`export PATH=$PATH:/home/werner/bin`

Die Pfadeinträge werden per Doppelpunkt getrennt. Durch die Zuweisung des referenzierten Inhaltes, wird der aktuelle Inhalt behalten und der mit Doppelpunkt getrennte neue Pfad dem hinzugefügt.

% # Permanentes setzen von Umgebungsvariablen