# Copyright 2021 Code Intelligence GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Contains the external dependencies required to build Jazzer (but not the examples)."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_jar")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def jazzer_dependencies():
    maybe(
        http_archive,
        name = "platforms",
        sha256 = "079945598e4b6cc075846f7fd6a9d0857c33a7afc0de868c2ccb96405225135d",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/platforms/releases/download/0.0.4/platforms-0.0.4.tar.gz",
            "https://github.com/bazelbuild/platforms/releases/download/0.0.4/platforms-0.0.4.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "io_bazel_rules_kotlin",
        sha256 = "12d22a3d9cbcf00f2e2d8f0683ba87d3823cb8c7f6837568dd7e48846e023307",
        url = "https://github.com/bazelbuild/rules_kotlin/releases/download/v1.5.0/rules_kotlin_release.tgz",
    )

    maybe(
        http_archive,
        name = "com_google_glog",
        repo_mapping = {"@com_github_gflags_gflags": "@jazzer_com_github_gflags_gflags"},
        sha256 = "5a39d51a6058348e6b683f5343a24d94e01c518c7a045101045e301a27efab13",
        strip_prefix = "glog-a4a725d547a6c1329607db50af044c4fa329e07a",
        url = "https://github.com/google/glog/archive/a4a725d547a6c1329607db50af044c4fa329e07a.tar.gz",
    )

    maybe(
        http_archive,
        name = "com_google_absl",
        sha256 = "dcf71b9cba8dc0ca9940c4b316a0c796be8fab42b070bb6b7cab62b48f0e66c4",
        strip_prefix = "abseil-cpp-20211102.0",
        url = "https://github.com/abseil/abseil-cpp/archive/refs/tags/20211102.0.tar.gz",
    )

    maybe(
        http_archive,
        name = "com_github_johnynek_bazel_jar_jar",
        sha256 = "97c5f862482a05f385bd8f9d28a9bbf684b0cf3fae93112ee96f3fb04d34b193",
        strip_prefix = "bazel_jar_jar-171f268569384c57c19474b04aebe574d85fde0d",
        url = "https://github.com/johnynek/bazel_jar_jar/archive/171f268569384c57c19474b04aebe574d85fde0d.tar.gz",
    )

    maybe(
        http_archive,
        name = "com_github_jhalterman_typetools",
        build_file = Label("//third_party:typetools.BUILD"),
        sha256 = "754f46de7d4c278cee2d4dba3c09ebe08fde03d0e67fc85d700611d9cdfb7868",
        strip_prefix = "typetools-887153d2a9adf032fac9f145594d0a0248618d48",
        url = "https://github.com/jhalterman/typetools/archive/887153d2a9adf032fac9f145594d0a0248618d48.tar.gz",
    )

    maybe(
        http_archive,
        build_file = Label("//third_party:classgraph.BUILD"),
        name = "com_github_classgraph_classgraph",
        sha256 = "535159d80c163d5b4d025c402b4562c92ed2d6d963db8c6c5255c0eb2c4e9f39",
        strip_prefix = "classgraph-classgraph-4.8.128",
        url = "https://github.com/classgraph/classgraph/archive/refs/tags/classgraph-4.8.128.tar.gz",
    )

    maybe(
        http_archive,
        name = "fmeum_rules_jni",
        sha256 = "9a387a066f683a8aac4d165917dc7fe15ec2a20931894a97e153a9caab6123ca",
        strip_prefix = "rules_jni-0.4.0",
        url = "https://github.com/fmeum/rules_jni/archive/refs/tags/v0.4.0.tar.gz",
    )

    maybe(
        http_jar,
        name = "org_ow2_asm_asm",
        sha256 = "b9d4fe4d71938df38839f0eca42aaaa64cf8b313d678da036f0cb3ca199b47f5",
        url = "https://repo1.maven.org/maven2/org/ow2/asm/asm/9.2/asm-9.2.jar",
    )

    maybe(
        http_jar,
        name = "org_ow2_asm_asm_commons",
        sha256 = "be4ce53138a238bb522cd781cf91f3ba5ce2f6ca93ec62d46a162a127225e0a6",
        url = "https://repo1.maven.org/maven2/org/ow2/asm/asm-commons/9.2/asm-commons-9.2.jar",
    )

    maybe(
        http_jar,
        name = "org_ow2_asm_asm_tree",
        sha256 = "aabf9bd23091a4ebfc109c1f3ee7cf3e4b89f6ba2d3f51c5243f16b3cffae011",
        url = "https://repo1.maven.org/maven2/org/ow2/asm/asm-tree/9.2/asm-tree-9.2.jar",
    )

    maybe(
        http_archive,
        name = "jazzer_com_github_gflags_gflags",
        patches = [
            Label("//third_party:gflags-use-double-dash-args.patch"),
        ],
        sha256 = "ce2931dd537eaab7dab78b25bec6136a0756ca0b2acbdab9aec0266998c0d9a7",
        strip_prefix = "gflags-827c769e5fc98e0f2a34c47cef953cc6328abced",
        url = "https://github.com/gflags/gflags/archive/827c769e5fc98e0f2a34c47cef953cc6328abced.tar.gz",
    )

    maybe(
        http_archive,
        name = "jazzer_jacoco",
        build_file = Label("//third_party:jacoco_internal.BUILD"),
        patches = [
            Label("//third_party:jacoco-make-probe-adapter-subclassable.patch"),
            Label("//third_party:jacoco-make-probe-inserter-subclassable.patch"),
        ],
        sha256 = "4a3c65b8a8ca58ffcec77288820f557ed93125e8a0b43dd7460b776c58bb8ed9",
        strip_prefix = "jacoco-0.8.7-jazzer",
        url = "https://github.com/CodeIntelligenceTesting/jacoco/archive/v0.8.7-jazzer.tar.gz",
    )

    maybe(
        http_archive,
        name = "jazzer_libfuzzer",
        build_file = Label("//third_party:libFuzzer.BUILD"),
        sha256 = "efde37ab5a9e4fff67f8cd43b701be5ea5ddb74a3bc10e4d8e91a614070145c3",
        url = "https://github.com/CodeIntelligenceTesting/llvm-project-jazzer/releases/download/2021-11-30/jazzer-libfuzzer-2021-11-30.tar.gz",
    )
