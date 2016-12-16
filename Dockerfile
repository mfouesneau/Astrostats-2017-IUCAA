FROM andrewosh/binder-base:latest

USER root
# Install R kernel to Jupyter notebook
RUN apt-get update
RUN conda install -y -c r ipython-notebook r-irkernel
RUN apt-get clean

USER main
