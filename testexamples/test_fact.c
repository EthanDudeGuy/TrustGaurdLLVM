unsigned int n = 999999990;

int main(int argc, char** argv) {    
    unsigned long long result = 1;
    
    if (n == 0 || n == 1) {
        return 1;
    }

    for (unsigned int i = 2; i <= n; i++) {
        result *= i;
    }

    return result;
}

