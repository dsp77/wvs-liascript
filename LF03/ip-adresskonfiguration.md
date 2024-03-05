<!--
author:   Günter Dannoritzer
email:    g.dannoritzer@wvs-ffm.de
version:  1.0.0
date:     05.03.2024
language: de
narrator: Deutsch Female

comment:  IP Adresskonfiguration; DHCP, SLAAC; OSI-Schicht 3

logo:     02_img/logo-dhcp.jpg

tags:     LiaScript

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js

-->

# IP Adresskonfiguration

Jeder Netzwerkknoten benötigt eine IP-Konfiguration. Die Adresse kann manuell konfiguriert oder automatisch zugeordnet werden. Um ein Netzwerk mit vielen Netzwerkknoten zu konfigurieren, wird häufig eine automatische Konfiguration durchgeführt. Für IP4 gibt es das **Dynamic Host Configuration Protocoll (DHCP)**, das auch für IPv6 spezifiziert wurde. Für IPv6 gibt es zusätzlich das **Stateless Address Autoconfiguration (SLAAC)**.

# Dynamic Host Configuration Protocoll (DHCP)


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

Um über Routergrenzen hinweg die Konfiguration mithilfe von DHCP zu nutzen, benötigen die Router einen sogenannten **DHCP-Relay-Agent** um die DHCP-Pakete weiterzuleiten.


## Ausfallsicherheit

Ausfallsicherheit kann z.B. durch zwei DHCP-Server erreicht werden. Dazu muss der zu vergebende Adressbereich auf die beiden Server aufgeteilt werden. Bei konkurrierendem **Offer** der beiden Server wird der Client das ihm schneller erreichende **Offer** akzeptieren.


# DHCPv6

Für die IP-Adressvergabe hat IPv6 einen eigenen Mechanismus, jedoch sind die konfigurierbaren Parameter nicht so umfangreich, wie es mit DHCP möglich ist. Daher gibt es seit 2003 den **RFC 3315**, in dem beschrieben ist, wie die Konfiguration von DHCP auch über IPv6 möglich ist.



# Stateless Address Autoconfiguration (SLAAC)