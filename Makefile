TEX = pdflatex
PDFTK = pdftk
S1=0-00_deckblatt_uebersicht.tex
O1=$(S1:.tex=.pdf)
A1=$(S1:.tex=.aux)
S2=0-01_Allgemeines.tex
O2=$(S2:.tex=.pdf)
A2=$(S2:.tex=.aux)
S3=3-01_San-Dienst.tex 
O3=$(S3:.tex=.pdf)
A3=$(S3:.tex=.aux)
S4=4-01_WRD.tex
O4=$(S4:.tex=.pdf)
A4=$(S4:.tex=.aux)
SOURCES=$(S1) $(S2) $(S3) $(S4)
OBJECTS=$(SOURCES:.tex=.pdf)
AUX=$(SOURCES:.tex=.aux)
EXECUTABLE=DA.pdf

all: $(SOURCES) $(AUX) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(PDFTK) $(OBJECTS) cat output $(EXECUTABLE)
	
$(O1): $(S1) $(A1) abbr.tex general.tex
	$(TEX) $(S1)
$(O2): $(S2) $(A2)
	$(TEX) $(S2)
$(O3): $(S3) $(A3) app-din-13155.tex
	$(TEX) $(S3)
$(O4): $(S4) $(A4) img_einsatzablauf.tex
	$(TEX) $(S4)
	
$(A1): $(S1)
	$(TEX) $(S1)
$(A2): $(S2)
	$(TEX) $(S2)
$(A3): $(S3)
	$(TEX) $(S3)
$(A4): $(S4)
	$(TEX) $(S4)

clean: 
	rm $(OBJECTS) $(EXECUTABLE)