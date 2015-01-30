Not including the actual lab because, well, you should do it yourself.

But here's something you may find helpful for testing.

Add `testlab2.asm` to your `LAB2` folder and assemble it.
Add `runtestlab2` to your `LAB2` folder.

Before you halt in `lab2.asm`, add

```
LD R0, ADDR ; ADDR is a label pointing to x5000
TRAP x22
```

Then simply run
```
lc3sim -s runtestlab2
```

Somewhere in what it prints, you should see a line that reads
```
Uryyb Jbeyq   ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz
```

That's all. Happy coding!

Oh, and you should probably remember to comment out those two lines you added to `lab2.asm` before you commit.
