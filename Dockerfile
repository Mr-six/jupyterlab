FROM python:3.9.4

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  apt-get upgrade -y && \
  apt-get install -y nodejs texlive-latex-extra texlive-xetex git curl zsh && \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
  wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
  tar -xvf ta-lib-0.4.0-src.tar.gz && \
  cd ta-lib/ && \
  ./configure --prefix=/usr && \
  make && \
  make install && \
  cd .. && \
  rm -rf /var/lib/apt/lists/* ta-lib ta-lib-0.4.0-src.tar.gz && \
  pip install --upgrade pip && \
  pip install --upgrade \
    jupyterlab \
    jupyterlab_widgets \
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
    TA-Lib && \
  jupyter labextension install \
    jupyterlab-drawio \ 
    jupyterlab-plotly \
    jupyterlab-spreadsheet && \
  jupyter lab build

COPY bin/entrypoint.sh /usr/local/bin/
COPY bin/.zshrc ~/.zshrc
COPY config/ /root/.jupyter/

EXPOSE 8888
VOLUME /notebooks
WORKDIR /notebooks
ENTRYPOINT ["entrypoint.sh"]
