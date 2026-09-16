# Open Symbolic Rules (OSR) - Algebra Module

This repository is the **Algebra Module** of the [OpenSymbolicRules](https://github.com/OpenSymbolicRules) standard.

It provides a universal, language-agnostic JSON format for general algebraic simplifications, rewriting, and polynomial manipulations.

## Overview

Unlike integration rules which are highly specialized, the algebraic rules serve as the foundation for any Computer Algebra System (CAS). 
By defining algebraic rules in this format, and linking semantics directly to **OpenMath**, we ensure flawless translation of core mathematics into CAS environments like Julia (Symbolics.jl), Python (SymPy), and beyond.

## Structure

- `rules/`: Algebraic rewriting rules in JSON format
- `tests/`: Test fixtures to validate correct simplifications
- `Specification/`: Submodule pointing to the core OSR JSON schemas

Every mathematical operator is mapped to an OpenMath Content Dictionary symbol in
the rule file's `semantics` object.

## License

This repository is licensed under the [MIT License](LICENSE). OpenMath
identifiers are referenced for semantic interoperability; see [NOTICE.md](NOTICE.md).
