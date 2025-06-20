FROM ubuntu:22.04

# 安裝必要工具與建置依賴
RUN apt-get update && \
    apt-get install -y curl git build-essential gcc g++ libssl-dev pkg-config && \
    curl https://nim-lang.org/choosenim/init.sh -sSf | sh -s -- -y && \
    rm -rf /var/lib/apt/lists/*

# 設定 PATH，讓 nim 和 nimble 可以執行
ENV PATH="/root/.nimble/bin:/root/.choosenim:/root/.choosenim/current/bin:$PATH"

# 建立工作目錄
WORKDIR /app

# 複製所有原始碼（包括 sessions.json）到容器中
COPY . .
COPY sessions.json ./sessions.json

# 編譯
RUN nimble build -y

# 開放埠（nitter 預設為 8080）
EXPOSE 8080

# 啟動服務
CMD ["./nitter"]
