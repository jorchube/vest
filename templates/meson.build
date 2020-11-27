project('some.project', 'vala')


sources = files(
    'some/source.vala',
)

dependencies = [
]

some_executable = executable()


vest_location = 'where/you/have/put/the/vest/files/' # .a .vapi and .h
libvest_path = meson.current_source_dir() + '/' + vest_location
libvest_vala = meson.get_compiler('vala').find_library('io.github.jorchube.vest', dirs:[libvest_path])
libvest_c = meson.get_compiler('c').find_library('io.github.jorchube.vest', dirs:[libvest_path])
libvest_inc = include_directories(vest_location)


test_files = files(
    'test/someTestSuite.vala',
    'test/testRunner.vala'
)

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
