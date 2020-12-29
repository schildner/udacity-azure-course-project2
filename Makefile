setup:
	python3 -m venv ~/.azure-devops
	source ~/.azure-devops/bin/activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv --cov=myrepolib test_hello.py
	#python -m pytest --nbval notebook.ipynb

lint:
	pylint --disable=R,C,W1203,W0702 app.py

all: install lint test
