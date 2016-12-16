FROM andrewosh/binder-base:latest

RUN mkdir /home/main/notebooks
RUN chown main:main /home/main/notebooks
WORKDIR /home/main/notebooks
USER root
COPY . /home/main/notebooks/
RUN chown -R main:main $HOME/notebooks
# Install R kernel to Jupyter notebook
RUN conda install -y -c r ipython-notebook r-irkernel
USER main

RUN find $HOME/notebooks -name '*.ipynb' -exec jupyter trust {} \;




USER main
WORKDIR $HOME/notebooks
