from gsi-upm/senpy-deps

ADD /enterprise/requirements.txt /senpy-plugins/enterprise/requirements.txt

RUN pip install -r /senpy-plugins/enterprise/requirements.txt

ADD senpy/requirements.txt /usr/src/app/requirements.txt

RUN pip install -r /usr/src/app/requirements.txt

ADD /enterprise /senpy-plugins/enterprise
ADD /community /senpy-plugins/community

ADD /senpy /usr/src/app

ENTRYPOINT ["python", "-m", "senpy", "-f", "/senpy-plugins", "--host", "0.0.0.0"]
