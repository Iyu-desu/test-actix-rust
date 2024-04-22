# Use rust base image
FROM rust:1.77.2 as builder

# Set the working directory
WORKDIR /app

# Copy the entire project
COPY . .


# Build the application
RUN cargo build --release

# Second stage for a smaller image
FROM alpine:3.19

# Set the working directory
WORKDIR /app
# Copy the built binary from the builder stage
COPY --from=builder /app/target/release/hello-world .

# Expose port
EXPOSE 8080

# Command to run the application
CMD ["./hello-world"]
