<!--
author:   Günter Dannoritzer
email:    g.dannoritzer@wvs-ffm.de
version:  0.5.0
date:     26.03.2024
language: de
narrator: Deutsch Female

comment:  Internetprotokoll Version 6 (IPv4); Aufbau der Adresse; OSI-Schicht 3

logo:     02_img/logo-ipv6.jpg

tags:     LiaScript

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js

-->

# Internetprotokoll Version 6 (IPv6)

Das massive Wachstum des Internets und die dadurch entstandenen Probleme in den 90er-Jahren des letzten Jahrhunderts haben die Entwicklung eines neuen Internetprotokolls vorangetrieben. Insbesondere die begrenzte Anzahl an IP-Adressen mit der Version 4 des Internetprotokolls hat zu einer schrittweisen Einführung des neuen Protokolls geführt.

Da die Versionsnummer 5 schon für eine Streamingvariante des Protokolls verwendet wurde, kamen die neuen Funktionen als Version 6 daher.

In Stichworten sind die wichtigsten Verbesserungen von IPv6 im Vergleich zu IPv4:

 * Vergrößerung und hierarchische Strukturierung des IP-Adressraums
   (128-Bit vs. 32 Bit für die Adresse)
 * Verbesserung der Header-Struktur
 * Gültigkeitsbereich von IP6-Adressen
 * Autokonfiguration
 * Verbesserung der Sicherheit
 * Default Minimum-MTU-Größe von 1280 Byte (vs. 576 Byte bei IP4)


# Darstellung von IPv6 Adressen

Da eine IPv6-Adresse im Gegensatz zu IPv4-Adressen 128 Bit lang ist, würde eine dezimale Schreibweise zu sehr langen Adressinformationen führen. Man hat sich daher für eine hexadezimale Schreibweise entschieden. Bei IPv6-Adressen werden jeweils 4 Hexadezimalzahlen zu einem Block zusammengefasst. Eine Hexadezimalziffer entspricht 4 Bit. Demnach stellt ein Block 16 Bit bzw. 2 Byte dar. Da insgesamt 16 Byte darzustellen sind, werden 8 Blöcke benötigt. Zur besseren Lesbarkeit werden die Blöcke mit einem Doppelpunkt voneinander getrennt. Im Folgenden werden weitere Regeln und einige Beispiele von IPv6-Adressen vorgestellt.

Beispiel einer IPv6-Adresse:

`adcf:0005:0000:0000:0000:0000:0600:fedc`

## Verbindliche Notationsregeln nach RFC 5952

Bei der maschinenbezogenen Nutzung und Darstellung wird von der sogenannten *kompaktifizierten IPv6-Adresse* Gebrauch gemacht. Ziel ist es, die lange Schreibweise abzukürzen. Die Regeln, nach denen diese Schreibweise gebildet wird, sind wie folgt:

 1. Alle alphabetischen Zeichen (Buchstaben a, b, c, d, e, f) werden grundsätzlich kleingeschrieben.
 2. Alle führenden Nullen eines Blocks werden grundsätzlich weggelassen.
     * 0000 -> 0; 0005 -> 5; 0600 -> 600
     * `adcf:0005:0000:0000:0000:0000:0600:fedc`
       * `adcf:5:0:0:0:0:600:fedc`
 3. Einer oder mehrere aufeinanderfolgende 4er-Nullerblöcke werden durch zwei Doppelpunkte ("::") gekürzt.
     * `adcf:5:0:0:0:0:600:fedc`
       * `adcf:5::600:fedc`
 4. Die Kürzung zu zwei Doppelpunkten ("::") darf nur einmal von links beginnend durchgeführt werden.
     * `127f:5:0:0:127:0:0:fedc`
       * `127f:5::127:0:0:fedc`


# Vorstellung vom Umfang der verfügbaren Adressen

Das *Réseaux IP Européens Network Coordination Centre* (RIPE NCC) ist u.a. für die Vergabe von IP-Adressen in Europa zuständig[^RIPE]. Es hat im November 2019 bekannt gegeben, dass die letzten IPv4-Adressen vergeben wurden.

