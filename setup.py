# This setup.py file serves the only purpose to dynamically create a
# _meta.py file which then is imported from conf.py.

import distutils.core
from setuptools import setup
import setuptools.command.install


class meta(distutils.core.Command):

    description = "generate a _meta.py file"
    user_options = []
    meta_template = '''
__version__ = "%s"
'''

    def initialize_options(self):
        pass

    def finalize_options(self):
        pass

    def run(self):
        ver = self.distribution.get_version()
        with open("_meta.py", "wt") as f:
            print(self.meta_template % (ver), file=f)


class install(setuptools.command.install.install):
    def run(self):
        self.run_command('meta')
        super().run()


setup(
    use_scm_version=True,
    setup_requires=['setuptools_scm'],
    cmdclass = {'meta': meta, 'install': install},
)
