# Project Agents.md Guide

This is a [MoonBit](https://docs.moonbitlang.com) project.

## Project Structure

- MoonBit packages are organized per directory, for each directory, there is a
  `moon.pkg.json` file listing its dependencies. Each package has its files and
  blackbox test files (common, ending in `_test.mbt`) and whitebox test files
  (ending in `_wbtest.mbt`).

- In the toplevel directory, this is a `moon.mod.json` file listing about the
  module and some meta information.

## Coding convention

- MoonBit code is organized in block style, each block is separated by `///|`,
  the order of each block is irrelevant. In some refactorings, you can process
  block by block independently.

- Try to keep deprecated blocks in file called `deprecated.mbt` in each
  directory.

## Tooling

- `moon fmt` is used to format your code properly.

- `moon info` is used to update the generated interface of the package, each
  package has a generated interface file `.mbti`, it is a brief formal
  description of the package. If nothing in `.mbti` changes, this means your
  change does not bring the visible changes to the external package users, it is
  typically a safe refactoring.

- In the last step, run `moon info && moon fmt` to update the interface and
  format the code. Check the diffs of `.mbti` file to see if the changes are
  expected.

- Run `moon test` to check the test is passed. MoonBit supports snapshot
  testing, so when your changes indeed change the behavior of the code, you
  should run `moon test --update` to update the snapshot.

- You can run `moon check` to check the code is linted correctly.

- When writing tests, you are encouraged to use `inspect` and run
  `moon test --update` to update the snapshots, only use assertions like
  `assert_eq` when you are in some loops where each snapshot may vary. You can
  use `moon coverage analyze > uncovered.log` to see which parts of your code
  are not covered by tests.

- agent-todo.md has some small tasks that are easy for AI to pick up, agent is
  welcome to finish the tasks and check the box when you are done

## Project Overview

Zjin(辰) is a LoongArch emulator written in MoonBit. The project aims to emulate the LoongArch instruction set architecture, providing a platform for running LoongArch binaries on other architectures.

### Key Components

- **CPU Module (`cpu.mbt`)**: Implements the core CPU state and functionality, including register access, program counter management, instruction fetching and execution.
- **Bus Module (`bus.mbt`)**: Manages communication between different hardware components, handling load and store operations.
- **RAM Module (`ram.mbt`)**: Implements the random access memory for the emulator, providing storage for data and instructions.
- **MMU Module (`mmu.mbt`)**: Implements the memory management unit, handling virtual-to-physical address translation and TLB management.
- **CSR Module (`csr.mbt`)**: Implements the control and status registers for the CPU, managing system-level functionality.
- **Instructions Module (`instructions.mbt`)**: Contains instruction decoding logic and data structures for different instruction formats.
- **LA32 Base Module (`la32_base.mbt`)**: Implements the core LA32 (LoongArch 32-bit) instructions and their execution.
- **LA32 Base Execution Module (`la32_base_exec.mbt`)**: Contains execution functions for LA32 instructions.
- **Utilities Module (`utils.mbt`)**: Provides utility functions for bit manipulation, sign extension, and other common operations.

### Project Structure

```
src/
├── cpu.mbt          # CPU state and execution
├── bus.mbt          # System bus implementation
├── ram.mbt          # RAM implementation
├── mmu.mbt          # Memory management unit
├── csr.mbt          # Control and status registers
├── instructions.mbt # Instruction decoding
├── la32_base.mbt    # LA32 instruction implementations
├── la32_base_exec.mbt # LA32 execution functions
├── utils.mbt        # Utility functions
├── main.mbt         # Entry point
├── *.mbt            # Additional modules
├── *_test.mbt       # Blackbox tests
├── *_wbtest.mbt     # Whitebox tests
└── moon.pkg.json    # Package dependencies
```
