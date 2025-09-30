load(":image_opts.bzl", "boot_image_opts")
load(":msm_kernel_la.bzl", "define_msm_la")
load(":target_variants.bzl", "la_variants")

target_name = "pineapple"
target_arch = "pineapple"

target_arch_in_tree_modules = [
    # keep sorted
]

target_arch_consolidate_in_tree_modules = [
    # keep sorted
        "drivers/hwtracing/coresight/coresight-etm4x.ko",
        "drivers/misc/lkdtm/lkdtm.ko",
        "drivers/usb/misc/ehset.ko",
        "drivers/usb/misc/lvstest.ko",
        "kernel/locking/locktorture.ko",
        "kernel/rcu/rcutorture.ko",
        "kernel/torture.ko",
        "lib/atomic64_test.ko",
        "lib/test_user_copy.ko",
]

target_arch_kernel_vendor_cmdline_extras = [
        # do not sort
        "console=ttyMSM0,115200n8",
        "qcom_geni_serial.con_enabled=1",
        "bootconfig",
]
target_arch_board_kernel_cmdline_extras = []

target_arch_board_bootconfig_extras = []

def define_pineapple():

    _pineapple_in_tree_modules = target_arch_in_tree_modules 
    _pineapple_consolidate_in_tree_modules = target_arch_in_tree_modules + target_arch_consolidate_in_tree_modules
    kernel_vendor_cmdline_extras = list(target_arch_kernel_vendor_cmdline_extras)
    board_kernel_cmdline_extras = list(target_arch_board_kernel_cmdline_extras)
    board_bootconfig_extras = list(target_arch_board_bootconfig_extras)
    for variant in la_variants:

        if variant == "consolidate":
            mod_list = _pineapple_consolidate_in_tree_modules
        else:
            mod_list = _pineapple_in_tree_modules
            board_kernel_cmdline_extras += ["nosoftlockup"]
            kernel_vendor_cmdline_extras += ["nosoftlockup"]
            board_bootconfig_extras += ["androidboot.console=0"]

        define_msm_la(
            msm_target = target_name,
            msm_arch = target_arch,
            variant = variant,
            in_tree_module_list = list(mod_list),
            boot_image_opts = boot_image_opts(
                kernel_vendor_cmdline_extras = kernel_vendor_cmdline_extras,
                board_kernel_cmdline_extras = board_kernel_cmdline_extras,
                board_bootconfig_extras = board_bootconfig_extras,
            ),
            dpm_overlay = True,
        )
