bash sh/eval_single_node.sh \
    --run_name Qwen2.5-Math-1.5B_ppo_from_base_math_lv35  \
    --init_model_path model_hub/models--Qwen--Qwen2.5-Math-1.5B/snapshots/4a83ca6e4526a4f2da3aa259ec36c259f66b2ab2 \
    --template qwen25-math-cot  \
    --tp_size 2