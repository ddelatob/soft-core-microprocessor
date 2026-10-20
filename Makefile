CC = iverilog

FLAGS = -g2012 -Irtl

RTL_FILES = $(shell find rtl -name "*.v")
TB_FILE = tb/tb_fanouts/tb_fanout.v
TARGET = sim.out

.PHONY: all clean compile run

all: clean compile run

compile:
	$(CC) $(FLAGS) -o $(TARGET) $(RTL_FILES) $(TB_FILE)

run:
	./$(TARGET)

clean:
	rm -f $(TARGET) *.out