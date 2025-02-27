# SimpleRL-reason-GRPO

This repo contains GRPO implementation of [SimpleRL-reason](https://github.com/hkust-nlp/simpleRL-reason/). The GRPO implementation is based on [OpenRLHF](https://github.com/OpenRLHF/OpenRLHF).


## Quick Start

### Installation

Our code is implemented based on OpenRLHF. Please follow [OpenRLHF's guidance](https://github.com/OpenRLHF/OpenRLHF/tree/main?tab=readme-ov-file#installation) to configure required environments and install our version:

```bash
git clone https://github.com/hkust-nlp/simpleRL-reason.git
cd train
pip install -e .
pip install word2number
```

### Reproducing SimpleRL-Zero
The minimum hardware requirement for training is 4 H/A100-80G GPUs. 

The training process leverages GRPO with Ray and vLLM for acceleration. So firstly, you need to launch the ray cluster using the command below:
```bash
# launch the master node of ray in container
ray start --head --node-ip-address 0.0.0.0 --num-gpus 4
```

```
ray job submit --address="http://127.0.0.1:8265" \
        --runtime-env-json='{
        "pip": ["ray==2.12.0", "latex2sympy2", "timeout_decorator"]
    }' -- /bin/bash examples/script/train_grpo_qwen_1.5b_math.sh

```


