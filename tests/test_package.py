# -*- coding: utf-8 -*-
from pact_state_provider import import_state_func
from pact_state_provider.example import user_exists


def test_import():
    func = import_state_func('pact_state_provider.example', 'user exists')
    assert func == user_exists


def test_missing_import():
    func = import_state_func('missing_module', 'user exists')
    assert func is None

    func = import_state_func('importlib', 'missing')
    assert func is None


def test_example_provider(capsys):
    user_exists('TestClient')
    captured = capsys.readouterr()
    assert captured.out == 'Creating user for TestClient\n'
