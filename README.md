[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://img.shields.io/github/license/gvatsal60/CMakeTemplateDocker)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/gvatsal60/CMakeTemplateDocker/_.yml)
![GitHub pull-requests](https://img.shields.io/github/issues-pr/gvatsal60/CMakeTemplateDocker)
![GitHub Issues](https://img.shields.io/github/issues/gvatsal60/CMakeTemplateDocker)
![GitHub forks](https://img.shields.io/github/forks/gvatsal60/CMakeTemplateDocker)
![GitHub stars](https://img.shields.io/github/stars/gvatsal60/CMakeTemplateDocker)

# CMakeTemplateDocker

## Overview
Welcome to CMakeTemplateDocker! This repository provides a template for setting up a C++ project using CMake within a Docker container. This template aims to streamline the process of setting up a development environment for C++ projects, ensuring consistency and ease of use across different platforms.

## Prerequisites
Before getting started, ensure that you have the following prerequisites installed on your system:
- Docker: Install Docker according to the instructions for your operating system from [Docker's official website](https://www.docker.com/get-started).
- Git: Install Git if you haven't already from [Git's official website](https://git-scm.com/downloads).
- Make:
  - **Linux:** If you're on a Linux system, Make might already be installed. If not, you can install it using your package manager. For example, on Ubuntu, you can install Make with the following command:
    ```
    sudo apt-get install make
    ```
  - **Windows:** For Windows users, Make is not typically installed by default. You can install it using MinGW, which provides a Unix-like environment on Windows along with a collection of GNU utilities. Follow these steps to install Make on Windows using MinGW:
    1. Download and install MinGW from [MinGW's official website](http://www.mingw.org/).
    2. During installation, make sure to select the option to install the "MSYS Basic System" component, which includes Make.
    3. After installation, add the MinGW bin directory to your system's PATH environment variable. This is typically `C:\MinGW\bin`.

## Getting Started
Follow these steps to get started with CMakeTemplateDocker:

1. **Clone the Repository:**
   ```
   git clone https://github.com/yourusername/CMakeTemplateDocker.git
   cd CMakeTemplateDocker
   ```

2. **Build the Docker Image:**
   ```
   make build-image
   ```

3. **Inside the Docker Container:**
   Once inside the Docker container, you'll find yourself in the `$PROJECT_NAME` directory, where the CMake project is set up.

4. **Build the Project:**
   ```
   make docker-build
   ```

5. **Run the Executable:**
   ```
   make docker-run
   ```

6. **Test the Project:**
   ```
   make docker-test
   ```

7. **Clean the Project:**
   ```
   make docker-clean
   ```

## Customization
You can customize this template according to your project's needs. Here are some areas you might want to modify:

- **CMakeLists.txt:** Adjust CMake configuration, add or remove source files, libraries, or dependencies as needed.
- **Dockerfile:** Modify Dockerfile to include additional packages or tools required for your project.
- **Source Files:** Add your source files under the `src` directory.

## Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License
This project is licensed under the Apache 2.0 License. See the [LICENSE](https://www.apache.org/licenses/LICENSE-2.0) file for details.

## Acknowledgments
- This template is inspired by best practices in C++ project development.
- Special thanks to the CMake and Docker communities for their excellent tools and documentation.

## Contact
For any inquiries or support, feel free to contact over [Telegram ➤](https://t.me/gvatsal60) or open an issue in the repository.