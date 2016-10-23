FROM dparnell/minimal-sbcl:latest

RUN mkdir /hello-world

WORKDIR /hello-world

RUN sbcl --eval '(ql:quickload "hunchentoot")' --eval '(quit)'

COPY hello-world.lisp .

RUN sbcl --load hello-world.lisp

EXPOSE 8080

CMD /hello-world/hello-world
