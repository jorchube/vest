project('some.project', 'vala')


sources = files(
    'some/source.vala',
)

dependencies = [
]

some_executable = executable()


### where vest files are
vest_location = 'where/you/have/put/the/vest/files/' # .a .vapi and .h
libvest_path = meson.current_source_dir() + '/' + vest_location
libvest_vala = meson.get_compiler('vala').find_library('io.github.jorchube.vest', dirs:[libvest_path])
libvest_c = meson.get_compiler('c').find_library('io.github.jorchube.vest', dirs:[libvest_path])
libvest_inc = include_directories(vest_location)

### create some vest test suites and add them to the testRunner.vala provided
test_files = files(
    'test/someTestSuite.vala',
    'test/vestRunner.vala'
)

### define the tests executable
this_project_tests = executable(
    meson.project_name()+'.tests',
    [
        sources,
        test_files
    ],
    dependencies: [
        dependencies,
        libvest_c,
        libvest_vala
    ],
    include_directories: libvest_inc,
    install: false
)
test_exe_path = meson.current_build_dir() + '/' + meson.project_name() + '.tests'

### define a target to run the tests:
# it seems that run_target must be in the root meson.build
# for a single meson.build project:
run_target(
    'run_tests',
    command: [test_exe_path],
    depends: this_project_tests
)

# for a subprojects project:
this_project_tests = subproject('communication').get_variable('this_project_tests')
this_project_tests_exe = subproject('communication').get_variable('test_exe_path')
run_target(
    'run_this_project_tests',
    command: [this_project_tests_exe],
    depends: this_project_tests
)