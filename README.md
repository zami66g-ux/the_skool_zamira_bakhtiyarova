
# The Skool – SQL-analys av YH-utbildningar 2025

## Projektbeskrivning

Det här projektet handlar om att analysera ansökningar till yrkeshögskoleutbildningar (YH) från 2025 med hjälp av Oracle SQL.

Uppdragsgivaren The Skool är en ny privat utbildningsanordnare som vill undersöka vilka utbildningar som kan vara intressanta att ansöka om att få bedriva.

Syftet är att använda data för att identifiera mönster i vilka utbildningar som har blivit beviljade eller fått avslag, och ge The Skool underlag för framtida beslut.

## Datakälla

- Källa: Myndigheten för yrkeshögskolan (MYH)
- Dataset: Resultat från ansökningsomgången 2025, tabell 3
- Antal ansökningar: 1 184
- Databas: Oracle Database 26ai
- Frågespråk: SQL


## Uppgift 1 – Explorativ dataanalys (EDA)

I den första analysen undersöktes ansökningar till YH-utbildningar under 2025.

Med hjälp av SQL analyserades bland annat:

- Antal ansökningar, beviljanden och avslag per utbildningsområde.
- Vilka Data/IT-utbildningar som beviljades respektive fick avslag.
- Vilka utbildningsanordnare som fick sina Data/IT-ansökningar beviljade.
- Vilka fem län som hade flest beviljade ansökningar.
- Fördelningen mellan distansutbildningar och bundna utbildningar.
- Hur många unika utbildningsnamn som innehöll förkortningen AI.

### Viktiga resultat

- Data/IT hade 220 ansökningar, varav 31 beviljades och 189 fick avslag.
- Teknik och tillverkning hade 221 ansökningar, varav 117 beviljades.
- Ekonomi, administration och försäljning hade flest ansökningar: 239.
- Stockholm och Västra Götaland hade flest beviljade ansökningar bland länen, med 89 vardera.

SQL-frågorna finns i filerna `02_eda_1a.sql` till `10_eda_1i.sql`.


## Uppgift 3 – Datadrivna beslut

Utifrån intervjun med The Skool formulerades fem frågor för att undersöka vilka utbildningar som kan vara intressanta att satsa på.

### 1. Vilka utbildningsområden har högst beviljandegrad?

Transporttjänster hade högst beviljandegrad med 64,3 %, men endast 14 ansökningar.

Hälso- och sjukvård samt socialt arbete hade 53,5 % och teknik och tillverkning 52,9 %. Dessa områden hade också betydligt fler ansökningar.

**Slutsats:** The Skool bör undersöka teknik och tillverkning samt hälso- och sjukvård närmare.

### 2. Vilken studieform har högst beviljandegrad?

- Bunden utbildning: 42,5 %
- Distansutbildning: 35,0 %

**Slutsats:** Bundna utbildningar hade högre beviljandegrad under 2025 och kan vara intressanta för The Skool.

### 3. Vilken huvudmannatyp har högst beviljandegrad?

- Kommun: 58,5 %
- Region: 50,0 %
- Privat: 35,3 %

**Slutsats:** Privata utbildningsanordnare hade lägre beviljandegrad än kommuner och regioner. The Skool bör därför undersöka vilka inriktningar privata aktörer har lyckats med.

### 4. Vilka SUN5-inriktningar inom Data/IT har högst beviljandegrad?

- Databasutvecklare: 100 % (2 ansökningar)
- Spelprogrammering: 66,7 % (6 ansökningar)
- IT-säkerhet: 21,2 % (33 ansökningar)
- Webbutveckling: 0 % (32 ansökningar)

**Slutsats:** Vissa specialiserade IT-inriktningar kan vara intressanta, men resultat från få ansökningar måste tolkas försiktigt.

### 5. Hur många utbildningsomgångar beviljas vanligtvis?

Av de 462 beviljade ansökningarna fick 416 tre utbildningsomgångar, vilket motsvarar 90 %.

**Slutsats:** Tre utbildningsomgångar kan användas som ett planeringsscenario för The Skool, men är ingen garanti för framtida beslut.

### Sammanfattande rekommendation

The Skool bör i första hand undersöka utbildningsområden med relativt hög beviljandegrad och ett större antal ansökningar, särskilt teknik och tillverkning samt hälso- och sjukvård.

Resultaten bygger på ansökningar från 2025. Historisk beviljandegrad är inte samma sak som sannolikheten att en framtida ansökan blir godkänd.

SQL-frågorna finns i filerna `11_beslut_3a.sql` till `15_beslut_3e.sql`.


## Projektstruktur

Projektet innehåller följande filer:

- `the_skool_2025_oracle.csv` – dataset med ansökningar från 2025.
- `01_load_csv.sql` – import av data till Oracle.
- `02_eda_1a.sql` till `10_eda_1i.sql` – SQL-frågor för uppgift 1.
- `11_beslut_3a.sql` till `15_beslut_3e.sql` – SQL-frågor för uppgift 3.
- `README.md` – dokumentation av projektet.

## Köra SQL-filerna

Projektet använder Oracle Database och SQLcl.

För att köra en SQL-fil används kursens startskript från Linux-terminalen:

```bash
~/sql1/02_setup/orac ~/the_skool_zamira_bakhtiyarova/11_beslut_3a.sql
```

Kommandot startar SQLcl och kör den angivna SQL-filen mot Oracle-databasen.

## Begränsningar

Analysen bygger på ansökningsresultat från 2025. Resultaten visar historiska mönster och kan användas som beslutsunderlag, men garanterar inte att framtida ansökningar blir beviljade.


## Skärmbilder från SQL-analyser

### Uppgift 3a – Beviljandegrad per utbildningsområde

Bilden visar beviljandegraden för de 14 utbildningsområdena, sorterade från högst till lägst.

![Resultat från uppgift 3a](screenshots/Uppgift%203a.png)


### Uppgift 3b – Beviljandegrad per studieform

Analysen jämför beviljandegraden mellan bundna utbildningar och distansutbildningar. Bundna utbildningar hade en beviljandegrad på 42,5 %, jämfört med 35,0 % för distansutbildningar.

![Resultat från uppgift 3b](screenshots/Uppgift%203b.png)

### Uppgift 3c – Beviljandegrad per huvudmannatyp

Analysen jämför beviljandegraden mellan olika huvudmannatyper. Kommunala utbildningsanordnare hade högst beviljandegrad med 58,5 %, följt av regioner med 50,0 % och privata utbildningsanordnare med 35,3 %.

![Resultat från uppgift 3c](screenshots/Uppgift%203c.png)

### Uppgift 3d – Beviljandegrad inom Data/IT

Analysen undersöker vilka utbildningsinriktningar inom Data/IT som hade högst respektive lägst beviljandegrad. Exempelvis hade databasutvecklare 100 % (2 av 2 ansökningar), medan webbutvecklare hade 0 % (0 av 32 ansökningar).

Resultaten bör tolkas försiktigt eftersom vissa utbildningsinriktningar har få ansökningar.

![Resultat från uppgift 3d](screenshots/Uppgift%203d.png)

### Uppgift 3e – Antal beviljade utbildningsomgångar

Analysen visar hur många utbildningsomgångar som beviljades per godkänd ansökan. Av totalt 462 beviljade ansökningar fick 416 (90,0 %) tre utbildningsomgångar.

Resultatet visar att tre utbildningsomgångar var det vanligaste utfallet bland de beviljade ansökningarna.

![Resultat från uppgift 3e](screenshots/Uppgift%203e.png)
