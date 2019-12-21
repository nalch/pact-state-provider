pact-state-provider
=======================

> Simple server to provide an endpoint used by pact to generate a provider state

Usage
-----

Installation
************
1. Install the package::

    pip install pact_state_provider


Development
-----------

Makefile
********

This project uses a Makefile for various tasks. Some of the available tasks
are listed below.

* `make clean` - Clean build artifacts out of your project
* `make test` - Run Tests
* `make plain-test` - Run Tests without rebuilding the project
* `make sdist` - Build a Python source distribution
* `make docs` - Build the Sphinx documentation
* `make lint` - Get a codestyle report about your code
* `make plain-lint` - Get a codestyle report without rebuilding the project
* `make` - Equivalent to `make test lint docs sdist`
