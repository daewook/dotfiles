# chatgpt4 wrote most this for me :)

import os, shutil

def create_symlinks(folder_path):
    # List of files for which to create symlinks
    dotfiles = ['_vimrc', '_bashrc', '_bash_aliases']

    # Get the absolute path of the home directory
    home_dir = os.path.expanduser('~')

    for filename in dotfiles:
        assert filename.startswith('_')
        # Construct the source and destination paths
        source_path = os.path.join(folder_path, filename)
        destination_path = os.path.join(home_dir, '.' + filename[1:])

        # If the destination file already exists, back it up and remove it
        if os.path.exists(destination_path):
            # Construct the backup file path
            backup_path = destination_path + '.bak'

            # Create a backup
            shutil.copy2(destination_path, backup_path)
            print(f"Created backup: {backup_path}")

            # Remove the original file
            os.remove(destination_path)

        # Create the symbolic link
        os.symlink(source_path, destination_path)
        print(f"Created symlink: {destination_path} -> {source_path}")

# Get the absolute path of the directory where the script is located
folder_path = os.path.dirname(os.path.abspath(__file__))

create_symlinks(folder_path)
