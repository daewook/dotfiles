# chatgpt4 wrote this for me :)

import os

def create_symlinks(folder_path):
    # List of files for which to create symlinks
    dotfiles = ['_vimrc', '_bashrc', '_bash_aliases']

    # Get the absolute path of the home directory
    home_dir = os.path.expanduser('~')

    for file in dotfiles:
        # Construct the source and destination paths
        source_path = os.path.join(folder_path, file)
        destination_path = os.path.join(home_dir, '.' + file)

        # Create the symbolic link
        os.symlink(source_path, destination_path)
        print(f"Created symlink: {destination_path} -> {source_path}")

# Get the absolute path of the directory where the script is located
folder_path = os.path.dirname(os.path.abspath(__file__))

create_symlinks(folder_path)
