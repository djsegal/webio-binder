FROM jupyter/scipy-notebook:cf6258237ff9

RUN pip install --no-cache-dir notebook==5.*

ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

USER root

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
RUN chown -R ${NB_UID} ${HOME}
RUN npm cache clean -f
RUN npm install -g n
RUN n stable
USER ${NB_USER}
