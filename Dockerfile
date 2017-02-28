from gsiupm/senpy:0.8.1-python2.7

RUN python -m nltk.downloader stopwords
RUN python -m nltk.downloader punkt
RUN python -m nltk.downloader maxent_treebank_pos_tagger
RUN python -m nltk.downloader wordnet
RUN python -m nltk.downloader omw
RUN python -m nltk.downloader averaged_perceptron_tagger

ADD /data /data
