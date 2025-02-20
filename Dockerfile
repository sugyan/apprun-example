# Build
FROM rust:1.84.1-slim-bullseye AS builder

WORKDIR /app
RUN rustup target add x86_64-unknown-linux-musl

COPY Cargo.toml Cargo.lock ./
RUN cargo fetch --locked

COPY src ./src
RUN cargo build --release --target=x86_64-unknown-linux-musl

# Run
FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/webapp /app/webapp

ARG IMAGE_CREATED
ARG IMAGE_REVISION
ARG IMAGE_BRANCH

ENV IMAGE_CREATED="${IMAGE_CREATED}"
ENV IMAGE_REVISION="${IMAGE_REVISION}"
ENV IMAGE_BRANCH="${IMAGE_BRANCH}"

EXPOSE 3000
CMD ["./webapp"]
