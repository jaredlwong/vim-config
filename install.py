import os
import subprocess
import shutil
import logging


def install_vim(installation_directory):
    logging.debug("installation directory for vim: '%s'", installation_directory)

    script_directory = os.path.dirname(os.path.abspath(__file__))
    logging.debug("script directory: '%s'", script_directory)

    vim_directory_source = os.path.join(script_directory, '.vim')
    vim_directory_link_name = os.path.join(installation_directory, '.vim')
    if (os.path.exists(vim_directory_link_name) and
            os.path.islink(vim_directory_link_name) and
            os.readlink(vim_directory_link_name) == vim_directory_source):
        logging.debug("'%s' exists and points to '%s'", vim_directory_link_name, vim_directory_source)
    else:
        if os.path.exists(vim_directory_link_name):
            shutil.rmtree(vim_directory_link_name)
        os.symlink(vim_directory_source, vim_directory_link_name)

    vimrc_source = os.path.join(script_directory, '.vimrc')
    vimrc_link_name = os.path.join(installation_directory, '.vimrc')

    if (os.path.exists(vimrc_link_name) and
            os.path.islink(vimrc_link_name) and
            os.readlink(vimrc_link_name) == vimrc_source):
        logging.debug("'%s' exists and points to '%s'", vimrc_link_name, vimrc_source)
    else:
        if os.path.exists(vimrc_link_name):
            shutil.rmtree(vimrc_link_name)
        os.symlink(vimrc_source, vimrc_link_name)

    vundle_file_path = os.path.join(script_directory, '.vim', 'bundle', 'vundle')
    if not os.path.isdir(vundle_file_path):
        cmd = ['git', 'submodule', 'update', '--init', '--recursive']
        logging.debug(' '.join(cmd))
        subprocess.call(cmd)

    cmd = ['vim', '+PluginInstall', '+qall']
    logging.debug(' '.join(cmd))
    subprocess.call(cmd)


if __name__ == '__main__':
    logging.basicConfig(level=logging.DEBUG)
    home_directory = os.environ['HOME']
    logging.debug("$HOME = '%s'", home_directory)
    if not os.path.isdir(home_directory):
        print 'Error: Need to set HOME'
    install_vim(home_directory)
