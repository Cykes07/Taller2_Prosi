# Variables
CC = gcc
CFLAGS = -Wall -g
TARGET = programa
OBJS = main.o persona.o institucion.o reporte.o

all: $(TARGET)

# Ejecutable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

# Compila
main.o: main.c miLibPersona.h miLibInstitucion.h miReporte.h
	$(CC) $(CFLAGS) -c main.c

persona.o: persona.c miLibPersona.h miLibInstitucion.h
	$(CC) $(CFLAGS) -c persona.c

institucion.o: institucion.c miLibPersona.h miLibInstitucion.h
	$(CC) $(CFLAGS) -c institucion.c

reporte.o: reporte.c miLibPersona.h miLibInstitucion.h miReporte.h
	$(CC) $(CFLAGS) -c reporte.c

# Limpia archivos 
clean:
	rm -f $(OBJS) $(TARGET)

# Limpia todo
clean-all: clean
	rm -f *~ *.bak
