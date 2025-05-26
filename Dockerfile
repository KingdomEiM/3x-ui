FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    iptables \
    iproute2 \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# دانلود اسکریپت نصب و دادن دسترسی اجرایی
RUN curl -Ls https://raw.githubusercontent.com/KingdomEiM/3x-ui/main/install.sh -o install.sh \
    && chmod +x install.sh

# اجرای نصب به صورت مستقیم (در صورت وجود systemctl، اون خطوط رو در install.sh حذف کن)
RUN bash install.sh

EXPOSE 54321 2053 8443 80

CMD ["x-ui", "start"]
