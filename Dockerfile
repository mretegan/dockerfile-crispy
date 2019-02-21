# DOCKER-VERSION 1.0

FROM mretegan/x11:latest
MAINTAINER marius.retegan@esrf.fr

# Install Python dependencies 
RUN apt-get update && apt-get install -y \
  python3-pip \
  python3-numpy \
  python3-h5py \
  python3-matplotlib \
  python3-opengl \
  python3-pyqt5 \
  python3-pyqt5.qtopengl \
  python3-pyqt5.qtsvg \
  python3-six && \
  apt-get clean

# Install fabio
RUN pip3 install fabio

# Install silx
RUN pip3 install silx==0.9.0

# Install crispy
RUN pip3 install --upgrade --no-deps https://github.com/mretegan/crispy/tarball/master

# Add Quanty's folder to $PATH
RUN echo "export PATH=/opt/quanty:${PATH}" > /etc/profile.d/quanty.sh

# Add supporting files (directory at a time to improve build speed)
COPY etc /etc
COPY var /var
COPY opt /opt
