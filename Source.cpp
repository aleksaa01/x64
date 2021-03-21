#include <iostream>

extern "C" void Unions(void);

#pragma pack(1)
struct MyStruct {
	char c;   // Offset: 0
	int i;    // Offset: 4
	short s;  // Offset: 8
	double d; // Offset: 16
};            // Total:  24 bytes !

int main() {
	Unions();

	return 0;
}