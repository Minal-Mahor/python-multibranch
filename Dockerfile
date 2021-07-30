FROM python:3
ADD app.py /
RUN pip install flask
RUN pip install flask_restful
EXPOSE 5001
CMD [ "python", "./app.py"]