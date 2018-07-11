# creating simple flask app over alpine image .

FROM alpine:latest

# selecting alpine latest image .

RUN apk add --no-cache-dir py2-pip

# installing pip for python 2.

WORKDIR /usr/share/app

COPY . .
# coping everything in the current directory to alpine image .

RUN pip -install --upgrade pip \
&& pip -install  --no-cache-dir -r requirements.txt

# upgrading pip to latest version.



# coping everything in the current directory to alpine image .

EXPOSE 5000

CMD ["python","app.py"]