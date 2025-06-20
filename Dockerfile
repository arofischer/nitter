FROM ubuntu:22.04

# 安裝系統相依套件與 nim/nimble
RUN apt-get update && apt-get install -y \
  curl git build-essential nim

# 設定工作目錄
WORKDIR /app

# 複製 repo 原始碼
COPY . .

# 編譯 Nitter
RUN nimble build -y

# 啟用埠號
EXPOSE 8080

# 啟動服務
CMD ["./nitter"]
