
HDFS_HOME=/home/csgrad/cxu26/simpleRL-reason
RUN_NAME=Qwen2.5-Math-1.5B_grpo_from_base_math_lv35_re

python3 openrlhf/cli/train_grpo_ray_box.py \
    --ref_num_nodes 1 \
    --ref_num_gpus_per_node 2 \
    --reward_num_nodes 0 \
    --reward_num_gpus_per_node 0 \
    --actor_num_nodes 1 \
    --actor_num_gpus_per_node 2 \
    --vllm_num_engines 2 \
    --vllm_tensor_parallel_size 1 \
    --colocate_actor_ref \
    --pretrain $HDFS_HOME/model_hub/models--Qwen--Qwen2.5-Math-1.5B/snapshots/4a83ca6e4526a4f2da3aa259ec36c259f66b2ab2 \
    --save_path $HDFS_HOME/checkpoints/$RUN_NAME \
    --micro_train_batch_size 2 \
    --train_batch_size 128 \
    --micro_rollout_batch_size 2 \
    --rollout_batch_size 1024 \
    --temperature 0.6 \
    --n_samples_per_prompt 8 \
    --max_samples 100000 \
    --max_epochs 1 \
    --num_episodes 20 \
    --prompt_max_len 1024 \
    --generate_max_len 3000 \
    --init_kl_coef 1e-3 \
    --gamma 1.0 \
    --use_kl_estimator_k3 \
    --use_kl_loss \
    --advantage_estimator group_norm \
    --zero_stage 3 \
    --bf16 \
    --actor_learning_rate 5e-7 \
    --init_kl_coef 0.01 \
    --prompt_data  data/math_level3to5_data_processed_with_qwen_prompt.json \
    --input_key input \
    --normalize_reward \
    --flash_attn \
    --adam_offload \
    --gradient_checkpointing \
    --save_steps 4 \
    --load_checkpoint \
    --use_wandb e63579e35d9d846cb9a2d98e2e6a09a06f660924 \
    --wandb_run_name $RUN_NAME \
    --ckpt_path $HDFS_HOME/checkpoints/$RUN_NAME  \
    --max_ckpt_num 20000