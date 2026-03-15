<!--
author:   Günter Dannoritzer
email:    g.dannoritzer@wvs-ffm.de
version:  0.2.0
date:     15.03.2026
language: de
narrator: Deutsch Female

comment:  Administrative Programmierung

icon:    https://raw.githubusercontent.com/dsp77/wvs-liascript/0938e2e0ce751e270e3e36b8ecfeb09044a41aa0/wvs-logo.png
logo:     02_img/logo-admin-programing.jpg

tags:     LiaScript, Scripting, Programmierung, C#

link:     https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.css

script:   https://cdn.jsdelivr.net/chartist.js/latest/chartist.min.js

attribute: Lizenz: [CC BY-SA](https://creativecommons.org/licenses/by-sa/4.0/)
-->
# Administrative Programmierung

Bei der administrativen Programmierung mit C# geht es darum, den Fachinformatikerinnen und Fachinformatikern in der Fachrichtung Systemintegration Informationen und Übungen zu geben, damit sie typische Aufgaben aus der Abschlussprüfung Teil 2 lösen können, bei denen es darum geht, C#-Programme mit Arrays zu bearbeiten.

Um Programmierübungen selbst durchzuführen, gibt es Webseiten, die eine C#-Programmierung erlauben.

 * [https://dotnetfiddle.net/](https://dotnetfiddle.net/)
 * [https://www.programiz.com/csharp-programming/online-compiler/](https://www.programiz.com/csharp-programming/online-compiler/)

# Wiederholung von einfachen Programmschritten

## Beispiel for-Schleife

```csharp
Console.WriteLine("for-Schleife");

for (int i=0; i<5; i++) {

    Console.WriteLine($"i = {i}");
}
```

## Beispiel für ein Array-Datentyp

```csharp
Console.WriteLine("Hello, Array!");

int[] zahlen = {10, 20, 30, 40, 50};

// Zugriff auf einzelne Elemente
Console.WriteLine("Erstes Element: " + zahlen[0]);
Console.WriteLine("Drittes Element: " + zahlen[2]);

// Länge des Arrays
Console.WriteLine($"Das Array 'zahlen' ist {zahlen.Length} Elemente groß.");
```

## Beispiel für ein Array-Datentyp ohne Setzung von Daten

```csharp
// Ein Array mit 5 Elementen, alle Standardwert = 0
int[] zahlen = new int[5];

// Ausgabe der Werte
for (int i = 0; i < zahlen.Length; i++){

    Console.WriteLine($"Index {i}: {zahlen[i]}");
    
}
```

### Aufgabe: Werte zuweisen

Weisen Sie dem Array Zahlen in umgekehrter Reihenfolge mit aufsteigendem Index, wie in der folgenden Tabelle gezeigt, zu:

| Index | 0 | 1 | 2 | 3 | 4 |
|-------|---|---|---|---|---|
| Wert  | 4 | 3 | 2 | 1 | 0 |

## Beispiel: Verschiedene Array-Typen

``` csharp
// Ganzzahlen
int[] intArray = new int[5];          // {0,0,0,0,0}
long[] longArray = new long[3];       // {0,0,0}
short[] shortArray = new short[2];    // {0,0}

// Gleitkommazahlen
float[] floatArray = new float[4];    // {0.0,0.0,0.0,0.0}
double[] doubleArray = new double[3]; // {0.0,0.0,0.0}
decimal[] decimalArray = new decimal[2]; // {0.0,0.0}

// Zeichen
char[] charArray = new char[3];       // {'\0','\0','\0'}

// Wahrheitswerte
bool[] boolArray = new bool[2];       // {false,false}

// Byte-Typen
byte[] byteArray = new byte[4];       // {0,0,0,0}
sbyte[] sbyteArray = new sbyte[4];    // {0,0,0,0}
ushort[] ushortArray = new ushort[2]; // {0,0}
uint[] uintArray = new uint[2];       // {0,0}
ulong[] ulongArray = new ulong[2];    // {0,0}
```

## Arten von Arrays

### Eindimensionale Arrays

- Klassisches Array mit einer einzigen Dimension.
- Beispiel:

``` csharp
int[] zahlen = new int[5]; // {0,0,0,0,0}
```
- Zugriff über einen Index: `zahlen[0]`.

### Mehrdimensionale Arrays (rechteckig)

- Arrays mit mehreren Dimensionen, die wie Tabellen oder Matrizen aufgebaut sind.
- Beispiel (2D-Array):

``` csharp
int[,] matrix = new int[3, 3];
matrix[0, 0] = 1;
matrix[2, 1] = 5;
```
- Zugriff über zwei Indizes: `matrix[zeile, spalte]`.

### Gezackte Arrays (Jagged Arrays)
- Arrays von Arrays, bei denen jede „Zeile“ unterschiedlich lang sein kann.
- Beispiel:

``` csharp
int[][] jagged = new int[3][];
jagged[0] = new int[2];   // Länge 2
jagged[1] = new int[5];   // Länge 5
jagged[2] = new int[3];   // Länge 3
```
- Zugriff: `jagged[1][4]`.


# Grundlegende Variablentypen, ihr Bereich und Speicherbereich


| Datentyp | Beschreibung | Berechnung des Wertebereichs |
|----------|--------------|--------------|
| `sbyte`  | 8-Bit-Ganzzahl mit Vorzeichen | $2^7 = 128 \rightarrow -128 bis 127$ |
| `byte`   | 8-Bit-Ganzzahl ohne Vorzeichen | $2^8 = 256 \rightarrow 0 bis 255$ |
| `short`  | 16-Bit-Ganzzahl mit Vorzeichen | $2^{15} = 32768 \rightarrow -32768 bis 32767$ |
| `ushort` | 16-Bit-Ganzzahl ohne Vorzeichen | $2^{16} = 65536 \rightarrow 0 bis 65535$ |
| `int`    | 32-Bit-Ganzzahl mit Vorzeichen | $2^{31} = 2.147.483.648 \rightarrow -2.147.483.648 bis 2.147.483.647$ |
| `uint`   | 32-Bit-Ganzzahl ohne Vorzeichen | $2^{32} = 4.294.967.296 \rightarrow 0 bis 4.294.967.295$ |
| `long`   | 64-Bit Ganzzahl mit Vorzeichen | \-9.223.372.036.854.775.808 bis 9.223.372.036.854.775.807 |
| `ulong`  | 64-Bit Ganzzahl ohne Vorzeichen | 0 bis 18.446.744.073.709.551.615                         |
| `char`   | 16-Bit (Unicode) | Ein einzelnes Zeichen (U+0000 bis U+FFFF)                |

## Zahlenbereich verstehen

Für das Verständnis von Datentypen (wie byte, int usw.) ist es hilfreich, zuerst mit einem kleinen fiktiven Datentyp zu arbeiten. Ein 4-Bit-Datentyp eignet sich gut, weil er nur 16 mögliche Bitkombinationen besitzt und sich vollständig darstellen lässt.

Ein 4-Bit-Wert kann also $2^4 = 16$ verschiedene Werte annehmen.
Je nachdem, wie die Bits interpretiert werden, ergeben sich unterschiedliche Zahlenbereiche:

Ohne Vorzeichen (unsigned) → alle Bits beschreiben eine positive Zahl.

Einerkomplement → höchstes Bit ist das Vorzeichen, negative Zahlen entstehen durch Bitinvertierung.

Zweierkomplement → Standarddarstellung für vorzeichenbehaftete Ganzzahlen in modernen Programmiersprachen (auch in C#).

| Bits | Dezimal (unsigned) | Einerkomplement (signed) | Zweierkomplement (signed) |
| ---- | ------------------ | ------------------------ | ------------------------- |
| 0000 | 0                  | 0                        | 0                         |
| 0001 | 1                  | 1                        | 1                         |
| 0010 | 2                  | 2                        | 2                         |
| 0011 | 3                  | 3                        | 3                         |
| 0100 | 4                  | 4                        | 4                         |
| 0101 | 5                  | 5                        | 5                         |
| 0110 | 6                  | 6                        | 6                         |
| 0111 | 7                  | 7                        | 7                         |
| 1000 | 8                  | -7                       | -8                        |
| 1001 | 9                  | -6                       | -7                        |
| 1010 | 10                 | -5                       | -6                        |
| 1011 | 11                 | -4                       | -5                        |
| 1100 | 12                 | -3                       | -4                        |
| 1101 | 13                 | -2                       | -3                        |
| 1110 | 14                 | -1                       | -2                        |
| 1111 | 15                 | 0                        | -1                        |

### Erklärung der drei Darstellungen

#### 1. Zahlen ohne Vorzeichen (Unsigned)

Hier werden alle Bits als Wertbits interpretiert.

Beispiel: `1010`

Berechnung:

$1 \cdot 8 + 0 \cdot 4 + 1 \cdot 2 + 0 \cdot 1 = 10$

Der Wertebereich eines 4-Bit unsigned Typs ist daher: **0 bis 15**

Das entspricht dem Prinzip von Datentypen wie:

 * `byte`
 * `ushort`
 * `uint`

#### 2. Einerkomplement (signed)

Beim Einerkomplement gilt:

erstes Bit = Vorzeichen

 * `0` → positiv
 * `1` → negativ

negative Zahlen entstehen durch Invertieren aller Bits

Beispiel:

 * +5  = `0101`
 * -5  = `1010`

Besonderheit:
Es existieren zwei Nullen

 * `0000` = +0
 * `1111` = -0

Deshalb wurde dieses Verfahren in modernen CPUs weitgehend aufgegeben.

#### 3. Zweierkomplement (signed)

Das Zweierkomplement ist heute Standard für Ganzzahlen in Computern und Programmiersprachen wie C#.

Negative Zahlen entstehen durch:

 * Bits invertieren
 * 1 addieren

Beispiel für −5:

 * +5 = `0101`
 * Invertieren → `1010`
 * +1 → `1011`

Also: `1011` = -5

Der Wertebereich eines 4-Bit Zweierkomplement-Typs ist: **-8 bis +7**

Der Wertebereich für vorzeichenbehaftete Datentypen zu berechnen geht folgendermaßen:

 * negativste Zahl: $- (2^{Bitanzahl -1})$ hier: $- (2^{4-1}) = -8$
 * postivste Zahl: $- (negativste Zahl + 1)$ hier: $- (-8+1) = 7$

## Über- und Unterlauf von Variablen

Der Über- oder Unterlauf von Variablen muss bei der Programmierung mit streng typisierten Sprachen beachtet werden. Der folgende Programmcode zeigt den Überlauf einer Variablen vom Typ `byte` und `sbyte` sowie den Unterlauf von `sbyte`. Für beide Datentypen werden 8-Bit-Speicher verwendet. Für das vorzeichenlose `byte` ergibt sich damit ein Zahlenbereich von 0 bis 255. Für `sbyte` ist der Bereich von -128 bis +127.


``` csharp
// Beispiel mit byte (0 bis 255)  
byte b = 255;  
Console.WriteLine("Byte vor Überlauf: " + b);  
b++; // Überlauf tritt auf  
Console.WriteLine("Byte nach Überlauf: " + b);

Console.WriteLine();  
  
// Beispiel mit sbyte (-128 bis 127)  
sbyte sb = 127;  
Console.WriteLine("SByte vor Überlauf: " + sb);  
sb++; // Überlauf tritt auf  
Console.WriteLine("SByte nach Überlauf: " + sb);  
  
Console.WriteLine();  
  
// Beispiel mit negativem Überlauf bei sbyte  
sbyte sb2 = -128;  
Console.WriteLine("SByte vor negativem Überlauf: " + sb2);  
sb2--; // Überlauf tritt auf  
Console.WriteLine("SByte nach negativem Überlauf: " + sb2);
```


## Asymmetrischer Zahlenbereich für vorzeichenbehaftete Festkommazahlen

``` csharp
using System;

class Program
{  
    static void Main()
    {  
         Console.WriteLine("4-Bit Zahlenbereich (0 bis 15):\n");

         for (int i = 0; i < 16; i++)  
         {  
             // Zahl immer zweistellig  
             string number = i.ToString("D2");  
  
             // Binärdarstellung mit 4 Stellen  
             string binary = Convert.ToString(i, 2).PadLeft(4, '0');  
  
             // Ausgabe: Zahl und Binärdarstellung  
             Console.Write($"{number} -> ");  
  
             // Erstes Bit (MSB) Vorzeichen  
             Console.Write("[" +  binary[0] + "]");  
  
             // Restliche Bits  
             Console.WriteLine(binary.Substring(1));  
         }  
    }  
}
```

