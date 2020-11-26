project('io.github.jorchube.vest', 'vala', 'c')

sources = files(
    'src/vest.vala',
    'src/testCaseDescriptor.vala',
    'src/testSuite.vala',
    'src/errors.vala',
    'src/assert.vala',
    'src/results/testSuiteResult.vala',
    'src/results/testCaseResult.vala',
    'src/results/testCaseState.vala',
)

dependencies = [
    dependency('gio-2.0'),
    dependency('gee-0.8'),
]

libvest = static_library(
    meson.project_name(),
    sources: sources,
    dependencies: dependencies,
    install: false,
)

libvest_dep = declare_dependency(
    link_with: libvest,
    include_directories: include_directories('.')
)

test_files = files(
    'test/testRunner.vala',
    'test/assertionTest.vala',
)

libvest_tests = executable(
    meson.project_name()+'.tests',
    [
        test_files
    ],
    dependencies:
    [
        dependencies,
        libvest_dep,
    ],
    install: false
)

