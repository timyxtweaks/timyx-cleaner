# Timyx Cleaner

**Simple Windows Batch Script for Cleaning TEMP Files**

---

## Overview

Timyx Cleaner is a lightweight batch script designed to efficiently clean up temporary files and folders from the user’s TEMP directory on Windows systems. The script removes unnecessary files to free up disk space and improve system performance.

---

## Features

- Cleans `%TEMP%` directory by deleting files and subfolders.  
- Minimal dependencies — runs natively in Windows Command Prompt.  
- Handles common edge cases like locked files gracefully.  
- Provides summary output on completion.  
- Easy to audit and customize.

---

## Usage

1. Download `ocisti_temp.bat`.  
2. Run it directly by double-clicking or execute from Command Prompt.  
3. For best results, run with administrator privileges.  
4. The script will delete temp files and folders and display a completion message.

---

## Requirements

- Windows OS (tested on Windows 10 and later)  
- Native Command Prompt (no additional tools required)

---

## Limitations

- The script only cleans the current user’s TEMP folder.  
- Some files locked by running processes may not be deleted.  
- Always review script content before running in sensitive environments.

---

## License

MIT License — free to use, modify, and distribute.

---

## Author

Created by **timyx** — developer focused on clean, efficient, and reliable tooling.

