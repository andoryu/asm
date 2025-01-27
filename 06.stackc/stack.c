#include <stdio.h>

#define BYTECODE_MASK 0x0000ffffffffffff

#define PUSH_INT 0x0001000000000000

int main(void) {
    long stack[1024];
    long *sp = &stack[1024];

    printf("initial stack pointer = 0x%p\n", sp);

    long ip, a, b;

    long count = 10000000;

    while(1) {

        ip = PUSH_INT + 100;
        sp--;
        *sp = ip & BYTECODE_MASK;
        // printf("stack pointer = 0x%p\n", sp);

        ip = PUSH_INT + 200;
        sp--;
        *sp = ip & BYTECODE_MASK;
        // printf("stack pointer = 0x%p\n", sp);

        //perform add
        a = *sp;
        sp++;
        b = *sp;
        sp++;

        sp--;
        *sp = a+b;

        //perform pop and then display
        a = *sp;
        sp++;

        count--;
        if(count==0)
            break;
    }

    printf("a = %ld\n", a);
    printf("stack pointer = 0x%p\n", sp);
}
