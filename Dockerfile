# 使用 Python 3.10 瘦身版映像
FROM python:3.10-slim

# 安裝系統必要的套件（OpenCV 與 MediaPipe 會用到）
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# 設定工作目錄
WORKDIR /app

# 複製專案檔案到容器中
COPY . /app

# 安裝 Python 套件
RUN pip install --no-cache-dir -r requirements.txt

# 設定環境變數（Flask 監聽正確的 port 與介面）
ENV PORT=7860
ENV FLASK_RUN_PORT=$PORT
ENV FLASK_RUN_HOST=0.0.0.0

# 啟動 Flask 應用
CMD ["python", "app.py"]
