FROM python:3.6.8

#ENV http_proxy http://70.10.15.10:8080
#ENV https_proxy http://70.10.15.10:8080
RUN apt-get update && apt-get -o Acquire::BrokenProxy="true" -o Acquire::http::No-Cache="true" -o Acquire::http::Pipeline-Depth="0" install -y libgl1-mesa-glx
#RUN apt-get update -o Acquire::http::proxy="http://70.10.15.10:8080" && apt-get -o Acquire::http::proxy="http://70.10.15.10:8080" -o Acquire::BrokenProxy="true" -o Acquire::http::No-Cache="true" -o Acquire::http::Pipeline-Depth="0" install -y libgl1-mesa-glx

ADD requirements.txt /

RUN pip install --upgrade pip

RUN pip install wheel
RUN pip install numpy-1.18.4-cp36-cp36m-manylinux1_x86_64
RUN pip install pandas-1.1.4-cp36-cp36m-manylinux1_x86_64
RUN pip install Pillow-8.0.1-cp36-cp36m-manylinux1_x86_64
RUN pip install imageio-2.9.0-py3-none-any.whl
RUN pip install matplotlib-3.3.3-cp36-cp36m-manylinux1_x86_64
RUN pip install grpcio-1.34.0-cp36-cp36m-manylinux2010_x86_64
RUN pip install tensorboard-2.4.0-py3-none-any
RUN pip install h5py-2.10.0-cp36-cp36m-manylinux1_x86_64
RUN pip install tensorflow-2.3.1-cp36-cp36m-manylinux2010_x86_64 
RUN pip install opencv_python-4.4.0.46-cp36-cp36m-manylinux2014_x86_64
RUN pip install scipy-1.5.4-cp36-cp36m-manylinux1_x86_64
RUN pip install PyWavelets-1.1.1-cp36-cp36m-manylinux1_x86_64
RUN pip install scikit_image-0.17.2-cp36-cp36m-manylinux1_x86_64

RUN pip install -r /requirements.txt
#RUN pip install --upgrade pip
#RUN pip install -r /requirements.txt

#ADD . /app
WORKDIR /app

EXPOSE 5000
#CMD [ "python" , "app.py", "0.0.0.0:5000"]
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000", "--workers", "4", "--threads", "2"]
