# ASMPrintf
I will recode printf in asm

## Description

I'm learning ASM, and for my training, I would like to recode printf

but with almost modifications :

* **6** max parameters (without originel string)
* **%** of base, so -> %d %s %c %i %b (the last one is for the fun)
* He return void

## Requirements

* Linux (Important but no must)
* nasm
* ld

## Run the project

For beginin, you need pull this repo :

```
git clone git@github.com:Shirosaaki/ASMPrintf.git && cd ASMPrintf
```

After, you need run :

```
make
```

A library will be created when the compilation is done

After this, you can use **asmprintf** in your code, for exemple in **C** :

```
/*
** SOME HEADER
*/
#include ...
#include ...

void asmprintf(char *str, ...);

int main(void)
{
  asmprintf("If this %s work, 1 = %d\nSo all is good\n", "exemple", 1);
  return 0;
}
```
