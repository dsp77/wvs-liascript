<!--
author:   Günter Dannoritzer
email:    g.dannoritzer@wvs-ffm.de
version:  1.1.0
date:     18.02.2024
language: de
narrator: Deutsch Female

comment:  Internetprotokoll Version 4 (IPv4); Aufbau der Adresse, Subnetzwerkmaske, 
            Gateway, Berechnung von Netzwerkgrößen; OSI-Schicht 3

logo:     02_img/logo-ipv4.jpg

tags:     LiaScript

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js

-->

# Internetprotokoll Version 4 (IPv4)

Auf der OSI-Schicht 3, der Vermittlungsschicht (Network Layer) wird das Internetprotokoll verwendet. Die weltweite Verbreitung fand unter der Version 4 (IPv4) statt. Mittlerweile findet eine Umstellung auf die Protokollvariante 6 (IPv6) statt. In diesem Dokument wird die Version 4 beschrieben.

Die IPv4-Adresse ist 32-Bit groß und wird in der sogenannten Deziaml-gepunkteten Notation dargestellt. Ein Beispiel einer Adresse ist **`192.168.16.109`**. Jeweils 8-Bit (Oktet) werden punktgetrennt als Dezimalwert dargestellt.

Die Konfiguration eines Netzwerkknotens enthält mindestens die Parameter:

 * IP-Adresse, z.B. `192.168.16.109`
 * Subnetzmaske, z.B. `255.255.255.0`

 Die **Subnetzmaske** bestimmt, wie groß ein Netzwerk ist, was bedeutet, welche IP-Adressen zu einem Netzwerk gehören. Sie wird auch in der Dezimal-gepunkteten Notation geschrieben und beschreibt über gesetzte Bits, welche Bits der IP-Adresse zur Netzwerkadresse gehören. Als Alternative Schreibweise wird die Anzahl der gesetzten Bits in einer Suffixschreibweise an die IP-Adresse gehängt.

 Beispiel, die Subnetzmaske `255.255.255.0`, umgerechnet in eine binäre Form ist:

 `1111 1111 . 1111 1111 . 1111 1111 . 0000 0000`

 Von links gezählt sind das 24-Bits, die auf eins gesetzt sind. Damit ist die alternative Schreibweise der IP-Adresse mit Suffixschreibweise der Subnetzmaske:

  * `192.168.16.109/24`

 Ein Netzwerk setzt sich zusammen aus:

  * Netzwerkadresse; die erste Adresse im Addressbereich des Netwzwerks
  * Hostadressen; die Adressen für die Netzwerkknoten in dem Netzwerk
  * Broadcastadresse; die letzte Adresse in dem Netzwerk

## Berechnung eines Netzwerks

Die Vorgehensweise ein Netzwerk zu berechnen ist:

 1. Netzanteil bestimmen
     --> Größe der Subnetzmaske (Suffix z.B. /24)
 2. Netzadresse bestimmen
     --> alle Hostbits auf 0 setzen
 3. Broadcastadresse bestimmen
     --> alle Hostbits auf 1 setzen
 4. Anzahl der Hostadressen bestimmen
     --> $2^ {Hostbits}-2$
     --> Hostbits = 32 - Subnetzgröße


Beispiel, für die IP-Adresse `192.168.16.109/24` soll da Netzwerk berechnet werden.

### 1. Netzanteil bestimmen

Für die IP-Adresse `192.168.16.109/24` soll der Netzanteil bestimmt werden. Dazu werden von links 24-Bit markiert. Rechnerisch wird die IP-Adresse mit dem Subnetzsmaske binär UND-Verknüpft.

```
192.168.16.109
|---------|
  24-Bit
```

### 2. Netzadresse bestimmen

![Netzadresse bestimmen. Die Hostbits werden auf 0 gesetzt](02_img/netzadresse-bestimmen.png)


### 3. Broadcastadresse bestimmen

![Broadcastadresse bestimmen. Die Hostbits werden auf 1 gesetzt](02_img/broadcast-bestimmen.png)

### 4. Anzahl der Hostadressen bestimmen

![Anzahl der Hostadressen bestimmen](02_img/anzahl-der-hostadressen-bestimmen.png)

### Zusammenfassung

 * IP-Adresse: `192.168.16.109/24`
 * Netzadresse: `192.168.16.0`

   * Hostadresse 1: `192.168.16.1`
   * ...
   * Hostadresse 254: `192.168.16.254`

 * Broadcastadresse: `192.168.16.255`

# Übung Netzwerk berechnen

Berechnen Sie:

 * Netzwerkadresse
 * Anzahl der Hostadressen
 * Broadcastadresse

für folgende IP-Adressen:

 1. `192.168.16.109/24`
 2. `192.168.16.109/22`
 3. `192.168.16.109/26`

## Lösung zu 1.

 * Netzwerkadresse: 192.168.16.0
 * Anzahl der Hostadressen: $2^{(32-24)=8} = 256 - 2 = 254$
 * Broadcastadresse: 192.168.16.255

## Lösung zu 2.

 * Netzwerkadresse: 192.168.16.0
 * Anzahl der Hostadressen: $2^{(32-22)=10} = 1024 - 2 = 1022$
 * Broadcastadresse: 192.168.19.255

## Lösung zu 3.

 * Netzwerkadresse: 192.168.16.64
 * Anzahl der Hostadressen: $2^{(32-26)=6} = 64 - 2 = 62$
 * Broadcastadresse: 192.168.16.127
