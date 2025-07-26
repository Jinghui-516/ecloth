from transformers import pipeline

# 加載模型（這裡是 GPT-2 模型）
generator = pipeline("text-generation", model="gpt2")

# 生成文本
output = generator("Hello, Hugging Face!", max_length=30)

# 輸出結果
print(output)
