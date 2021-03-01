project('io.github.jorchube.vest', 'vala', 'c')

sources = files(
    'src/vest.vala',
    'src/suite/testSuite.vala',
    'src/suite/testSuiteResult.vala',
    'src/case/testCaseDescriptor.vala',
    'src/case/testCaseResult.vala',
    'src/case/testCaseState.vala',
    'src/case/testCaseRunner.vala',
    'src/filesystem/IFileSystemWrapper.vala',
    'src/filesystem/fileSystemWrapper.vala',
    'src/methodMock/voidArglessMethodMock.vala',
    'src/methodMock/voidMethodMock.vala',
    'src/methodMock/voidMethodMockN.vala',
    'src/methodMock/arglessMethodMock.vala',
    'src/methodMock/methodMock.vala',
    'src/methodMock/methodMockN.vala',
    'src/methodMock/methodMockArguments.vala',
    'src/methodMock/objectToString.vala',
    'src/errors.vala',
    'src/assert.vala',
    'src/presenter/IPresenter.vala',
    'src/presenter/consolePresenter.vala',
    'src/presenter/xunitPresenter.vala',
)

posix_dep = meson.get_compiler('vala').find_library('posix')

dependencies = [
    posix_dep,
    dependency('gio-2.0'),
    dependency('gee-0.8'),
    dependency('libxml-2.0'),
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
    'test/vestRunner.vala',
    'test/suiteTest.vala',
    'test/assertionTest.vala',
    'test/methodMockTest.vala',
    'test/xunitPresenterTest.vala',
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

test_exe_path = meson.current_build_dir() + '/' + meson.project_name() + '.tests'

run_target(
    'run_tests',
    command: [test_exe_path],
    depends: libvest_tests
)