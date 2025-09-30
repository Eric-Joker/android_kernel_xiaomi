load("//build/kernel/kleaf:kernel.bzl", "ddk_headers")
xiaomi_common_in_tree_modules = [
# keep sorted
]
xiaomi_common_consolidate_in_tree_modules = [
# keep sorted
    "kernel/sched/walt/sched-walt-debug.ko"
]

def export_xiaomi_headers():
    ddk_headers(
        name = "hwid_headers",
        hdrs = [
            "drivers/misc/hwid/hwid.h",
        ],
        includes = [
            "drivers/misc/hwid",
        ],
        visibility = ["//visibility:public"],
    )
    ddk_headers(
        name = "mi_irq_headers",
        hdrs = native.glob(["kernel/irq/*.h"]),
        includes = [
            "kernel/irq",
        ],
        visibility = ["//visibility:public"],
    )
    ddk_headers(
        name = "miev_headers",
        hdrs = [
            "include/miev/mievent.h",
        ],
        includes = [
            "include/miev", 
        ],
        visibility = ["//visibility:public"],
    )
