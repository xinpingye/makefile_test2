CC = g++
CFLAGS =
 
TARGET  = app
OBJ_DIR = ./obj
SRC_DIR = ./src
 
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS = $(patsubst $(SRC_DIR)/%.cpp, %.o, $(SRC))
 
#VPATH = $(SRC_DIR)
#vpath %.o $(OBJ_DIR)
 
all: $(TARGET)
 
$(TARGET) : $(OBJECTS)
	echo $(OBJECTS)
	$(CC) -o $@ $(addprefix $(OBJ_DIR)/, $(OBJECTS)) $(CFLAGS)
 
%.o : $(SRC_DIR)/%.cpp
	$(CC) -c $< -o $(OBJ_DIR)/$@

#$(OBJ_DIR)/%.o : $(SRC_DIR)/%.cpp
#	$(CC) -c $< -o $@
.PHONY : clean
clean:
	rm -rf $(TARGET) $(OBJ_DIR)/*.o ./*.o