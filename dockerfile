FROM ubuntu

COPY /scripts/helloWorld.sh .

RUN chmod +x ./helloWorld.sh

ENTRYPOINT ["./helloWorld.sh"]
