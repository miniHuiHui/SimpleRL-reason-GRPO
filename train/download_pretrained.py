from huggingface_hub import snapshot_download

# 指定下载目录
custom_cache_dir = "/home/csgrad/cxu26/simpleRL-reason/model_hub/"

# 下载模型到指定目录
snapshot_path = snapshot_download(
    repo_id="Qwen/Qwen2.5-Math-1.5B",
    cache_dir=custom_cache_dir
)

print(f"模型已下载到: {snapshot_path}")