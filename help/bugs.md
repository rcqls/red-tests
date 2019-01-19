## Notes on amazing behavior 

1. When using draw dialect use lowercase. Otherwise, it would launch a script error

```{bash}
Script Error: invalid Draw dialect input at: [Radial 25x25 0 15 0 1.0 1.0 red green blue box 10x10 40x40]
```

This same code run perfectly when interpreted but for compilation it should need to be:

```{bash}
[Radial 25x25 0 15 0 1.0 1.0 red green blue box 10x10 40x40]
```