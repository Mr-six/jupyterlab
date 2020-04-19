FROM python:3.8

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  apt-get upgrade -y && \
  apt-get install -y nodejs texlive-latex-extra texlive-xetex git curl zsh && \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
  rm -rf /var/lib/apt/lists/* && \
  pip install --upgrade pip && \
  pip install --upgrade \
    jupyterlab \
    ipywidgets \
    plotly \
    numpy \
    scipy \
    numexpr \
    patsy \
    scikit-learn \
    scikit-image \
    matplotlib \
    ipython \
    pandas \
    sympy \
    seaborn \
    nose \
    jupyterlab-git && \
  jupyter labextension install \
    @jupyter-widgets/jupyterlab-manager@2.0 \
    jupyterlab-drawio \ 
    jupyterlab-plotly \
    jupyterlab-spreadsheet && \
  jupyter lab build

COPY bin/entrypoint.sh /usr/local/bin/
COPY config/ /root/.jupyter/

EXPOSE 8888
VOLUME /notebooks
WORKDIR /notebooks
ENTRYPOINT ["entrypoint.sh"]
