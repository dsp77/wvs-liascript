<!--
author:   Günter Dannoritzer
email:    g.dannoritzer@wvs-ffm.de
version:  1.1.0
date:     26.03.2024
language: de
narrator: Deutsch Female

comment:  IP Adresskonfiguration; DHCP, SLAAC; OSI-Schicht 3

logo:     02_img/logo-dhcp-slaac.jpg

tags:     LiaScript

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn26sdelivr.net/chartist.js/latest/chartist.min.js

-->

# IP Adresskonfiguration

Jeder Netzwerkknoten benötigt eine IP-Konfiguration. Die Adresse kann manuell konfiguriert oder automatisch zugeordnet werden. Um ein Netzwerk mit vielen Netzwerkknoten zu konfigurieren, wird häufig eine automatische Konfiguration durchgeführt. Für IPv4 gibt es das **Dynamic Host Configuration Protocol (DHCP)**, das auch für IPv6 spezifiziert wurde. Für IPv6 gibt es zusätzlich das **Stateless Address Autoconfiguration (SLAAC)**.

# Dynamic Host Configuration Protocol (DHCP)

Das **Dynamic Host Configuration Protocol (DHCP)** wird verwendet, um in einem IP-basierten Netzwerk die Konfiguration von Netzwerkteilnehmern durchzuführen. Neben der **IP-Adresse** kann u.a. auch die **Netzwerkmaske**, der **DNS-Server**, der **Zeitserver** oder das **Gateway** konfiguriert werden.

Das Protokoll basiert auf dem Client-/Server-Modell und der Protokollablauf wird in einem 4-Schritt-Verfahren durchgeführt, das mit dem Wort "DORA" beschrieben werden kann. Dabei steht jeder Buchstabe von "DORA" für einen Protokollschritt.

Die folgende Abbildung beschreibt den Protokollablauf.

![DHCP-Handshake](02_img/lf03_ipcfg_dhcp_handshake.svg)


Der Client beginnt mit dem **Discover**, um eine IP-Konfiguration zu erhalten. Wenn ein Server im Netzwerk verfügbar ist und eine Konfiguration anbieten kann, wird dieser mit einem **Offer** eine Konfiguration anbieten. Wenn der Client die Konfiguration akzeptiert, wird er mit einem **Request** dies bestätigen. Dabei sendet er auch wieder die angebotene Konfiguration mit. Sollten weitere DHCP-Server ein Offer abgegeben haben, werden sie das mit dem Request wieder freigeben für einen anderen Client. Der ausgewählte DHCP-Server wird schließlich mit einem **Acknowledge** bestätigen, dass die Konfiguration jetzt für den Client reserviert ist.

Auf der Serverseite besteht die Möglichkeit, das Vergabeverfahren der Konfiguration mit den folgenden drei Einstellungen zu konfigurieren.

 * Manuelle Zuordnung
 * Automatische Zuordnung
 * Dynamische Zuordnung


## Manuelle Zuordnung (Static Allocation)

Bei der manuellen Zuordnung wird im Server eine Zuordnungsliste von IP-zu-MAC-Adressen konfiguriert. Konfigurierte MAC-Adressen erhalten bei der Anfrage die fest zugeordnete IP-Adresse zugewiesen.

Vorteil: Die Computer erhalten immer die gleiche IP-Adresse und nur bekannte MAC-Adressen erhalten IP-Adressen.

Nachteil: Jeder neue Computer, der eine IP-Adresse erhalten soll, muss erst manuell im DHCP-Server konfiguriert werden.


## Automatische Zuordnung (Automatic Allocation)

Für die automatische Zuordnung wird im DHCP-Server ein IP-Adressbereich konfiguriert, der den Clients zugewiesen wird. Der Server merkt sich bei der Vergabe der IP-Adressen die zugehörige MAC-Adresse und reserviert die IP-Adresse nach der ersten Vergabe bis auf Weiteres für diese MAC-Adresse.

Vorteil: Auch hier erhalten Computer immer die gleiche IP-Adresse. Es muss keine manuelle Konfiguration neuer Computer durchgeführt werden.

Nachteil: Durch die feste Vergabe kann der Adressbereich vergeben sein und neue Computer erhalten dann keine Adresse mehr. 

## Dynamische Zuordnung (Dynamic Allocation)

Bei der dynamischen Zuordnung wird wie bei der automatischen ein IP-Adressbereich konfiguriert. Hier wird jedoch bei der Vergabe nicht die MAC-Adresse fest zugeordnet. Stattdessen wird eine sogenannte **Lease-Time** festgelegt, nach der die Vergabe der Konfiguration ausläuft. Mit dem **Acknowledge** teilt der Server dem Client mit, nach welcher Zeit seine Konfiguration die Gültigkeit verliert. Zusätzlich erhält er eine **Renewal-Time** und eine **Rebind-Time**.


 * Renewal-Time = $\frac{1}{2}$ (Lease-Time)
 * Rebind-Time = $\frac{7}{8}$ (Lease-Time)

Nach der **Renewal-Time** beginnt der Client, mit einem **Request** direkt (Unicast) an den Server gerichtet nachzufragen, ob er die Konfiguration verlängern kann. Der Server kann das mit einem **Acknowledge** bestätigen und damit wird die Lease-Time erneuert.

Wurde der Server z.B. abgeschaltet und antwortet nicht, beginnt der Client nach der **Rebind-Time** mit einem Broadcast einen **Request** in das Netz zusenden, um von einem anderen Server die Konfiguration bestätigt und verlängert zu bekommen. Findet das nicht statt, wird er
nach der **Lease-Time** seine Konfiguration verwerfen und beginnt, mit einem **Discover** wieder nach einer neuen Konfiguration zu fragen.


## DHCP-Relay

Um über Routergrenzen hinweg die Konfiguration mithilfe von DHCP zu nutzen, benötigen die Router einen sogenannten **DHCP-Relay-Agent**, um die DHCP-Pakete weiterzuleiten.

## Ausfallsicherheit

Ausfallsicherheit kann z.B. durch zwei DHCP-Server erreicht werden. Dazu muss der zu vergebende Adressbereich auf die beiden Server aufgeteilt werden. Bei konkurrierendem **Offer** der beiden Server wird der Client, dass ihm schneller erreichende **Offer** akzeptieren.

# DHCPv6

Für die IP-Adressvergabe hat IPv6 einen eigenen Mechanismus, jedoch sind die konfigurierbaren Parameter nicht so umfangreich, wie es mit DHCP möglich ist. Daher gibt es seit 2003 den [**RFC 8415**](https://www.rfc-editor.org/rfc/rfc8415.html), in dem beschrieben ist, wie die Konfiguration von DHCP auch über IPv6 möglich ist.


# Stateless Address Autoconfiguration (SLAAC)

Der DHCP-Server speichert den Status, welcher Host welche IP-Adresse erhält. Daher wird der Ablauf auch als Stateful Address Autoconfiguration bezeichnet.

Für IPv6 beschreibt der [RFC 4862](https://www.rfc-editor.org/rfc/rfc4862) das **Statless Address Autoconfiguration (SLAAC)**, das ohne Server auskommt, um eine Autokonfiguration durchzuführen.


# Interface-ID für Link-Local-Adressen

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