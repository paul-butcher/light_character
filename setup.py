#!/usr/bin/env python

"""The setup script."""
from glob import glob
from setuptools import setup, find_packages

with open('README.rst') as readme_file:
    readme = readme_file.read()

with open('HISTORY.rst') as history_file:
    history = history_file.read()

requirements = ['Pillow==8.0.1']

setup_requirements = ['pytest-runner', ]

test_requirements = ['pytest>=3', ]

setup(
    author="Paul Butcher",
    author_email='paul.butcher@gmail.com',
    python_requires='>=3.5',
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Natural Language :: English',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
    ],
    description="Light Character illustrates light characteristics as found on charts and light lists",
    entry_points={
        'console_scripts': [
            'light_character=light_character.cli:main',
        ],
    },
    install_requires=requirements,
    license="MIT license",
    long_description=readme + '\n\n' + history,
    include_package_data=True,
    data_files=glob('lighthouses/*/*'),
    keywords='light_character',
    name='light_character',
    packages=find_packages(include=['light_character', 'light_character.*']),
    setup_requires=setup_requirements,
    test_suite='tests',
    tests_require=test_requirements,
    url='https://github.com/paul-butcher/light_character',
    version='0.1.4',
    zip_safe=False,
)
