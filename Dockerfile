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

EXPOSE 3000
CMD ["./webapp"]
