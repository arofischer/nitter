FROM ubuntu:22.04

# 安裝基本工具與建置依賴
RUN apt-get update && \
    apt-get install -y curl git build-essential gcc g++ && \
    curl https://nim-lang.org/choosenim/init.sh -sSf | sh -s -- -y

# 設定 PATH，讓 nim 和 nimble 可以執行
ENV PATH="/root/.nimble/bin:/root/.choosenim:/root/.choosenim/current/bin:$PATH"

# 建立工作目錄
WORKDIR /app

# 複製所有原始碼進入容器
COPY . .

# 編譯
RUN nimble build -y

# 開放埠
EXPOSE 8080

# 啟動服務
CMD ["./nitter"]
