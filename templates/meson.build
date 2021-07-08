project('some.project', 'vala', 'c')


sources = files(
)

project_dependencies = [
]

#project_executable = executable()


### where vest files are
vest_location = '../build/' # .a .vapi and .h

libvest_path = meson.current_source_dir() + '/' + vest_location
libvest_vala = meson.get_compiler('vala').find_library('io.github.jorchube.vest', dirs:[libvest_path])
libvest_c = meson.get_compiler('c').find_library('io.github.jorchube.vest', dirs:[libvest_path])
libvest_inc = include_directories(vest_location)

### create some vest test suites and add them to the testRunner.vala provided
test_files = files(
    './testSuiteTemplate.vala',
    './vestRunner.vala'
)

### define the tests executable
this_project_tests = executable(
    meson.project_name()+'.tests',
    [
        sources,
        test_files
    ],
    dependencies: [
        project_dependencies,
        dependency('gio-2.0'),
        dependency('gee-0.8'),
        dependency('libxml-2.0'),
        libvest_c,
        libvest_vala
    ],
    include_directories: libvest_inc,
    install: false
)
test_exe_path = meson.current_build_dir() + '/' + meson.project_name() + '.tests'

### define a target to run the tests:
run_target(
    'run_tests',
    command: [test_exe_path],
    depends: this_project_tests
)

