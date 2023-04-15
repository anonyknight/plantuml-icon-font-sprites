CC=java -jar ./src/assets/bin/plantuml.jar

PUML_SOURCES_DIR := $(shell find -maxdepth 1 -type d -not \( -path ./src -prune \) -not \( -path ./.git -prune \))

SVG_FLAGS :=-tsvg
PNG_FLAGS :=-tpng

all: svg png

svg: 
	$(foreach folder, $(PUML_SOURCES_DIR), $(CC) $(folder)/*.puml $(SVG_FLAGS);)

png:
	$(foreach folder, $(PUML_SOURCES_DIR), $(CC) $(folder)/*.puml $(PNG_FLAGS);)

clean:
	rm -rf */*.svg
	# rm -rf */*.png