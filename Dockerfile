from gsiupm/senpy:0.6.2-python2.7

RUN apt-get update
RUN apt-get -y install libopenblas-dev
RUN apt-get -y install gfortran
RUN apt-get -y install libxml2-dev libxslt1-dev python-dev

ADD requirements.txt /senpy-plugins/
RUN pip install -r /senpy-plugins/requirements.txt

RUN python -m nltk.downloader stopwords
RUN python -m nltk.downloader punkt
RUN python -m nltk.downloader maxent_treebank_pos_tagger
RUN python -m nltk.downloader wordnet
RUN python -m nltk.downloader omw
RUN python -m nltk.downloader averaged_perceptron_tagger

ADD /enterprise /senpy-plugins/enterprise
ADD /community /senpy-plugins/community

WORKDIR /usr/src/app/

ENTRYPOINT ["python", "-m", "senpy", "-f", "/senpy-plugins", "--host", "0.0.0.0"]