[^RIPE]: https://www.ripe.net/manage-ips-and-asns/ipv4/ipv4-run-out/

Eine Motivation für die Entwicklung von IPv6 war es, dass die Adressen nicht so schnell ausgehen. Um eine Vorstellung von dem Umfang der Adressen zu erhalten, kann der Film von *Sunny Classroom* einen Eindruck geben.

!?[Sunny Classroom: Kürzen von IPv6-Adressen; Umfang des Adressbereichs](https://youtu.be/O4LrtBS3laQ)

# IPv6-Adresspräfix

Das von IPv4 bekannte Adressschema `\<IP-Adresse\>/\<Länge der Subnetzmaske\>`, als Beispiel, `192.168.16.109/24` wird mit IPv6 erweitert. Die Schreibweise heißt `\<IP-Adresse\>/\<Präfixlänge\>`, als Beispiel `2003::/16`. Der IPv4-Begriff *Subnetzmaske* wird bei IPv6 durch *Präfixlänge* ersetzt und beschreibt den festen Teil der Adresse.

Die folgenden drei Adresspräfixe mit `/4`, `/8` und `/16`-Bit zeigen, wie der zugehörige Adressbereich aussieht. Das `x` zeigt die flexible Stelle des Adressbereichs.

 * `2004::/4` -> `2xxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx`
 * `2004::/8` -> `20xx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx`
 * `2004::/16` -> `2000:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx`

Die von IPv4 bekannten Begriffe von *Netzwerkadresse* und *Broadcastadresse* gibt es bei IPv6 nicht mehr. Anstelle der Netzwerkadresse gibt es jetzt das **Adresspräfix**. Der Broadcast wird bei IPv6 mithilfe von Multicastadressen realisiert.

# Gültigkeitsbereich der Adressen (Scope)

Der enorme Adressraum wird unterteilt in Bereiche (Scopes) mit unterschiedlicher Gültigkeit.

 * Host-Scope
 * Link-Local-Scope
 * Unique-Local-Scope
 * Global-Scope
 * Multicast-Scope

Die Abbildung verdeutlicht den Scope vom Rechner ausgehend, der schalenförmig sich ausbreitet.

![Gültigkeitsbereich von Adressen](02_img/lf03_ipv6_scope.svg)

Die wichtigsten Gültigkeitsbereiche sind:

 * **Host-Scope**: Diese Adressen sind nur auf dem lokalen Host gültig und können nicht von anderen Hosts im Netzwerk verwendet werden. Die IPv6-Loopback-Adresse `::1/128` oder die unspezifische Adresse `::/128` gehört zu dem Bereich, der nur auf einem Host genutzt werden kann.
 * `fe80::/10` - **Link-Local-Scope**: Diese Adressen sind nur im lokalen Netzwerk (z.B. einem WLAN) gültig und dürfen nicht geroutet werden.
 * `fc00::/7` bis `fdff::/7` - **Unique-Local-Scope**: Diese Adressen sind global eindeutig, aber nicht im öffentlichen Internet geroutet. Sie können für private Netzwerke verwendet werden. Adressen mit dem Präfix `fc` werden vom Provider vergeben, die mit dem Präfix `fd` können im eigenen Netzwerk verwendet werden.
 * **Global-Scope**: Diese Adressen sind im öffentlichen Internet geroutet und können weltweit verwendet werden.
 * `ff::/8` - **Multicast-Scope**: Diese Adressen werden für die Kommunikation mit einer Gruppe von Empfängern verwendet. Sie ersetzen u.a. die von IPv4 bekannten Broadcastadressen.

# Interface-ID in IPv6-Adressen

Um ein IP-Paket über das LAN zu versenden, muss das Paket in einen Ethernetrahmen gepackt werden. Um bei IPv4 die zur Ziel-IP-Adresse gehörige MAC-Adresse zu ermitteln, wird das Address Resolution Protocol (ARP) verwendet. Mithilfe einer festen Zuordnung von IP-Adresse zur MAC-Adresse kann auf die ARP-Funktion verzichtet werden. Es werden folgende drei Methoden dazu verwendet:

 * IEEE Extended Unique Identifier (EUI-64)
 * mit einem zufälligen Bitmuster
 * mithilfe manueller Konfiguration

## IEEE Extended Unique Identifier

Mithilfe der **Interface-ID** wird eine IPv6-Adresse basierend auf der zugehörigen MAC-Adresse des Interfaces gebildet.

Die folgende Abbildung zeigt die Schritte, um von einer dem Interface zugehörigen 48-Bit großen MAC-Adresse die 64-Bit große Interface-ID und daraus die IPv6-Adresse zu bilden.

![Interface-ID aus der MAC-Adresse bilden](02_img/lf03_ipv6_interface_id.svg)

Zu bemerken ist das Bit 41 der MAC-Adresse, das sich im ersten Oktett der MAC-Adresse befindet. Es bestimmt, ob es sich um eine weltweit eindeutige oder eine im lokalen Netzwerk lokal vergebene MAC-Adresse handelt. Dieses Bit wird für die Bildung der Interface-ID umgedreht (flipped). Ein gesetztes Bit wird gelöscht oder ein gelöschtes Bit wird gesetzt. Bei einer eindeutigen MAC-Adresse entsprechen die ersten 24 Bits der sogenannten Company-ID, die der Herstellerfirma vom IEEE zugewiesen wird. Die MAC-Adresse wird an der Grenze aufgesplittet und die 16-Bit `ff fe` werden eingefügt. So werden aus den 48 Bit der MAC-Adresse die 64 Bit der Interface-ID.

Das folgende Beispiel zeigt die Schritte anhand des Adresspräfix `fe80:0000:0000:0000::/32`.

````
Adresspräfix: fe80:0000:0000:0000::/32
Interface MAC-Adresse: 01:02:03:04:05:06

Bit-41: 01 -> 0000 0001
                     ^
Bit-41 invertiert: 0000 0011 -> 03

MAC-Adresse mit Bit-41-Flip: 03:02:03:04:05:06

Interface-ID: 03:02:03:ff:fe:04:05:06

IP-Adresse: fe80:0000:0000:0000:0302:03ff:fe04:0506
````

# Aufgabe

Sie analysieren die IPv6-Adresse `fe80::521a:c5ff:fef2:38b7`.

Nennen Sie die folgenden zugehörigen Werte:

 * Länge der IPv6-Adresse in Bits: [[128]]
 * Ungekürzte Darstellung der IPv6-Adresse in Hexadezimalschreibweise: [[fe80:0000:0000:0000:521a:c5ff:fef2:38b7]]
 * Präfixlänge: [[64]] Bits.
 * Interface-Identifier: [[521a:c5ff:fef2:38b7]]

 (IT-Berufe, IHK-Abschlussprüfung Teil 1 Frühjahr 2024)

# IPv6-Header

Ein IP-Paket ist aufgebaut nach dem allgemeinen Schema:

````
+---------+-------------+
| Header  |  Data field |
+---------+-------------+
````

Der [RFC8200](https://datatracker.ietf.org/doc/html/rfc8200) beschreibt den Aufbau des IPv6-Headers. Durch die 128 Bit IPv6-Adresse, die als Quell- und Zieladresse in einem IP-Paket zweimal vorhanden sein muss, übertrifft die Größe des Headers schon alleine durch die Adressen den 20 Byte großen IPv4-Header. Um eine effiziente Übertragung zu erhalten, wurde der Header modularisiert. Das bedeutet, dass es einen Header mit den minimalen Information gibt, die für die Übertragung nötig sind. Um weitere Informationen, wenn nötig mit aufnehmen zu können, wird ein Erweitungsheader (**Extension Header**) hinzugefügt.

````
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |Version| Traffic Class |           Flow Label                  |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |         Payload Length        |  Next Header  |   Hop Limit   |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                                                               |
   +                                                               +
   |                                                               |
   +                         Source Address                        +
   |                                                               |
   +                                                               +
   |                                                               |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                                                               |
   +                                                               +
   |                                                               |
   +                      Destination Address                      +
   |                                                               |
   +                                                               +
   |                                                               |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
````

| Feld | Bedeutung |
|------|-----------|
| Version | 4 Bit, für IPv4 = 4 für IPv6 = 6|
| Traffic Class | 8 Bit Der [RFC2474 Differentiated Services Field (DS Field)](https://datatracker.ietf.org/doc/html/rfc2474) beschreibt Verkehrsklassen und wie diese bei der Überlastung von Verbindungen behandelt werden sollen. Zeitkritische Daten wie z.B. Telefonie werden verworfen, zeitunkritische Daten werden zwischengespeichert und später weitergeleitet.  |
| Flow Label  | 20 Bit großes Label, mit dem eine Reihe von Paketen gemäß [RFC6437](https://datatracker.ietf.org/doc/html/rfc6437) zu einem Flow zusammengefasst werden können. |
| Payload Length  | 16 Bit -> maximal 65536 Oktetts kann das dem Header folgende Datenfeld groß sein. |
| **Next Header** | 8 Bit legen fest, welcher Header in dem Datenfeld folgt. Die [Protokollnummern werden von der IANA festgelegt](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml). |
| **Hop Limit** | 8 Bit Wert, der beim Übergang über einen Router verringert wird. |
| Source Address | 128 Bit Quelladresse, von der das Paket losgesendet wurde. |
| Destination Address | 128 Bit Zieladresse, an die das Paket gesendet werden soll. |

Das **Hop Limit** wurde von dem *Time-To-Live (TTL)*-Wert von IPv4 abgeleitet und reduziert sich jetzt nur noch auf die Anzahl der Router. Bei jedem Routerübergang wird der Wert um eins verringert. Ein Router, der den Wert auf null setzt, verwirft das Paket und sendete ein ICMP-Paket mit der Meldung *Time Exceeded* an die Quelladresse des verworfenen Pakets zurück.

## Extension Header (Next Header)

Um den Header so klein wie nötig zu halten, wurden Parameter, die nicht für jedes Paket nötig sind, in sogenannte Erweiterungs-Header (Extension Header) ausgelagert. Der RFC8200 spezifiziert die sechs Extension Headers:

 * Hop-by-Hop Options
 * Fragment
 * Destination Options
 * Routing
 * Authentication
 * Encapsulating Security Payload

Das **Next Header**-Feld kann jetzt einen der sechs Erweiterungsheaders oder ein anderes Protokoll, wie unter ["Protokollnummern der IANA"](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml) festgelegt verwendet werden.

Beispiel für Protokollnummern sind:

| Protokollnummer | Bezeichnung |
|-----------------|-----------------------------|
| 6 |  TCP |
| 17 | UDP |
| 0 | IPv6 Hop-by-Hop Options |
| 44 | IPV6 Fragment |
| 60 | IPv6 Destination Options |
| 43 | IPv6 Routing |
| 51 | IPv6 Authentication |
| 50 | IPv6 Encapsulating Security Payload |
| 58 | IPv6-ICMP |

Die folgende Abbildung kommt aus dem RFC8200 und zeigt drei mögliche Verkettungen von Header:

 1. IPv6 Header -> TCP
 2. IPv6 Header -> Routing ->  TCP
 1. IPv6 Header -> Routing -> Fragment -> TCP

````
   +---------------+------------------------
   |  IPv6 header  | TCP header + data
   |               |
   | Next Header = |
   |      TCP      |
   +---------------+------------------------

   +---------------+----------------+------------------------
   |  IPv6 header  | Routing header | TCP header + data
   |               |                |
   | Next Header = |  Next Header = |
   |    Routing    |      TCP       |
   +---------------+----------------+------------------------

   +---------------+----------------+-----------------+-----------------
   |  IPv6 header  | Routing header | Fragment header | fragment of TCP
   |               |                |                 |  header + data
   | Next Header = |  Next Header = |  Next Header =  |
   |    Routing    |    Fragment    |       TCP       |
   +---------------+----------------+-----------------+-----------------
````



# Hilfsfunktionen

