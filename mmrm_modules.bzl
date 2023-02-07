load(":mmrm_modules_build.bzl", "mmrm_driver_modules_entry")

MSM_MMRM_PATH = "driver"
MSM_TEST_PATH = "test"

mmrm_driver_modules = mmrm_driver_modules_entry([":mmrm_driver_headers"])
module_entry = mmrm_driver_modules.register

#--------------- MM-DRIVERS MODULES ------------------

module_entry(
    name = "msm_mmrm",
    path = MSM_MMRM_PATH + "/src",
    config_option = "CONFIG_MSM_MMRM",
    srcs = [
        "mmrm_clk_rsrc_mgr.c",
        "mmrm_clk_rsrc_mgr_sw.c",
        "mmrm_debug.c",
        "mmrm_internal.c",
        "mmrm_res_parse.c",
        "msm_mmrm.c"],
)

module_entry(
    name = "msm_test",
    path =  MSM_TEST_PATH,
    config_option = "CONFIG_MSM_MMRM",
    srcs = [
        "mmrm_test_internal.c",
        "mmrm_test.c"],
    deps = ["//techpack/mm-drivers:%b_msm_mmrm"],
)