<!--
author:   Günter Dannoritzer
email:    g.dannoritzer@wvs-ffm.de
version:  0.1.0
date:     04.03.2024
language: de
narrator: Deutsch Female

comment:  Dateisytem, NTFS, Linux

logo:     02_img/logo-dateisystem.png

tags:     LiaScript, Lernfeld_2, Fachinformatiker, Dateisystem

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js

-->

# Dateisystem



## Zuordnungseinheiten, Blockgröße

![Dateisystem formatieren; Zuordnungseinheit](02_img/lf02_ds_format-zuordnungseinheiten.png)

Bei der Formatierung eines Datenträgers kann unter Windows die Zuordnungseinheit ausgewählt werden. Microsoft hat diesen Wert auch Cluster genannt, allgemein wird die Einheit Blockgröße genannt. Hier soll untersucht werden, was die Blockgröße für eine Auswirkung hat.

Auf den formatierten Datenträger wird eine Textdatei angelegt und die Zahlen `0123456789` in eine Zeile geschrieben, ohne die Eingabetaste zu drücken, bedeutet, der Cursor steht nach der Zahl 9.

Öffnet man jetzt die Eigenschaften der Datei im Dateiexplorer, sieht man folgenden Daten:

 * Größe: 10 Byte
 * Größe auf dem Datenträger: 8192 Byte

![Größe der Datei, größe auf dem Datenträger](02_img/lf02_ds_dateigroesse-ze-8192.png)

## Größenangaben, verwendete Präfixe

Hier soll jetzt untersucht werden, wie unter verschiedenen Betriebssystemen die Dateigröße angezeigt werden.

![Dateigröße im Dateiexplorer von Linux Mint](02_img/lf02_ds_film-eigenschaften-linux-mint.png)
![Dateigröße im Dateiexplorer von Windows](02_img/lf02_ds_film-eigenschaften-win-explorer.png)

Folgende Dateigrößen werden für ein und der selben Datei angezeigt:

 * `22,3 MB (22.283.436 Bytes)` - Linux Mint
 * `21,2 MB (22.283.436 Bytes)` - Windows

Welche Aussagen zu den Daten sind richti?

 * [[x]] Linux Mint zeigt die Dateigröße mit SI-Präfixe an
 * [[ ]] Windows zeigt die Dateigröße mit SI-Präfixe an
   [[?]] Vergleichen Sie, ob die Zahlen mit Präfix sich gegenüber den Byte-Wert ändern. Beispiel 22,3 MB -> 22.283.436 Bytes.
   [[?]] Wenn die Zahlen sich nicht ändern, wird einfach das Komma verschoben und es handelt ich um SI-Präfixe: 22.283.436 Bytes -> Komma um 6 Stellen ($10^6$ -> Mega) nach links verschoben.
   [[?]] Wenn die Zahlen sich verändern, verändert ich der Wert mit jeder Stufe von Byte -> KiB (:1024) -> MiB (:1024). 22.283.436 Bytes = 21761,16 KiB = 21,25 MiB. Beachten Sie, wie die höherwertigsten vier Ziffern (2228) sich mit jedem neuen Binärpräfix verändern.

