#!python3
#encoding=utf-8
from __future__ import print_function, division, absolute_import

import argparse
import os
import sys
import shutil

# vai pro diretório do script
# https://stackoverflow.com/a/509754
os.chdir(os.path.dirname(__file__))

parser = argparse.ArgumentParser(description='TeamViewer do Léo')
parser.add_argument('--start', '-s', action='store_true', help='Inicia o TeamViewer')
parser.add_argument('--update', '-u', action='store_true', help='Atualiza o TeamViewer')
args = parser.parse_args()


if args.update:
    os.system('download https://download.teamviewer.com/download/TeamViewerPortable.zip')
    if os.path.exists('TeamViewerPortable'):
        shutil.rmtree('TeamViewerPortable')
    os.mkdir('TeamViewerPortable')
    os.chdir('TeamViewerPortable')
    os.system('7z x ../TeamViewerPortable.zip')
    os.chdir('..')
    sys.exit(0)

if args.start:
    os.startfile("C:/dev/tvleo/TeamViewerPortable/TeamViewer.exe")
    sys.exit(0)

os.startfile('tvleo.au3')