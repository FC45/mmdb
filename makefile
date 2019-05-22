CC = gcc
SRCS  = $(shell find ./src     -type f -name *.c)
HEADS = $(shell find ./include -type f -name *.h)
OBJS = $(SRCS:.c=.o)
TARGET_LIB = libmmdb.so

INCLUDES = -I./include
CFLAGS = -g -fPIC $(INCLUDES)
LDFLAGS = -shared

all: $(TARGET_LIB)

$(TARGET_LIB): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

run: all
	@./$(TARGET)

clean:
	$(RM) $(OBJS) $(TARGET_LIB)

