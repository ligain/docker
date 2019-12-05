FROM linder/custom-alpine-python38:0.1

ENV SANIC_HOST="0.0.0.0"
ENV SANIC_PORT="8081"

WORKDIR /app

COPY app.py .

RUN apk add build-base libffi && pip3 install sanic

EXPOSE ${SANIC_PORT}

CMD ["python3", "app.py"]
