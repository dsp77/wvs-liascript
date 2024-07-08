<!--
author:   Günter Dannoritzer
email:    g.dannoritzer@wvs-ffm.de
version:  0.2.0
date:     07.07.2024
language: de
narrator: Deutsch Female

comment:  Wireless Local Area Network (WLAN)

icon:    https://raw.githubusercontent.com/dsp77/wvs-liascript/0938e2e0ce751e270e3e36b8ecfeb09044a41aa0/wvs-logo.png
logo:     02_img/logo-wlan.png

tags:     LiaScript, WLAN, Wifi, CSMA/CA, Mesh, WPA, IEEE 802.11

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js

attribute: Lizenz: [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)
-->

# Wireless Local Area Network (WLAN)

 * Standards
 * Frequenzen
 * Sendeleistung
 * Ausbreitung
 * Reichweite
 * Kanäle
 * SSID
 * Betriebsmoden
    * Ad-hoc
    * AP
 * Roaming vs Mesh
 * Sicherheit
    * WPA2, WPA3
    * WPA-Enterprise

# Standards

## Frequenzbereich 2,4 GHz:

 * **IEEE 802.11b**: Bietet bis zu **11 Mbit/s** Datentransferrate und ist der älteste und am weitesten verbreitete Standard. Er wird hauptsächlich für ältere Geräte und Low-Speed-Anwendungen verwendet.
 * **IEEE 802.11g**: Erweitert den Standard 802.11b auf bis zu **54 Mbit/s** und bietet gleichzeitig Abwärtskompatibilität. Er war der dominierende Standard für WLAN im Heim- und Bürobereich, bevor er von neueren Standards abgelöst wurde.
 * **IEEE 802.11n**: Bietet bis zu **300 Mbit/s** Datentransferrate durch die Verwendung von MIMO (Multiple Input, Multiple Output) Technologie und Kanalaggregation. Er war der erste Standard, der die Gigabit-Geschwindigkeit im WLAN ermöglichte.

## Frequenzbereich 5 GHz:

 * **IEEE 802.11a**: Bietet bis zu **54 Mbit/s** Datentransferrate und war der erste WLAN-Standard im 5-GHz-Band. Er hat sich in Deutschland jedoch aufgrund der begrenzten Kanalverfügbarkeit und der Konkurrenz durch neuere Standards nicht weit verbreitet.
 * **IEEE 802.11n**: Bietet im 5-GHz-Band die gleichen Vorteile wie im 2,4-GHz-Band (bis zu **300 Mbit/s**, MIMO, Kanalaggregation) und profitiert von weniger Interferenzen und mehr verfügbaren Kanälen.
 * **IEEE 802.11ac**: Erhöht die Datentransferrate auf bis zu **1,3 Gbit/s** durch die Nutzung von MU-MIMO (Multi-User MIMO) Technologie, die mehrere Geräte gleichzeitig bedienen kann.
 * **IEEE 802.11ax** (Wi-Fi 6): Bietet bis zu **2,4 Gbit/s** Datentransferrate, verbesserte Leistung in dichten Umgebungen und erweiterte Reichweite durch diverse Optimierungen.
 * **IEEE 802.11be** (Wi-Fi 7): Der neueste Standard, der noch in der Entwicklungsphase ist, soll Datentransferraten von bis zu **46 Gbit/s** ermöglichen und weitere Verbesserungen für dichte Umgebungen und Latenzzeiten bringen.

## Multiple Input / Multiple Output (MIMO)



## Frequenzen / Kanäle

![2,4 GHz-Kanäle des WLANs](02_img/wlan-channels-24.svg)

## Carrier Sense Multipe Access / Collission Avoidance (CSMA/CA)

# Ausbreitung

Die Signalausbreitung hängt von vielen Faktoren ab. Auf der Sendeseite ist es die Sendeleistung, die vom Sender auf die Antenne gegeben wird. Die Antenne hat eine bestimmte Abstrahlungscharakteristik, die bestimmt, in welche Richtung die Leistung abgestrahlt wird.

Der Übertragungsweg beeinflusst das Signal und so wird das Signal durch Wände, besonders mit elektrisch leitenden Materialien, wie Stahl oder Metall; aber auch Bewuchs, wie z.B. Bäume oder Sträucher, gestört. Durch Reflexionen des Signals kommt es zu Überlagerungen, die das Signal stören.

## Sendeleistung

Im Frequenzbereich 2,4 GHz (2.400 - 2.4835 GHz):

 * Sendeleistung: Maximal 20 dBm an der Antenne

Im Frequenzbereich 5 GHz (5.150 - 5.825 GHz):

 * Sendeleistung: Maximal 30 dBm an der Antenne

## Dezibel

**dBm** steht für Dezibel Milliwatt und ist eine Einheit zur Messung der Leistung von Funksignalen, insbesondere im Bereich der Telekommunikation. Es drückt die Leistung eines Signals in Bezug auf eine Bezugsgröße von 1 Milliwatt (mW) aus.

So funktioniert es:

 * Dezibel (dB): Dezibel ist eine logarithmische Einheit, die verwendet wird, um Verhältnisse zwischen zwei Werten auszudrücken. In der Funktechnik wird es häufig verwendet, um die Leistung eines Signals im Vergleich zu einem Referenzwert darzustellen.
 * Milliwatt (mW): Milliwatt ist eine Einheit der Leistung, die einem Tausendstel Watt (W) entspricht. In der Funktechnik wird es verwendet, um die absolute Leistung eines Signals zu messen.

Berechnung von dBm:

Die dBm-Werte eines Signals können mit folgender Formel berechnet werden:

$$dBm = 10 \cdot log_{10} \left( \frac{P}{0,001} \right)$$

Dabei ist:

 * dBm der dBm-Wert des Signals
 * P die Leistung des Signals in Watt (W)

Beispiele:

 * Ein Signal mit einer Leistung von 1 mW hat einen dBm-Wert von 0.
 * Ein Signal mit einer Leistung von 10 mW hat einen dBm-Wert von 10.
 * Ein Signal mit einer Leistung von 100 mW hat einen dBm-Wert von 20.
 * Ein Singal mit einer Leistung von 0,5 mW hat einen dBm-Wert von -23.
 * Ein Signal mit einer Leistung von 0,1 mW hat einen dBm-Wert von -30.

Das bedeutet, postive dBm-Werte beschreiben eine Sendeleistung von größer 1 mW. Negative Werte beschreiben eine Sendeleistung von kleiner 1 mW. Umso negativer der Wert, umso geringer ist die Sendeleistung.

Diese dBm-Werte werden auch für die Signalstärke eines empfangenen Access Point angegeben.

Beispiel für einen Netzwerkscan zeigt die folgende Tabelle:

| ESSID | Absolute Signalstärke | Kanal | Frequenz |
|--|--|--|--|
| GRANZ WLAN 5 | -82 dBm | 36 | 5180 MHz |
| WLANREPEATER | -83 dBm | 36 | 5180 MHz |
| WLANREPEATER | -75 dBm | 11 | 2462 MHz |
| GRANZ WLAN 2 | -77 dBm | 11 | 2462 MHz |
| UPC4950975   | -86 dBm | 11 | 2462 MHz |
| HZN248587077 | -85 dBm | 2  | 2417 MHz |


## Antenne


# Betriebsmodus (Adhoc vs Access Point)

# Roaming und Mesh

# Sicherheit (WPA WPA-Enterprise)