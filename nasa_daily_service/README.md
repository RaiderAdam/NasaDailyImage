Usage:\
ipaddress:8080/YYYY-MM-DD \
Return: url \
\
Local docker build and run testing\
- docker build -t adamlang/nasa_daily_service . \
- docker run --init -p 8080:8080 adamlang/nasa_daily_service \
- curl localhost:8080/2020-11-02 \
