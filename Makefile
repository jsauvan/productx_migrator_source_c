# Variables
CC = gcc
CFLAGS = -Wall -g
SOURCES = main.c utils.c
OBJECTS = $(SOURCES:.c=.o)
TARGET = mon_programme

# Règle par défaut
all: $(TARGET)

# Lien de l'exécutable
# $@ -> $(TARGET)
# $^ -> $(OBJECTS)
$(TARGET): $(OBJECTS)
    $(CC) -o $@ $^

# Compilation des fichiers .c en .o
# $< -> Premier element des pr
%.o: %.c
    $(CC) $(CFLAGS) -c $< -o $@

# Déclaration des cibles phony
.PHONY: all clean fclean re

# Nettoyage des fichiers objets
clean:
    rm -f $(OBJECTS)

# Nettoyage complet (fichiers objets et exécutable)
fclean: clean
    rm -f $(TARGET)

# Refaire la compilation
re: fclean all