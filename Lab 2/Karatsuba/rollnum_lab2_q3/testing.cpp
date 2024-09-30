#include <bits/stdc++.h>
#include <assert.h>
using namespace std;

int main() {
    const int maxValue = 255;
    ifstream inputFile("result.txt");
    assert(inputFile.is_open() && "File result.txt could not be opened!");

    unsigned long long x, y, product;
    string z;
    for (unsigned int i = 0; i < 65536 && inputFile >> x >> y >> z; i++) {
        product = x * y;
        bitset<32> binaryProduct(product);
        bitset<32> binaryZ;
        for (int i = 0; i < 32; i++) {
            binaryZ[31-i] = z[i] - '0';
        }
        assert(binaryProduct == binaryZ);
    }

    inputFile.close();
    cout << "All assertions passed!" << endl;

    return 0;
}
