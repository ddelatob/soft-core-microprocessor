CC = iverilog

FLAGS = -g2012 -Irtl

RTL_FILES = $(shell find rtl -name "*.v")
TB_FILE = tb/tb_bitwise_gates/tb_bitwise_and.v
TARGET = sim.out

.PHONY: all clean compile run

all: clean compile run

compile:
	$(CC) $(FLAGS) -o $(TARGET) $(RTL_FILES) $(TB_FILE)

run:
	./$(TARGET)

clean:
	rm -f $(TARGET) *.out