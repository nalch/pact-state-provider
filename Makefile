all: test lint docs

test: dev_reqs build plain-test plain-lint

env:
	pipenv install

dev_reqs: env
	pipenv sync --dev

build_reqs: env
	pipenv sync

plain-test:
	pipenv run pytest -n auto --cov-report term-missing --cov-report xml --junitxml test_results.xml --cov=pact_state_provider

plain-lint:
	pipenv run pydocstyle src/
	pipenv run isort --recursive src/ tests
	pipenv run unify -i -r src/ tests
	pipenv run flake8 src/ tests
	pipenv run mypy --ignore-missing-imports src/
	pipenv run pytype src/

build: build_reqs
	pipenv run pip install --editable .

sdist: build_reqs
	pipenv run python setup.py sdist

lint: dev_reqs build plain-lint

docs: dev_reqs
	pipenv run $(MAKE) -C docs html

shell:
	pipenv run ipython

clean:
	# - @rm -rf docs/build
	- @rm -rf src/*.egg-info
	- @rm -f .coverage
	- @rm -f test_results.xml
	- @rm -f coverage.xml
	- @rm -rf .mypy_cache
	- @rm -rf .pytest_cache
	- @rm -rf .pytype
	- @find ./src ./docs -name '*.pyc' | xargs -r rm
	- pipenv --rm
