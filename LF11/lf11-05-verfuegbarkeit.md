<!--
author:   Günter Dannoritzer
email:    g.dannoritzer@wvs-ffm.de
version:  0.1
date:     09.11.2025
language: de
narrator: Deutsch Female

comment:  Verfügbarkeit

icon:    https://raw.githubusercontent.com/dsp77/wvs-liascript/0938e2e0ce751e270e3e36b8ecfeb09044a41aa0/wvs-logo.png
logo:     02_img/logo-availability.jpg

tags:     LiaScript, Verfügbarkeit

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js

attribute: Lizenz: [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)
-->
# Verfügbarkeit von Systemen




## Verfügbarkeit

Das Bundesamt für Sicherheit in der Informationstechnik (BSI) hat in einem [Hochverfügbarkeitskompendium](https://www.bsi.bund.de/dok/HV-Kompendium) Verfügbarkeitsklassen definiert. Mit der Verfügbarkeitsklasse 3 wird eine **Hochverfügbarkeit** mit 99,99% Verfügbarkeit beschrieben. In einem Monat darf ein System nicht mehr als 5 Minuten, in einem Jahr nicht mehr als 53 Minuten ausfallen.

Die Verfügbarkeit (A - Availability) berechnet sich mit:

$$Verfügbarkeit = \frac{\text{Betriebszeit}}{\text{Gesamtzeit}}$$

Beispielrechnung für einen Monat mit 5 Minuten Ausfallzeit:

$$60 \; \text{Minuten} \cdot 24 \; \text{Stunden} \cdot 30 \; \text{Tage} = 43.200 \; \text{Minuten}$$

$$A = \frac{43200 - 5}{43200} = 0,99988 = 99,99\%$$


## Ausfallwahrscheinlichkeit, MTBF, MTTR

Die Ausfallwahrscheinlichkeit (U - Unavailability) ist der Gegenwert zur Verfügbarkeit und berechnet sich:

$$U = 1 - A$$

Für eine Hochverfügbarkeit von 99,99% ergibt sich als eine Ausfallwahrscheinlichkeit von:

$$U = 1 - 0,9999 = 0,0001 = 0,01\%$$

Mit der Ausfallwahrscheinlichkeit werden auch die Begriffe **MTBF** und **MTTR** verwendet.

| Begriff | Bedeutung | Beschreibung |
|---------|-----------|--------------|
| **MTBF** (Mean Time Between Failures) | Mittlere Betriebsdauer zwischen Ausfällen | Gibt an, wie oft ein System im Durchschnitt ausfällt (Zuverlässigkeit). |
| **MTTR** (Mean Time To Repair) | Mittlere Reparaturzeit | Gibt an, wie schnell ein System nach einem Ausfall wiederhergestellt wird. |

### MTBF = Mean Time Between Failures

Die MTBF ist ein Maß für die Zuverlässigkeit eines Systems oder einer Komponente. Man beobachtet viele gleiche Geräte über längere Zeit. Dann berechnet man:

$$\text{MTBF} = \frac{\text{Gesamtbetriebszeit aller Geräte}}{\text{Anzahl der Ausfälle}}$$
	​
Beispiel

10 Router werden jeweils 1.000 Stunden lang betrieben (also 10.000 Stunden Gesamtbetriebszeit)
und es gibt insgesamt 5 Ausfälle. Dann gilt:

$$MTBF = \frac{10.000 h}{5} =2.000 h$$

Ein Router fällt im Durchschnitt alle 2.000 Stunden aus.


### MTTR = Mean Time To Repair

Die MTTR (Mean Time To Repair) ist die mittlere Reparaturzeit. Nach einem Ausfall dauert es im Mittel MTTR Stunden, bis das System wieder läuft.

Die Verfügbarkeit (A) ergibt sich dann zu:

$$A = \frac{MTBF}{MTBF+MTTR}$$

Hier eine vereinfachte Skizze der Zusammenhänge:

```text
Zeit →
|<--------- MTBF ---------->|<---- MTTR ---->|<--------- MTBF ---------->|
|---------------------------|~~~~~~~|---------------------------|~~~~~~~|
 Betrieb ohne Ausfall      Ausfall  Reparatur  Betrieb ohne Ausfall     ...
````

 * `---` = Betriebszeit (System funktioniert)
 * `~~~~` = Ausfall- und Reparaturzeit
 * MTBF misst den Zeitraum zwischen zwei Ausfällen.
 * MTTR misst die Reparaturzeit nach einem Ausfall.



## Verfügbarkeit und Ausfallwahrscheinlichkeit

![Verfügbarkeit und Ausfallwahrscheinlichkeit](./02_img/lf11-05-availability-failure-probability.png)

Die Verfügbarkeit lässt sich mit diesen beiden Werten berechnen:

$$A = \frac{MTBF}{MTBF+MTTR}$$

Je größer also die MTBF (seltene Ausfälle) und je kleiner die MTTR (schnelle Reparatur), desto höher ist die Verfügbarkeit.

Beispiel: Ein Server hat:

 * MTBF = 1.000 Stunden
 * MTTR = 10 Stunden

Dann:

$$A = \frac{1000}{1000+10} = 0,9901 = 99,01\%$$

Das bedeutet, der Server ist zu 99,01 % der Zeit verfügbar – also etwa 1 % Ausfallzeit, was rund 10 Stunden im Jahr wären.

# Techniken um die Verfügbarkeit zu erhöhen

## Verfügbarkeit durch Paralleschaltung erhöhen

## Hardware verfügbar machen

### Stromversorgung

### Netzwerk

## Spanning Tree Protocol (STP)

Mit dem Time-To-Live (TTL) bei IPv4 und dem Hop-Count bei IPv6 sind Mechanismen implementiert, um bei IP-Paketen die Verweildauer im Netzwerk zu begrenzen, wenn diese ihr Ziel nie erreichen. Bei jeder Übertragung über einen Router wird der im Paket gespeicherte Wert reduziert. Erreicht der Wert mit der Reduzierung den Wert 0, muss der entsprechende Router das Paket verwerfen.

In Ethernet-Netzwerken gibt es keinen vergleichbaren Mechanismus. Um die Problematik von kreisenden Ethernetrahmen zu beschreiben hilft ein Szenario mit zwei Switchen A und B. 

An Switch A ist an Port 1 ein Computer angeschlossen. Die Ports 3 und 4 sind beide mit dem Switch B Port 1 und 2 verbunden. So eine Verbindung würde genommen werden, um eine höhere Datenübertragungsrate zwischen den beiden Switchen zu erreichen.

In der Lernphase sind die beiden Source Address Tables (SAT) noch leer und jeder Ethernetrahmen, der den Switch erreicht, wird im Flooding über alle anderen angeschlossenen Ports ausgesendet. Wenn z.B. der Computer einen Ethernetrahmen an den Switch mit einer bestimmten Ziel-MAC-Adresse sendet, die dem Switch nicht bekannt ist, sendet der Switch A im Flooding den Rahmen über den Port (3) und (4) aus. Die beiden Rahmen kommen am Port (1) und (2) von Switch B an, der wiederum die Ziel-MAC-Adresse nicht kennt und im Flooding den Rahmen über den jeweilig anderen Port aussendet. So kommen wieder zwei Rahmen zurück am Switch A an, bei dem sich der Ablauf wiederholt.

````                                                                            
   ┌────────┐                                                        
   │        │                                                               
   │        │                                                               
   └────────┘                 Switch A                         Switch B     
                            ┌───────────┐                    ┌───────────┐  
    ────────                │           │                    │           │  
  /          \──────────────┼────(1)    │          ┌─────────┼────(1)    │  
 ──────────────             │           │          │         │           │  
                            │    (2)    │          │  ┌──────┼────(2)    │  
  [Ethernetrahmen] --->     │           │          │  │      │           │  
                            │    (3)────┼──────────┘  │      │    (3)    │  
                            │           │             │      │           │  
                            │    (4)────┼─────────────┘      │    (4)    │  
                            │           │                    │           │  
                            └───────────┘                    └───────────┘  
````                                                                            
                                                                            
Die Rahmen kreisen ständig zwischen Switch A und B hin und her, ohne jemals verworfen zu werden.

Um kreisende Rahmen zu vermeiden, gibt es das Spanning-Tree-Protokoll, das in Switche implementiert ist und angeschaltet werden sollte, wenn zwei und mehr Switche in einem Netzwerk verbunden sind.

Jeder Switch sendet einen STP-Rahmen aus, mit dessen Hilfe die Switche Schleifen erkennen. Wird eine Schleife erkannt, wird ein Port in den Stand-by-Modus geschaltet. Der Port empfängt zwar noch Ethernetrahmen und wertet sie aus, trägt aber nicht zur Übertragung von regulären Ethernetrahmen bei.

In der Zeichnung unten wurde die Schleife erkannt und der Port 1 von Switch B wurde in den Stand-by geschaltet. 


````                                                                            
   ┌────────┐                                                        
   │        │                                                               
   │        │                                                               
   └────────┘                 Switch A                         Switch B     
                            ┌───────────┐                    ┌───────────┐  
    ────────                │           │                    │           │  
  /          \──────────────┼────(1)    │          ┌──────(─)┼────(1)    │  
 ──────────────             │           │          │         │           │  
                            │    (2)    │          │  ┌──────┼────(2)    │  
  [Ethernetrahmen] --->     │           │          │  │      │           │  
                            │    (3)────┼──────────┘  │      │    (3)    │  
                            │           │             │      │           │  
                            │    (4)────┼─────────────┘      │    (4)    │  
                            │           │                    │           │  
                            └───────────┘                    └───────────┘  
````

Mithilfe des Spanning Tree Protocols können Schleifen als redundante Verbindungen in Netzwerk eingebaut werden. Durch STP wird eine Verbindung in Stand-by geschaltet und sollte die aktive Verbindung ausfallen, wird die Stand-by-Verbindung aktiv geschaltet.

## Link Aggregation

Ein Weg, um die Datenrate zu erhöhen, ist das sogenannte **Link Aggregation**. Hier werden im Switch zwei oder mehr Ports als zusammengehörig (Aggregation) konfiguriert.

In dem Beispiel sind im Switch A die Ports (3) und (4) und im Switch B die Ports (1) und (2) als zusammengehörig konfiguriert. Die Ports können jetzt miteinander verbunden werden und STP erkennt sie nicht als Schleife. Es werden auch die kreisenden Rahmen vermieden, weil z. B. beim Flooding ein Rahmen nur über einen der beiden aggregierten Ports ausgesendet wird.

````                                                                        
    ┌────────┐                                                                              
    │        │                                                                
    │        │                                                                
    └────────┘                 Switch A                         Switch B      
                             ┌───────────┐                    ┌───────────┐   
     ────────                │           │                    │   ┌───┐   │   
   /          \──────────────┼────(1)    │          ┌─────────┼───│(1)│   │   
  ──────────────             │           │          │         │   │   │   │   
                             │    (2)    │          │  ┌──────┼───│(2)│   │   
                             │   ┌───┐   │          │  │      │   └───┘   │   
                             │   │(3)│───┼──────────┘  │      │    (3)    │   
                             │   │   │   │             │      │           │   
                             │   │(4)│───┼─────────────┘      │    (4)    │   
                             │   └───┘   │                    │           │   
                             └───────────┘                    └───────────┘   
                                                                              
````

Hierdurch ist eine Verdopplung der Übertragungsrate möglich, ohne kreisende Rahmen zu erzeugen.


## Server verfügbar machen


### Active/Passive

### Cluster

### Load Balancer

### Content Delivery Network

