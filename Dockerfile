FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y cmake g++ && \
    rm -rf /var/lib/apt/lists/*

# Copy the project files
WORKDIR /app
COPY . .

# Build the application in Release mode
RUN cmake -DCMAKE_BUILD_TYPE=Release -S . -B build_dir && \
    cmake --build build_dir

# Set the executable as entrypoint
ENTRYPOINT ["./build_dir/hello_main"]
