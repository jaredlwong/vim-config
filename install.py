import os
import subprocess
import shutil

def install_vim(installation_directory):
    script_directory = os.path.dirname(os.path.abspath(__file__))

    vim_directory_source = os.path.join(script_directory, '.vim')
    vim_directory_link_name = os.path.join(installation_directory, '.vim')
    if os.path.exists(vim_directory_link_name):
        if (not os.path.islink(vim_directory_link_name) or
                os.readlink(vim_directory_link_name) != vim_directory_source):
            shutil.rmtree(vim_directory_link_name)
            os.symlink(vim_directory_source, vim_directory_link_name)

    vimrc_source = os.path.join(script_directory, '.vimrc')
    vimrc_link_name = os.path.join(installation_directory, '.vimrc')
    if os.path.exists(vimrc_link_name):
        if (not os.path.islink(vimrc_link_name) or
                os.readlink(vimrc_link_name) != vimrc_source):
            shutil.rmtree(vimrc_link_name)
            os.symlink(vimrc_source, vimrc_link_name)

    vundle_file_path = os.path.join(script_directory, '.vim', 'bundle', 'vundle')
    if not os.path.isdir(vundle_file_path):
        subprocess.call(['git', 'clone', 'https://github.com/gmarik/vundle.git',
                         os.path.join(script_directory, '.vim/bundle/vundle')])

    subprocess.call(['vim', '+BundleInstall', '+qall'])

if __name__ == '__main__':
    home_directory = os.environ['HOME']
    if not os.path.isdir(home_directory):
        print 'Error: Need to set HOME'
    install_vim(home_directory)
