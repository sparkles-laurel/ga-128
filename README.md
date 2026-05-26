# Gayest Architecture - 128

A 128-bit CPU architecture implemented only using NOR gates

# What the fuck is this?

This is an Instruction Set Architecture designed to prove Sparkles' Clockwork
Theorem: 
$$\left|\frac{\partial{T\text{exec}}}{\partial{f_c}}\right|
= \frac{\chi{N\text{red}}}{{f_c}^2}, \chi = \frac{k}{r}, r =
r\left(\left|\text{ISA}\right|\right), \frac{d{r}}{d{\left|\text{ISA}\right|}}
\gt 0$$

which states that the sensitivity of execution time to changes in clock rate
is inversely proportional to the size of the ISA.

This is useful especially for experimenting with building CPUs from newly
discovered materials like graphene, and potentially building the future of
high speed computing.

# Development

## Dependencies
## Dependencies

Required tools:

- `make` (build tool)
- `iverilog` (Icarus Verilog simulator)
- `expect` (test runner used by `make test`)

Install examples:

Debian / Ubuntu:
```sh
sudo apt update
sudo apt install make iverilog expect
```

Fedora:
```sh
sudo dnf install make iverilog expect
```

Arch Linux:
```sh
sudo pacman -Syu
sudo pacman -S base-devel iverilog expect
```

openSUSE:
```sh
sudo zypper install make iverilog expect
```

macOS (Homebrew):
```sh
brew install icarus-verilog expect
```

Windows:
- Recommended: use WSL and follow the Debian/Ubuntu steps, or use Chocolatey:
```powershell
choco install make iverilog expect
```

After installing dependencies, run the full simulation test suite with:

```sh
make test
```

VCD output files are written to `out/vcd/` by the testbenches (the Makefile will create this directory).
