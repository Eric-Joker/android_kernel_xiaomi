### 本仓库不保证 abl、abi、dtb 可以正常编译或正常使用

```bash
mkdir android_kernel
cd android_kernel
repo init -u https://github.com/Eric-Joker/kernel_manifest -b main -m manet.xml
repo sync -j2
cd kernel_platform
mkdir logs
cd KernelSU
git fetch kernelsu main:main
sed -i '/^ifeq (\$(findstring \$(srctree),\$(src)),\$(srctree))$/,/^endif$/c\KSU_SRC := '"$(pwd)"'/kernel' kernel/Kbuild
cd ..
python build_with_bazel.py -t manet gki ⌈选项⌋ 2>&1 | tee logs/build_$(date +"%Y_%m_%d_%H_%M_%S").log
```

### 可选选项
`--lto=`: 始终建议为 `thin`。电脑 RAM > 24GB 且 RAM + SWAP > 36GB 可以选择为 `full`。[Link Time Optimization](https://llvm.org/docs/LinkTimeOptimization.html)

`--out_dir=out/msm-kernel-manet-gki`: 最终输出目录。

`--define=KALLSYMS_EXTRA_PASS=1`: 不声明这个也许大概可能编译会报错。

`--define=SOURCE_DATE_EPOCH=⌈时间戳⌋`: 用于可重现编译，固定时间戳。
