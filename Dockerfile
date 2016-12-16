FROM andrewosh/binder-base:latest

RUN mkdir /home/main/notebooks
RUN chown main:main /home/main/notebooks
WORKDIR /home/main/notebooks
USER root
COPY . /home/main/notebooks/
RUN chown -R main:main $HOME/notebooks
# Install R kernel to Jupyter notebook
RUN apt-get update
RUN conda install -y -c r ipython-notebook r-irkernel
RUN apt-get install -y julia libnettle4 
RUN apt-get clean

USER main
# Install Julia kernel
RUN julia -e 'Pkg.add("IJulia")'
RUN julia -e 'Pkg.add("Gadfly")' && julia -e 'Pkg.add("RDatasets")
RUN find $HOME/notebooks -name '*.ipynb' -exec jupyter trust {} \;

WORKDIR $HOME/notebooks
