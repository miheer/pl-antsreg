#                                                            _
# antsreg ds app
#
# (c) 2016 Fetal-Neonatal Neuroimaging & Developmental Science Center
#                   Boston Children's Hospital
#
#              http://childrenshospital.org/FNNDSC/
#                        dev@babyMRI.org
#

import os
import subprocess

# import the Chris app superclass
from chrisapp.base import ChrisApp



class AntsReg(ChrisApp):
    """
    A plugin app for registration using ants.
    """
    AUTHORS         = 'FNNDSC (dev@babyMRI.org)'
    SELFPATH        = os.path.dirname(os.path.abspath(__file__))
    SELFEXEC        = os.path.basename(__file__)
    EXECSHELL       = 'python3'
    TITLE           = 'Ants registration'
    CATEGORY        = ''
    TYPE            = 'ds'
    DESCRIPTION     = 'A plugin app for registration using ants'
    DOCUMENTATION   = 'http://wiki'
    VERSION         = '0.1'
    LICENSE         = 'Opensource (MIT)'

    # Fill out this with key-value output descriptive info (such as an output file path
    # relative to the output dir) that you want to save to the output meta file when
    # called with the --saveoutputmeta flag
    OUTPUT_META_DICT = {}
 
    def define_parameters(self):
        """
        Define the CLI arguments accepted by this plugin app.
        """
    
        self.add_argument('--command', dest='command', type=str, optional=False,
                          help='ants shell command to be executed')

    def run(self, options):
        """
        Define the code to be run by this plugin app.
        """
        
        if options.command == None:
            print("ERROR: No command supplied. --command argument required.")
        else:
            subprocess.run(options.command.split())

if __name__ == "__main__":
    app = AntsReg()
    app.launch()







