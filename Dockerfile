FROM alpine:3.19

# 安裝系統依賴
RUN apk add --no-cache curl gcc g++ git build-base \
  && curl https://nim-lang.org/choosenim/init.sh -sSf | sh -s -- -y

# 設定 PATH（讓 nim/nimble 可用）
ENV PATH="/root/.nimble/bin:/root/.choosenim:/root/.nimble/bin:$PATH"

# 建立工作目錄
WORKDIR /app

# 複製 repo 原始碼（避免 git clone 出錯）
COPY . .

# 編譯
RUN nimble build -y

# 預設啟動指令
CMD ["./nitter"]
