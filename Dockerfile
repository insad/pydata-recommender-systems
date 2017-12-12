FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

# activate hide_code on jupyter
RUN jupyter nbextension install --py hide_code
RUN jupyter nbextension enable --py hide_code
RUN jupyter serverextension enable --py hide_code

# service definitions
EXPOSE 8888

# add /project path to have local packages available in the notebooks
ENV PYTHONPATH /usr/src/app

CMD ["jupyter", "notebook", "--allow-root", "--NotebookApp.ip='*'", "--NotebookApp.open_browser=False"]
