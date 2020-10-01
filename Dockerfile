FROM python:3.6.8
RUN mkdir -p /app
WORKDIR /app

# Copy application requirements file
COPY requirements.txt /app

#Install wheel
RUN python -m pip install https://files.pythonhosted.org/packages/a7/00/3df031b3ecd5444d572141321537080b40c1c25e1caa3d86cdd12e5e919c/wheel-0.35.1-py2.py3-none-any.whl
#install basic libraries
RUN pip install --upgrade pip cmake make cython boost numpy scipy opencv-python opencv-contrib-python matplotlib pandas pillow

#Install dlib
RUN python -m pip install https://files.pythonhosted.org/packages/0e/ce/f8a3cff33ac03a8219768f0694c5d703c8e037e6aba2e865f9bae22ed63c/dlib-19.8.1-cp36-cp36m-win_amd64.whl#sha256=794994fa2c54e7776659fddb148363a5556468a6d5d46be8dad311722d54bfcf

#Install face_recognition
RUN pip install face_recognition

#Install application requirements
RUN pip install -r requirements.txt

CMD ["python","app.py"]
