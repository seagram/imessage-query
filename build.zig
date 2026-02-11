const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "imessage-query",
        .root_module = b.createModule(.{
            .target = target,
            .optimize = mode,
        }),
    });

    exe.addCSourceFiles(.{
        .files = &[_][]const u8{
            "src/main.c",
            "src/utils.c",
        },
        .flags = &[_][]const u8{ "-std=c11", "-Wall", "-Wextra" },
    });

    exe.addIncludePath(b.path("include"));

    exe.linkLibC();
    exe.linkSystemLibrary("sqlite3");

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "");
    run_step.dependOn(&run_cmd.step);
}
