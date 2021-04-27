[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/Mr-six/Jupyterlab/blob/master/LICENSE)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/mrsix/jupyterlab)
[![Docker Pulls](https://img.shields.io/docker/pulls/mrsix/jupyterlab.svg)](https://hub.docker.com/r/mrsix/jupyterlab/)

## 插件列表
1. 默认使用 zsh (集成 Oh My Zsh, 以及自动补全和高亮插件)
2. 包含 Python 常用库 numpy, pandas talib 等
3. jupyter-widgets/jupyterlab-manager 可自定义安装插件
4. 默认包含 drawio, plotly



---

### Pull/Update to latest version
```bash
docker pull mrsix/jupyterlab:latest
```

### Run
```bash
docker run --rm -it -p 8888:8888 mrsix/jupyterlab
```

or if you want to define your own password
```bash
docker run --rm -it -p 8888:8888 -e PASSWORD="<your_secret>" mrsix/jupyterlab
```

or use the current directory as source code in the container:
```bash
docker run --rm -it -p 8888:8888 -v $(pwd):/notebooks -e PASSWORD="<your_secret>" mrsix/jupyterlab
```

### Build from source

```bash
docker build -t Mr-six/jupyterlab .
```
