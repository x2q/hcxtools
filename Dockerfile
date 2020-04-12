############################
# STEP 1 build executable binary
############################
FROM alpine:3.7 AS builder
# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache gcc curl-dev make openssl-dev git musl-dev linux-headers

WORKDIR /app

COPY . .

RUN make

############################
# STEP 2 build a small image
############################
#FROM alpine:3.7

# Copy our static executable.
#COPY --from=builder /app /app

# Run the binary.
#ENTRYPOINT ["/app/hcxdumptool"]
