setup:
	python3 -m venv ~/.azure-devops; \
	. ~/.azure-devops/bin/activate

install:
	. ~/.azure-devops/bin/activate;\
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	. ~/.azure-devops/bin/activate;\
	python -m pytest -vv --cov=.
	#python -m pytest --nbval notebook.ipynb

lint:
	. ~/.azure-devops/bin/activate;\
	pylint --disable=R,C,W1203,W0702 app.py

all: install lint test
