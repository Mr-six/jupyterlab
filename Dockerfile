FROM python:3.7

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  apt-get upgrade -y && \
  apt-get install -y nodejs texlive-latex-extra texlive-xetex git curl zsh && \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
  rm -rf /var/lib/apt/lists/* && \
  pip install --upgrade pip && \
  pip install --upgrade \
    jupyterlab==1.2.6 \
    ipywidgets \
    jupyterlab_latex \
    plotly \
    bokeh \
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
    @jupyter-widgets/jupyterlab-manager \
    @oriolmirosa/jupyterlab_materialdarker \
    @jupyterlab/latex \
    jupyterlab-drawio \ 
    jupyterlab-plotly \
    @bokeh/jupyter_bokeh \
    @jupyterlab/git \
    @mflevine/jupyterlab_html \
    jupyterlab-spreadsheet 

COPY bin/entrypoint.sh /usr/local/bin/
COPY config/ /root/.jupyter/

EXPOSE 8888
VOLUME /notebooks
WORKDIR /notebooks
ENTRYPOINT ["entrypoint.sh"]
