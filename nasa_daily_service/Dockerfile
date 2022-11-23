FROM dart:2.18.4 as builder
COPY . /nasa_daily_service

WORKDIR /nasa_daily_service
RUN mkdir builds

RUN dart pub get
RUN dart compile exe ./bin/nasa_daily_service.dart -o ./builds/nasa_daily_service

FROM scratch
COPY --from=builder /nasa_daily_service/builds /bin
COPY --from=builder /runtime/ /

CMD ["nasa_daily_service"]