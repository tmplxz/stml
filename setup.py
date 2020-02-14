from setuptools import setup

setup(
    name='stml',
    version='0.0.1',
    author='tmplxz',
    packages=['stml', 'tests'],
    scripts=['scripts/example.py', 'scripts/gap_filling_viewer.py'],
    include_package_data=True,
    license='LICENSE.md',
    description='Allows spatio-temporal gap filling with machine learning.',
    long_description=open('README.md').read(),
    install_requires=[
        "numpy >= 1.18.1",
        "scipy >= 1.3.0",
        "scikit-learn >= 0.21.2",
        "Pillow >= 6.0.0"
   ],
)
