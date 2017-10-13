COMPILER  = g++
CFLAGS    = -std=c++11 -MMD -MP -Wall -Wextra -Winit-self -Wno-missing-field-initializers -g
ifeq "$(shell getconf LONG_BIT)" "64"
  LDFLAGS =
else
  LDFLAGS =
endif

LIBS      =
INCLUDE   = -iquote ./include
SRC_DIR   = ./source
ifeq "$(strip $(SRC_DIR))" ""
  SRC_DIR = .
endif
OBJ_DIR   = ./obj
ifeq "$(strip $(OBJ_DIR))" ""	
  OBJ_DIR = .
endif

TARGET    = ./bin/$(shell basename `readlink -f .`)
SOURCES   = $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS   = $(addprefix $(OBJ_DIR)/, $(notdir $(SOURCES:.cpp=.o)))
DEPENDS   = $(OBJECTS:.o=.d)

$(TARGET): $(OBJECTS) $(LIBS)
	$(COMPILER) -o $@ $^ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	-mkdir -p $(OBJ_DIR)
	$(COMPILER) $(CFLAGS) $(INCLUDE) -o $@ -c $< 

all: clean $(TARGET)

clean:
	-rm -f $(OBJECTS) $(DEPENDS) $(TARGET)

-include $(DEPENDS)
