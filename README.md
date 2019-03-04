# CG2028
### To compile and run .asm using intel syntax + MacOSX compiler

```bash
$ nasm -f macho64 helloworld.asm && ld -macosx_version_min 10.7.0 -lSystem -o helloworld.out helloworld.o && ./helloworld.out
```
