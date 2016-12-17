FROM andrewosh/binder-base:latest

USER root
# Install R kernel to Jupyter notebook
RUN apt-get update
RUN apt-get install -y r-base libzmq3-dev
RUN apt-get clean

COPY install-irkernel.R /home/install-irkernel.R
RUN R --no-save < /home/install-irkernel.R

USER main
